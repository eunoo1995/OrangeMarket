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
	
	@RequestMapping(value="/product-write-save")
	@ResponseBody
	public String insertProduct(ProductVO vo) throws Exception {
		String msg = "fail";
		
		String chkData = "seller : " + vo.getSeller() + "\n"
					   + "proCategoryCode : " + vo.getProCategoryCode() + "\n"
					   + "title : " + vo.getTitle() + "\n"
					   + "keyword : " + vo.getKeyword() + "\n"
					   + "addr : " + vo.getAddr() + "\n"
					   + "price : " + vo.getPrice() + "\n"
					   + "content : " + vo.getContent() + "\n"
					   + "sellerNik : " + vo.getSellerNik();
		
		System.out.println(chkData);
		
		
		int result = productService.insertProduct(vo);
		
		if(result == 1) {
			msg = "ok";
		}
	
		System.out.println("msg : " + msg);
		
		return msg;
	}
	
}
