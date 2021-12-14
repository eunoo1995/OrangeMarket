package orange.web;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.DeptVO;
import orange.service.OrangeService;

@Controller
public class MemberController {

	@RequestMapping(value = "/login")
	public String login(){
				
		return "member/login";
	}	
}
