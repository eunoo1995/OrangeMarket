package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MemberController {

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
}
