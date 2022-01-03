package orange.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.EmailVerifVO;
import orange.service.MemberService;
import orange.service.MemberVO;
import orange.service.TermsAgreeVO;

@Controller
public class MemberController {

	@Resource
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "login")
	public String login(HttpSession session, Model model) throws Exception {
		
		if(session.getAttribute("sessionId") != null) return "redirect:/main";

		String isRemChcked = "";
		String remEmailVal = (String) session.getAttribute("REMEBER_USER_EMAIL");
		
		if (remEmailVal != null) {
			isRemChcked = "checked";
		}
		
		model.addAttribute("remEmail", isRemChcked);

		return "member/login";
	}

	@RequestMapping(value = "login-confirm")
	@ResponseBody
	public String loginConfirm(HttpSession session, HttpServletResponse response, MemberVO vo,
			@RequestParam(value = "remEmail") String remEmail) throws Exception {

		String msg = "";

		// 로그인 입력 정보 확인
		int result = memberService.isMemberToLogin(vo);
		if (result == 0) {
			msg = "err";

			return msg;
		} else {
			vo = memberService.selectMemberLogin(vo);
			
			// 이메일 저장이 체크된 경우
			if(remEmail.equals("true")) {
				session.setAttribute("REMEBER_USER_EMAIL", vo.getEmail());
				session.setMaxInactiveInterval(60*60*24*3); // 유지시간 설정(7일)
			}
			
			// 세션 생성
			session.setAttribute("sessionId", vo.getUserId());
			session.setMaxInactiveInterval(600); // 세션 유지시간 설정 (10분: 60*10)
			
			session.setAttribute("USER_NIK", vo.getNikName());
			
			msg = "ok";
		}

		return msg;
	}

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionId");
		session.removeAttribute("USER_NIK");
		
		return "redirect:/main";
	}

	@RequestMapping(value = "join")
	public String join() {

		return "member/joinTerms";
	}

	@RequestMapping(value = "join-form")
	public String joinWrite(String l, Model model) throws Exception {
		

		// 위치정보 동의 여부
		if (l != null && l.equals("false")) {
			l = "N";
		} else if (l != null && l.equals("true")) {
			l = "Y";
		}
		
		
		// 유저 아이디 생성
		int userId = memberService.selectNewUserId();

		model.addAttribute("agreeLoc", l);
//		model.addAttribute("userId", userId);

		return "member/joinForm";
	}

	@RequestMapping(value = "check-usertel")
	@ResponseBody
	public String checkJoinTel(MemberVO vo) throws Exception {

		String msg = "";
		// 사용중인 연락처인지 확인
		int result = memberService.isMemberTel(vo.getUserPhone());

		if (result > 0) {
			msg = "exist";
		} else if (result == 0) {
			msg = "ok";
		}

		return msg;
	}

	@RequestMapping(value = "check-nikname")
	@ResponseBody
	public String checkJoinNikname(MemberVO vo) throws Exception {

		String msg = "";
		// 사용 중인 닉네임인지 확인
		int result = memberService.isMemberNikname(vo.getNikName());

		if (result > 0) {
			msg = "exist";
		} else if (result == 0) {
			msg = "ok";
		}

		return msg;
	}

	@RequestMapping(value = "check-password")
	@ResponseBody
	public String checkPassWord(MemberVO vo) throws Exception {

		String password = vo.getUserPw();
		String regPassword = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,20}$";
		String msg = "";

		// 비밀번호의 패턴이 일치하는지 확인
		if (password.matches(regPassword) == false) {
			msg = "err";
		} else {
			msg = "ok";
		}

		return msg;
	}

	@RequestMapping(value = "check-email")
	@ResponseBody
	public String checkEmail(MemberVO vo) throws Exception {

		String msg = "";

		// 사용 중인 이메일인지 확인
		int result = memberService.isMemberEmail(vo.getEmail());

		if (result > 0) {
			msg = "exist";
		} else if (result == 0) {
			msg = "ok";
		}

		return msg;
	}

	@RequestMapping(value = "send-verif-email")
	@ResponseBody
	public String SendVerifEmail(EmailVerifVO vo) throws Exception {

		// 이메일 인증 코드 생성
		String code = Integer.toString(((int) ((Math.random() * (999999 - 100000 + 1)) + 100000)));
		String msg = "";

		// 발송 이메일 세팅
		String emailTo = vo.getEmail();
		String emailFrom = "project.e.dev@gmail.com";
		String title = "회원가입시 필요한 인증번호 입니다.";
		String content = "[인증번호] " + code + " 입니다. <br/> 인증번호 확인란에 기입해주십시오.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(emailFrom);
			messageHelper.setTo(emailTo);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			vo.setEmailCode(code);

			// 이메일 인증코드 등록
			int result = memberService.insertEmailVerif(vo);
			if (result == 1) {
				System.out.println("email====> " + emailTo);
				System.out.println("code====> " + vo.getEmailCode());
//				mailSender.send(message);
			}

			msg = "ok";

		} catch (Exception e) {
			msg = "err";
		}

		return msg;
	}

	@RequestMapping(value = "check-verifcode")
	@ResponseBody
	public String checkEmailCode(EmailVerifVO vo) throws Exception {

		String msg = "";
		// 이메일 인증코드 일치 확인
		int result = memberService.selectEmailVerif(vo);

		if (result == 1) {
			msg = "ok";
		} else if (result != 1) {
			msg = "err";
		}

		return msg;
	}

	@RequestMapping(value = "insert-member")
	@ResponseBody
	public String insertMember(MemberVO memVo, EmailVerifVO emailVo, TermsAgreeVO agreeVo) throws Exception {

		String msg = "";

		List<Map<String, Object>> insertList = new ArrayList<>();
		Map<String, Object> agreeMap = new HashMap<String, Object>();

		for (int i = 0; i < 3; i++) {
			agreeMap = new HashMap<String, Object>();

			if (i != 2) {
				agreeMap.put("agree", 'Y');
			} else {
				agreeMap.put("agree", agreeVo.getAgree());
			}

			agreeMap.put("userId", memVo.getUserId());
			agreeMap.put("termCode", i + 1);

			insertList.add(agreeMap);
		}

		// 이메일 인증코드 사용여부 업데이트
		memberService.updateUseEmailCode(emailVo);

		// 약관동의 여부 등록
		memberService.insertAgreeTerms(insertList);

		// 회원상태 등록
		memberService.insertMemberStatus(memVo.getUserId());

		// 신규회원 등록
		int result = memberService.insertNewMember(memVo);

		if (result == 1) {
			// 등록 완료
			msg = "ok";
		} else if (result != 1) {
			// 등록 실패
			msg = "err";
		}

		return msg;
	}
	
	
	@RequestMapping(value = "join-result")
	public String joinResult(MemberVO vo, Model model) throws Exception {
		
		vo = memberService.selectJoinMember(vo);
		
		model.addAttribute("vo", vo);
		
		return "member/joinResult";
	}
	
	
	@RequestMapping(value = "find-pw")
	public String viewFindPw() {
		
		return "member/findPw";
	}
	
	@RequestMapping(value = "find-pw-confirm")
	@ResponseBody
	public String FindPwConfirm(MemberVO memVo, EmailVerifVO emailVo) throws Exception {
		
		String msg = "";
		
		// 이메일 인증코드 사용여부 업데이트
		memberService.updateUseEmailCode(emailVo);
		
		int result = memberService.selectFindPw(memVo);
		
		if (result == 1) {
			// 조회 성공
			msg = "ok";
		} else if (result != 1) {
			// 조회 실패
			msg = "err";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "pw-reset")
	public String ResetPw(MemberVO vo, Model model) throws Exception {
		
		model.addAttribute("email", vo.getEmail());
		
		return "member/findPwReset";
	}
	
	@RequestMapping(value = "pw-reset-confrim")
	@ResponseBody
	public String ResetPwConfirm(MemberVO vo) throws Exception {
		
		
		String msg ="";
		
		// 비밀번호 변경
		int result = memberService.updateUserPw(vo);
		
		if (result == 1) {
			// 변경 성공
			msg = "ok";
		} else if (result != 1) {
			// 변경 실패
			msg = "err";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "pw-result")
	public String ResultPw() {
		
		return "member/findPwResult";
	}
	
	@RequestMapping(value = "find-user")
	public String findUser() {
		
		return "member/findUser";
	}
	
	@RequestMapping(value = "find-user-confrim")
	@ResponseBody
	public String findUserConfirm(MemberVO vo) throws Exception {
		
		String msg ="";
		// 계정정보 확인
		int result = memberService.selectFindUser(vo);
		
		
		if (result == 1) {
			// 조회 성공
			msg = "ok";
		} else if (result != 1) {
			// 조회 실패
			msg = "err";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "find-result")
	public String findUserResult(MemberVO vo, Model model) throws Exception {
		
		String email = memberService.selectUserEmail(vo);
		
		String emailId = email.split("@")[0];
		String emailUrl = email.split("@")[1];
		
		// 이메일 아이디 *로 변환 (앞에 2글자는 보인다.)
		String frontEmailId = emailId.substring(0,2);
		String backEmailId = emailId.substring(2, emailId.length());
		backEmailId = backEmailId.replaceAll(".", "*");
		
		System.out.println("frontEmailId" + frontEmailId);
		System.out.println("backEmailId" + backEmailId);

		
		// 이메일 재조합
		String findEmail = frontEmailId + backEmailId + "@" + emailUrl;
		model.addAttribute("userEmail", findEmail);
		
		return "member/findUserResult";
	}
	
}
