package orange.web;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.DeptVO;
import orange.service.OrangeService;

@Controller
public class OrangeController {
	
	@Resource(name = "orangeService")
	private OrangeService orangeService;

	@RequestMapping(value = "/deptList.do")
	public String deptlist(DeptVO vo, Model model) throws Exception {
		
		int deptno = 20;
		
		/*
		List<?> list = sampleService.selectDeptList();
		model.addAttribute("list", list);
		*/
		vo = orangeService.selectDeptDetail(deptno);
		model.addAttribute("vo", vo);
		
		return "dept/deptList";
	}
	

	@RequestMapping(value="/main.do")
	public String showMainPage() throws Exception {
		
		return "main/main";
	}
	
	@RequestMapping(value="/productList.do")
	public String selectProductList() throws Exception {
		
		return "product/productList";
	}
	
	@RequestMapping(value="/productListDetail.do")
	public String selectProductDetail() throws Exception {
		
		return "product/productListDetail";
	}
	
	@RequestMapping(value="/productWrite.do")
	public String productWrite() throws Exception {
		
		return "product/productWrite";
	}
	
	@RequestMapping(value="/askBoardList.do")
	public String boardList() throws Exception {
		
		return "board/askBoardList";
	}
	
	@RequestMapping(value="/askBoardDetail.do")
	public String boardDetail() throws Exception {
		
		return "board/askBoardDetail";
	}
	
	@RequestMapping(value="/askBoardWrite.do")
	public String boardWrite() throws Exception {
		
		return "board/askBoardWrite";
	}
	
	@RequestMapping(value="/infoAccount.do")
	public String qnaBoardWrite() throws Exception {
		
		return "board/infoAccount";
	}

	@RequestMapping(value="/mypage.do")
	public String mypage() throws Exception {
		
		return "mypage/myPage";
	}
	
	@RequestMapping(value="withdrawal.do")
	public String withdrawal() throws Exception {
		
		return "mypage/withdrawal";
	}
	
	@RequestMapping(value="login.do")
	public String login() throws Exception {
		
		return "member/login";
	}

	@RequestMapping(value="/join.do")
	public String join() throws Exception {
		
		return "member/joinTerms";
	}
	
	@RequestMapping(value="/joinWrite.do")
	public String joinWrite() throws Exception {
		
		return "member/joinForm";
	}

	@RequestMapping(value="/joinWelcome.do")
	public String joinWelcome() throws Exception {
		
		return "member/joinResult";
	}

	@RequestMapping(value="/findUser.do")
	public String findUser() throws Exception {
		
		return "member/findUser";
	}

	@RequestMapping(value="/findUserResult.do")
	public String findUserResult() throws Exception {
		
		return "member/findUserResult";
	}

	@RequestMapping(value="/findPw.do")
	public String findPw() throws Exception {
		
		return "member/findPw";
	}

	@RequestMapping(value="/findPwReset.do")
	public String findPwReset() throws Exception {
		
		return "member/findPwReset";
	}

	@RequestMapping(value="/findPwResult.do")
	public String findPwResult() throws Exception {
		
		return "member/findPwResult";
	}
	
	@RequestMapping(value="/chat.do")
	public String chat() throws Exception {
		
		return "chat/chat";
	}
	
}
