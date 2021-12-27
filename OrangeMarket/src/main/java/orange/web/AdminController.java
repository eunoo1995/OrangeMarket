package orange.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.AdminService;
import orange.service.AdminVO;
import orange.service.PagingVO;

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
	public String adminMemberList(PagingVO vo, Model model) throws Exception {
		String word = vo.getWord();
		int total = adminService.totalMemberList(vo);
		int pageNo = vo.getPageNo();
		vo = new PagingVO(total, pageNo, 5);
		vo.setWord(word);
		
		List<?> list = adminService.selectMemberList(vo);
		model.addAttribute("page",vo);
		model.addAttribute("list",list);
		return "admin/memberList";
	}
	
	@RequestMapping(value = "member-suspend")
	public String suspendMember(int userId) throws Exception {
		// 회원 상태 정지로 변경
		adminService.updateMemberState(userId);
		// 회원 상태 변경일 저장
		adminService.updateMemberDate(userId);
		return "redirect:admin-memberlist";
	}
	
	// 정지회원 목록화면 출력 --------------------------------------
	@RequestMapping(value = "admin-suspendlist")
	public String suspendMemberList(PagingVO vo, Model model) throws Exception {
		String word = vo.getWord();
		int total = adminService.totalSuspendList(vo);
		int pageNo = vo.getPageNo();
		vo = new PagingVO(total, pageNo, 5);
		vo.setWord(word);
		
		List<?> list = adminService.selectSuspendList(vo);
		model.addAttribute("page",vo);
		model.addAttribute("list",list);
		return "admin/suspendList";
	}
	
	@RequestMapping(value = "member-unlock")
	public String unlockMember(int userId) throws Exception {
		adminService.updateUnlock(userId);
		return "redirect:admin-suspendlist";
	}
	
	// 탈퇴회원 목록화면 출력 --------------------------------------
	@RequestMapping(value = "admin-withdrawallist")
	public String withdrawalList(PagingVO vo, Model model) throws Exception {
		String word = vo.getWord();
		int total = adminService.totalWithdrawal(vo);
		int pageNo = vo.getPageNo();
		vo = new PagingVO(total, pageNo, 5);
		vo.setWord(word);
		
		List<?> list = adminService.selectWithdrawal(vo);
		model.addAttribute("page",vo);
		model.addAttribute("list",list);
		
		return "admin/withdrawalList";
	}
	
	@RequestMapping(value = "member-restore")
	public String restoreMember(int userId) throws Exception {
		adminService.updateRestore(userId);
		return "redirect:admin-withdrawallist";
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
	
	// 카테고리 목록편집 화면 출력 -----------------------------------
	@RequestMapping(value = "category-modify")
	public String editCategory() throws Exception {
		
		return "admin/categoryModify";
	}
}
