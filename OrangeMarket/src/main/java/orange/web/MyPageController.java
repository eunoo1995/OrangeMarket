package orange.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.MemberVO;

@Controller
public class MyPageController {

	@RequestMapping(value="/mypage")
	public String mypageMain(MemberVO vo,HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
 		if(session.getAttribute("sessionId") == null) return "redirect:login";
		int sessionId = (int) session.getAttribute("sessionId");
		vo.setUserId(sessionId);
		
		return "mypage/myPage";
	}
	
	
	@RequestMapping(value="/withdrawal")
	public String withdrawalPop() throws Exception {
		
		return "mypage/withdrawal";
	}
	
}
