package orange.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.MemberVO;
import orange.service.MyPageService;

@Controller
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	@RequestMapping(value="/mypage")
	public String mypageMain(MemberVO vo, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
 		if(session.getAttribute("sessionId") == null) return "redirect:login";
		int sessionId = (int) session.getAttribute("sessionId");
		vo.setUserId(sessionId);
		
		vo = myPageService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		
		return "mypage/myPage";
	}
	
	
	@RequestMapping(value="/withdrawal")
	public String withdrawalPop() throws Exception {
		
		return "mypage/withdrawal";
	}
	
}
