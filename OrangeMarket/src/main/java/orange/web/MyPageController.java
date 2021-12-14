package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageController {

	@RequestMapping(value="/mypage")
	public String mypageMain() throws Exception {
		
		return "mypage/myPage";
	}
	
	@RequestMapping(value="/trade-history")
	public String history() throws Exception {
		
		return "mypage/tradeHistory";
	}
	
}
