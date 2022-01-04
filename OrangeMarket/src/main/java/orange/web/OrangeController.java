package orange.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.DeptVO;
import orange.service.MemberService;
import orange.service.MemberVO;
import orange.service.OrangeService;
import orange.service.ProductService;
import orange.service.ProductVO;

@Controller
public class OrangeController {
	
	@Resource(name = "orangeService")
	private OrangeService orangeService;
	
	@Resource(name="productService")
	private ProductService productService;
	
	@Resource(name="memberService")
	private MemberService memberService;

	@RequestMapping(value = "/deptList.do")
	public String deptlist(DeptVO vo, Model model) throws Exception {
		
		int deptno = 10;
		
		/*
		List<?> list = sampleService.selectDeptList();
		model.addAttribute("list", list);
		*/
		vo = orangeService.selectDeptDetail(deptno);
		model.addAttribute("vo", vo);
		
		return "dept/deptList";
	}
	

	@RequestMapping(value="/main")
	public String showMainPage(ProductVO pvo, MemberVO mvo, Model model, HttpSession session) throws Exception {
		// 최근 제품 표시용 리스트
		List<?> recent_list = productService.selectProductList(pvo);
		model.addAttribute("recentList", recent_list);
		
		// 세션 발생 시 동네 인증 여부 확인
		if( session.getAttribute("sessionId") != null ) { 
			int sessionId = (int) session.getAttribute("sessionId");
			pvo.setUserId(sessionId);
			
			// 멤버 테이블에서 주소 가져오기
			String addr = productService.selectMemberAddr(pvo);
			pvo.setAddr(addr);
			
			//동네 인증 여부 가져오기
			mvo = productService.selectAddrPass(pvo);
			
			//등록된 판매 제품 목록 리스트
			recent_list = productService.selectProductList(pvo);
			
			model.addAttribute("addrPass", mvo.getAddrPass());
			model.addAttribute("recentList", recent_list);
		}
		
		
		
		return "main/main";
	}
	
}
