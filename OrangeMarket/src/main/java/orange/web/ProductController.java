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
	public String insertProduct(ProductVO vo, ProductSubVO svo, MultipartFile[] uploadProfile, HttpServletRequest request) throws Exception {
		
		String msg = "fail";
		
		 String title = new String(vo.getTitle().getBytes("8859_1"), "UTF-8");
		 vo.setTitle(title);
		
		int save_result = productService.insertProduct(vo);
		
		if(save_result == 1) {
//			// 저장 경로
//			String path = request.getServletContext().getRealPath("/images/products");
//			
//			// 저장
//			String productImg = "";
//			int proCode = vo.getProCode();
//			for(MultipartFile multipartFile : uploadProfile) {
//				System.out.println("멀티파트파일 들어옴");
//				// 확장자 구하기
//				String realName = multipartFile.getOriginalFilename();
//				String ext = realName.substring(realName.lastIndexOf(".")); 
//				// userId + 확장자로 파일 저장
//				productImg += proCode+ext;
//				File saveFile = new File(path, productImg);
//				multipartFile.transferTo(saveFile);
//			}
//			// 이미지 정보 저장
//			System.out.println(productImg);
//			svo.setImgs(productImg);
//			int img_result = productService.insertProImg(svo);
//			
//			if(img_result == 1) msg = "ok";
//			else msg = "img_fail";
			msg="ok";
		}
	
		System.out.println("msg : " + msg);
		
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
