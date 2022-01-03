package orange.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import orange.service.MemberService;
import orange.service.MemberVO;
import orange.service.ProductService;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Controller
public class ProductController {
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	// 제품 리스트 표시 및 상세 보기 기능
	@RequestMapping(value="/product-list")
	public String productList(ProductVO vo, Model model, HttpSession session) throws Exception {
		String category = "전체 목록";
		
		if(vo.getProCategoryCode() == 0) { 
			model.addAttribute("category", category);
			
			if(session.getAttribute("sessionId") == null) {
				//등록된 판매 제품 목록 리스트
				List<?> list = productService.selectProductList(vo);
				model.addAttribute("list", list);
				
				System.out.println("세션 없음");
			} else {
				int sessionId = (int) session.getAttribute("sessionId");
				model.addAttribute("userId", sessionId);
				
				//등록된 판매 제품 목록 리스트
				List<?> list = productService.selectProductList(vo);
				model.addAttribute("list", list);

				System.out.println("sessionId : " + sessionId);
			}
		} else {
			category = productService.selectProCategory(vo);
			model.addAttribute("category", category);
			
			if(session.getAttribute("sessionId") == null) {
				//등록된 판매 제품 목록 리스트
				List<?> list = productService.selectProductCategoryList(vo);
				model.addAttribute("list", list);
				
				System.out.println("세션 없음");
			} else {
				int sessionId = (int) session.getAttribute("sessionId");
				model.addAttribute("userId", sessionId);
				
				//등록된 판매 제품 목록 리스트
				List<?> list = productService.selectProductCategoryList(vo);
				model.addAttribute("list", list);

				System.out.println("sessionId : " + sessionId);
			}
		}
		
		return "product/productList";
	}
	
	// 제품 정보 상세보기
	@RequestMapping(value="/product-list-detail")
	public String selectProductDetail(ProductVO vo, Model model, HttpSession session) throws Exception {
		int chatCnt = productService.selectChatCount(vo);
		int likeAllCnt = productService.selectLikeAllCount(vo);
	
		// 세션값이 없으면 로그인 화면으로 리턴
		if(session.getAttribute("sessionId") == null) {
			productService.updateProductHits(vo);
			model.addAttribute("userId", null);
			
			vo = productService.selectProductDetail(vo);
			vo.setChatCnt(chatCnt);
			vo.setLikeAllCnt(likeAllCnt);
			
			model.addAttribute("product", vo);
			
		} else {
			productService.updateProductHits(vo);
			int sessionId = (int) session.getAttribute("sessionId");
			model.addAttribute("userId", sessionId);
			
			vo.setUserId(sessionId);
			int likeCnt = productService.selectLikeCount(vo);
			model.addAttribute("likeCnt", likeCnt);
			
			vo = productService.selectProductDetail(vo);
			vo.setChatCnt(chatCnt);
			vo.setLikeAllCnt(likeAllCnt);
			
			model.addAttribute("product", vo);
		}
		
		return "product/productDetail";
	}
	
