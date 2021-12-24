package orange.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.AdminService;
import orange.service.AdminVO;

@Controller
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	
	// 로그인 화면 출력
	@RequestMapping(value = "admin-login")
	public String adminLogin() throws Exception {
		
		return "admin/loginWrite";
	}
	// 계정 존재 확인
	@RequestMapping(value = "admin-confirm-login")
	@ResponseBody
	public String confirmLogin(AdminVO vo, HttpSession session) throws Exception {
		int chkId = adminService.confirmAdminId(vo);
		int chkPass = adminService.confirmAdminPass(vo);
		if(chkId == 0) return "er1";
		if (chkPass == 0) return "er2";
		session.setAttribute("adminId", vo.getAdminId());
		return "ok";
	}
	// 관리자 로그아웃
	@RequestMapping(value = "admin-logout")
	public String adminLogout(HttpSession session) throws Exception {
		session.removeAttribute("adminId");
		return "redirect:main";
	}
	
	// 회원 목록화면 출력 -----------------------------------------
	@RequestMapping(value = "admin-memberlist")
	public String adminMemberList() throws Exception {
		
		return "admin/memberList";
	}
	
	// 문의하기 목록화면 출력 --------------------------------------
	@RequestMapping(value = "admin-inquirylist")
	public String adminInquiryList() throws Exception {
		
		return "admin/inquiryList";
	}
	
	// 신고하기 목록화면 출력 --------------------------------------
	@RequestMapping(value = "admin-reportlist")
	public String adminReportList() throws Exception {
		
		return "admin/reportList";
	}
	
}
