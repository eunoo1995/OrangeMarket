package orange.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.MemberService;



@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "login")
	public String login(){
				
		return "member/login";
	}
	
	@RequestMapping(value = "join")
	public String join(){
				
		return "member/joinTerms";
	}
	
	@RequestMapping(value = "join-form")
	public String joinWrite(String l, Model model){
		
		model.addAttribute("agreeLoc", l);
		
				
		return "member/joinForm";
	}
	
	@RequestMapping(value="check-user-name")
	public String checkJoinTel(String tel) throws Exception {
		
		String msg = "";
		int result = memberService.isMemberTel(tel);
		
		System.out.println(result);
		
		
		return msg;
	}
}
