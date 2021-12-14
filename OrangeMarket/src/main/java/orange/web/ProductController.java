package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {

	@RequestMapping(value="/product-list")
	public String productList() throws Exception {
		
		return "product/productList";
	}
	
	@RequestMapping(value="/product-write")
	public String productWrite() throws Exception {
		
		return "product/productWrite";
	}
	
}
