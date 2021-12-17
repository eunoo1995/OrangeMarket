package orange.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="check-username")
	@ResponseBody
	public String checkJoinTel(String tel) throws Exception {
		
		String msg = "";
		int result = memberService.isMemberTel(tel);
		
		if(result != 0) {
			msg = "exit";
		}
		
		if(result == 0) {
			msg = "ok";
		}
		
		System.out.println("tel: " + msg);
		
		
		return msg;
	}
	
	@RequestMapping(value="check-nikname")
	@ResponseBody
	public String checkJoinNikname(String nickname) throws Exception {
		
		String msg = "";
		int result = memberService.isMemberNikname(nickname);
		
		if(result != 0) {
			msg = "exit";
		}
		
		if(result == 0) {
			msg = "ok";
		}
		
		System.out.println(msg);
		
		
		return msg;
	}
}
