package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping(value="/history")
	public String history() throws Exception {
		
		return "mypage/history";
	}
	
}
