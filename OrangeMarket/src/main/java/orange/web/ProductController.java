package orange.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.ProductService;
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
	public String insertProduct(ProductVO vo) throws Exception {
		String msg = "fail";
		
		int result = productService.insertProduct(vo);
		
		if(result == 1) {
			msg = "ok";
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
