package orange.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import orange.service.ProductService;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Controller
public class ProductController {
	
	@Resource(name="productService")
	private ProductService productService;

	// 제품 리스트 표시 및 상세 보기 기능
	@RequestMapping(value="/product-list")
	public String productList(ProductVO vo, Model model) throws Exception {
		
		//등록된 판매 제품 목록 리스트
		List<?> list = productService.selectProductList(vo);
		
		
		model.addAttribute("list", list);
		
		return "product/productList";
	}
	
	@RequestMapping(value="/product-list-detail")
	public String selectProductDetail(ProductVO vo, Model model) throws Exception {
		vo = productService.selectProductDetail(vo);
		model.addAttribute("product", vo);
		
		return "product/productDetail";
	}
	
	@RequestMapping(value="/product-write")
	public String productWrite() throws Exception {
		
		return "product/productWrite";
	}
	
	
	//제품 등록 기능 및 저장
	@RequestMapping(value="/product-write-save")
	@ResponseBody
	public String insertProduct(ProductVO vo, ProductSubVO svo, MultipartFile[] uploadProductImg, HttpServletRequest request) throws Exception {
		
		String msg = "ok";
		 // 한글 인식
		 String title = new String(vo.getTitle().getBytes("8859_1"), "UTF-8");
		 String keyword = new String(vo.getKeyword().getBytes("8859_1"), "UTF-8");
		 String addr = new String(vo.getAddr().getBytes("8859_1"), "UTF-8");
		 String content = new String(vo.getContent().getBytes("8859_1"), "UTF-8");
		 String sellerNik = new String(vo.getSellerNik().getBytes("8859_1"), "UTF-8");
		 
		 // 데이터 입력
		 vo.setTitle(title);
		 vo.setKeyword(keyword);
		 vo.setAddr(addr);
		 vo.setContent(content);
		 vo.setSellerNik(sellerNik);
		
		 // 저장경로
		 String path = request.getServletContext().getRealPath("/images/products");
		 // 기존 프로필 사진 삭제
		 //File delFile = new File(path + svo.getImgs());
		 //if(delFile.exists()) delFile.delete();
		 // 새로 저장시킬 파일
		 String imgs = "";
		 int proCode = vo.getProCode();
		 
		 for(MultipartFile multipartFile : uploadProductImg) {
			 // 확장자 구하기
			 String realName = multipartFile.getOriginalFilename();
			 String ext = realName.substring(realName.lastIndexOf(".")); 
			 // userId + 확장자로 파일 저장
			 imgs += proCode+ext;
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
	public String selectproductModify(ProductVO vo, Model model) throws Exception{
		
		vo = productService.selectProductModify(vo);
		model.addAttribute("product", vo);
		
		return "product/productModify";
	}
	
}