	// 제품 등록
	@RequestMapping(value="/product-write")
	public String productWrite(ProductVO vo, Model model, HttpSession session) throws Exception {
		int seller = (int) session.getAttribute("sessionId");
		vo.setSeller(seller);
		vo = productService.selectProductAddr(vo);
		String addr = vo.getAddr();
		
		List<?> list = productService.selectCategoryList(vo);
		
		model.addAttribute("seller", seller);
		model.addAttribute("addr", addr);
		model.addAttribute("list", list);
		
		return "product/productWrite";
	}
	
	
	//제품 등록 기능 및 저장
	@RequestMapping(value="/product-write-save")
	@ResponseBody
	public String insertProduct(ProductVO vo, MultipartFile[] uploadProductImg, HttpServletRequest request) throws Exception {
		
		String msg = "ok";
		
		 // 한글 인식
		 String title = new String(vo.getTitle().getBytes("8859_1"), "UTF-8");
		 String keyword = new String(vo.getKeyword().getBytes("8859_1"), "UTF-8");
		 String addr = new String(vo.getAddr().getBytes("8859_1"), "UTF-8");
		 String content = new String(vo.getContent().getBytes("8859_1"), "UTF-8");
		
		 // 데이터 입력
		 vo.setTitle(title);
		 vo.setKeyword(keyword);
		 vo.setAddr(addr);
		 vo.setContent(content);
		 
		 // 저장경로
		 String path = request.getServletContext().getRealPath("/images/products");
		 // 기존 프로필 사진 삭제
		 //File delFile = new File(path + svo.getImgs());
		 //if(delFile.exists()) delFile.delete();
		 
		 // 새로 저장시킬 파일
		 int seller = vo.getSeller();
		 String imgs = "";
		 
		 // 이미지 뒤 붙일 번호
		 int seller_cnt = productService.selectSellerCount(vo);
		 
		 if(seller_cnt == 0) seller_cnt = 1;
		 else seller_cnt += 1;
		 
		 for(MultipartFile multipartFile : uploadProductImg) {
			 // 확장자 구하기
			 String realName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
			 String ext = realName.substring(realName.lastIndexOf(".")); 
			 // userId + 확장자로 파일 저장
			 imgs += seller + "" +seller_cnt + ext;
			 File saveFile = new File(path, imgs);
			 multipartFile.transferTo(saveFile);
		 }
		
		 // 이미지 세팅 및 저장
		 vo.setImgs(imgs);
		 productService.insertProduct(vo);
			
		return msg;
	}
	
	
	// 제품 정보 수정 및 저장
	@RequestMapping(value="/product-modify")
	public String selectproductModify(ProductVO vo, Model model, HttpSession session) throws Exception{
		int seller = (int) session.getAttribute("sessionId");
		vo.setSeller(seller);
		
		vo = productService.selectProductModify(vo);
		List<?> list = productService.selectCategoryList(vo);
		model.addAttribute("product", vo);
		model.addAttribute("list", list);
		
		return "product/productModify";
	}
	
