package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	
	// 로그인 화면 출력
	@RequestMapping(value = "/admin-login")
	public String adminLogin() throws Exception {
		
		return "admin/loginWrite";
	}	
	
	// 회원 목록화면 출력 -----------------------------------------
	@RequestMapping(value = "/admin-memberlist")
	public String adminMemberList() throws Exception {
		
		return "admin/memberList";
	}
	
	// 문의하기 목록화면 출력 --------------------------------------
	@RequestMapping(value = "/admin-inquirylist")
	public String adminInquiryList() throws Exception {
		
		return "admin/inquiryList";
	}
	
	// 신고하기 목록화면 출력 --------------------------------------
	@RequestMapping(value = "/admin-reportlist")
	public String adminReportList() throws Exception {
		
		return "admin/reportList";
	}
	
}
