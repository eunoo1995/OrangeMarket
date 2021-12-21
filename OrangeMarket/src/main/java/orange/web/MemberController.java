package orange.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.EmailVerifVO;
import orange.service.MemberService;
import orange.service.MemberVO;

@Controller
public class MemberController {

	@Resource
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;

	@Resource(name = "memberService")
	private MemberService memberService;

	@RequestMapping(value = "login")
	public String login() {

		return "member/login";
	}

	@RequestMapping(value = "join")
	public String join() {

		return "member/joinTerms";
	}

	@RequestMapping(value = "join-form")
	public String joinWrite(String l, Model model) {

		model.addAttribute("agreeLoc", l);

		return "member/joinForm";
	}

	@RequestMapping(value = "check-usertel")
	@ResponseBody
	public String checkJoinTel(String tel) throws Exception {

		String msg = "";
		int result = memberService.isMemberTel(tel);

		if (result > 0) {
			msg = "exist";
		}

		if (result == 0) {
			msg = "ok";
		}

		// System.out.println("tel: " + msg);
		return msg;
	}

	@RequestMapping(value = "check-nikname")
	@ResponseBody
	public String checkJoinNikname(MemberVO vo) throws Exception {

		String msg = "";
		int result = memberService.isMemberNikname(vo.getNikName());

		if (result > 0) {
			msg = "exist";
		}

		if (result == 0) {
			msg = "ok";
		}
		/* System.out.println("nikname: " + msg); */

		return msg;
	}

	@RequestMapping(value = "check-password")
	@ResponseBody
	public String checkPassWord(MemberVO vo) throws Exception {

		String password = vo.getUserPw();
		String regPassword = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,20}$";
		String msg = "";

		System.out.println("password : " + password);

		if (password.matches(regPassword) == false) {
			msg = "err";
		} else {
			msg = "ok";
		}

		return msg;
	}
	
	@RequestMapping("check-email")
	@ResponseBody
	public String checkEmail(MemberVO vo) throws Exception {
		
		String msg = "";
		
		int result = memberService.isMemberEmail(vo.getEmail());

		if (result > 0) {
			msg = "exist";
		}

		if (result == 0) {
			msg = "ok";
		}

		return msg;
	}
	

	@RequestMapping("send-verif-email")
	@ResponseBody
	public String SendVerifEmail(EmailVerifVO vo) throws Exception {

		String code = Integer.toString( ((int) ((Math.random() * (999999 - 100000 + 1)) + 100000)) );
		String msg = "";
		
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
			
			int result = memberService.insertEmailVerif(vo);
			if(result == 1) {
				System.out.println("email====> " + emailTo );
				System.out.println("code====> " + vo.getEmailCode() );
//				mailSender.send(message);
			}

			msg = "ok";

		} catch (Exception e) {
			msg = "err";
		}
		
		return msg;
	}
	
	@RequestMapping("check-verifcode")
	@ResponseBody
	public String checkEmailCode(EmailVerifVO vo) throws Exception {
		
		String msg = "";
		int result = memberService.selectEmailVerif(vo);
	
		if(result == 1) {
			msg = "ok";
		} else if(result != 1) {
			msg = "err";
		} 
	
		System.out.println("msg check!! ==>" + msg);
		
		return msg;
	}
}