	//제품 등록 기능 및 저장
	@RequestMapping(value="/product-modify-save")
	@ResponseBody
	public String updateProduct(ProductVO vo, MultipartFile[] uploadProductImg, HttpServletRequest request, String preImgs) throws Exception {
		int proCode = vo.getProCode();
		// 이미지
		MultipartFile multipartFile = uploadProductImg[0];
		String imgs = preImgs;
		
		// 한글 인식
		String title = new String(vo.getTitle().getBytes("8859_1"), "UTF-8");
		String keyword = new String(vo.getKeyword().getBytes("8859_1"), "UTF-8");
		String addr = new String(vo.getAddr().getBytes("8859_1"), "UTF-8");
		String content = new String(vo.getContent().getBytes("8859_1"), "UTF-8");
		
		 // 데이터 입력
		 vo.setTitle(title);
		 vo.setKeyword(keyword);
		 vo.setAddr(addr);
		 vo.setContent(content);
		
		// 이미지 유무 확인
		if(multipartFile.isEmpty()) { // 이미지 교체하지 않고 본문만 수정할 경우
			System.out.println("데이터 없음" + "\n" + "기존 이미지 : " + imgs);
			vo.setImgs(imgs);
		} else { // 이미지 파일을 새로 넣을 경우
			// 저장할 위치
			String path = request.getServletContext().getRealPath("/images/products");
			
			// 이미지 파일이 존재할 경우 제거
			File delFile = new File(path + vo.getImgs());
			if(delFile.exists()) delFile.delete();

			// 이미지명 세팅 (저장되어 있는 사진)
			String ext = preImgs.substring(preImgs.lastIndexOf("."));
			String imgName = preImgs.replace(ext, "");
			// 이미지명 가져오기 (저장할 사진)
			String realName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"), "UTF-8");
			String extOrg = realName.substring(realName.lastIndexOf(".")); 
			
			imgs = imgName + extOrg;
			
			// 이미지 파일 저장
			File saveFile = new File(path, imgs);
			multipartFile.transferTo(saveFile);
			
			vo.setImgs(imgs);
			System.out.println(path + imgs);
		}
		// 업데이트 구문 작성
		productService.updateProduct(vo);
		
		return proCode+"";
	}
	
	
	// 등록 제품 삭제
	@RequestMapping(value="/product-delete")
	public String deleteProduct(ProductVO vo, HttpServletRequest request) throws Exception {
		
		vo = productService.selectProductDetail(vo);
		String imgs = vo.getImgs();
		
		int result = productService.deleteProduct(vo);
		
		if(result == 1) {
			String path = request.getServletContext().getRealPath("/images/products/");
			// 이미지 파일이 존재할 경우 제거
			File delFile = new File(path + imgs);
			if(delFile.exists()) delFile.delete();
		
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		
		return "redirect:product-list";
	}
	
	// 관심 상품 등록 기능
	@RequestMapping(value="/like-product-save")
	@ResponseBody
	public String insertLikeProduct(ProductVO vo) throws Exception {
		String msg = "ok"; 
		
		int likeCnt = productService.selectLikeCount(vo);
	
		if(likeCnt >= 1) {
			msg = "already";
		} else {
			// 관심 제품 등록		
			productService.insertLikeProduct(vo);
		}
		
		return msg;
	}
	
	// 사용자의 제품 판매 리스트
	@RequestMapping(value="/sell-history")
	public String selectSellHistory(ProductVO vo, Model model, HttpSession session) throws Exception {
		if(session.getAttribute("sessionId") == null ) return "redirect:login";
		int sessionId = (int) session.getAttribute("sessionId");
		
		vo.setSeller(sessionId);
		
		//리스트 총 갯수 카운트 구문 추가 작업
		//페이징 추가 작업
		
		
		List<?> sell_list = productService.selectSellProductList(vo);
		List<?> category_list = productService.selectCategoryList(vo);
		
		model.addAttribute("sell", sell_list);
		model.addAttribute("category", category_list);
		
		return "mypage/sellHistory";
	}
	
	// 사용자의 제품 구매 리스트
	@RequestMapping(value="/buy-history")
	public String selectBuyHistory(ProductVO vo, Model model, HttpSession session) throws Exception {
		if(session.getAttribute("sessionId") == null ) return "redirect:login";
		int sessionId = (int) session.getAttribute("sessionId");
		
		vo.setBuyer(sessionId);
		
		//리스트 총 갯수 카운트 구문 추가 작업
		//페이징 추가 작업
		List<?> buy_list = productService.selectBuyProductList(vo);
		List<?> category_list = productService.selectCategoryList(vo);
		
		model.addAttribute("buy", buy_list);
		model.addAttribute("category", category_list);
		
		return "mypage/BuyHistory";
	}
	
	//셀렉 상자 상태 변경 시 디비값 변경 구문 추가 작업
	@RequestMapping(value="update-product-status")
	public String updateProductStatus(ProductVO vo) throws Exception {
		if(vo.getStatus() != null) {
			productService.updateProductStatus(vo);
		}
		
		return "redirect:sell-history";
	}
	
	// 거래 후 판매자 평가
	@RequestMapping(value="/update-user-level")
	public String updateUserLevel(ProductVO vo, String stat) throws Exception {
		vo = productService.selectProductDetail(vo);
		
		if(stat.equals("good") || stat == "good") {
			//멤버 테이블 유저 레벨 +1 후, 리뷰 테이블에 기록
			productService.updateUserLevelGood(vo);
			productService.insertReviewGood(vo);
		} else if(stat.equals("bad") || stat == "bad") {
			//멤버 테이블 유저 레벨 -1 후, 리뷰 테이블에 기록
			productService.updateUserLevelBad(vo);
			productService.insertReviewBad(vo);
		}
		
		return "redirect:buy-history";
	}
	
}
