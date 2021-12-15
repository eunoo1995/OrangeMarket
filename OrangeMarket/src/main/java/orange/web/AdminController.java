package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin-login")
	public String adminLogin() throws Exception {
		
		return "admin/loginWrite";
	}	
	
	@RequestMapping(value = "/admin-memberlist")
	public String adminMemberList() throws Exception {
		
		return "admin/memberList";
	}
	
	@RequestMapping(value = "/admin-inquirylist")
	public String adminInquiryList() throws Exception {
		
		return "admin/inquiryList";
	}
	
	@RequestMapping(value = "/admin-reportlist")
	public String adminReportList() throws Exception {
		
		return "admin/reportList";
	}
	
}
