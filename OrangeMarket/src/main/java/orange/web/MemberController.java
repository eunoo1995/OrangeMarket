package orange.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.MemberService;

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
			msg = "exit";
		}

		if (result == 0) {
			msg = "ok";
		}

		// System.out.println("tel: " + msg);
		return msg;
	}

	@RequestMapping(value = "check-nikname")
	@ResponseBody
	public String checkJoinNikname(@RequestParam Map<String, Object> param) throws Exception {

		String nickname = (String) param.get("nickname");
		String msg = "";
		int result = memberService.isMemberNikname(nickname);

		if (result > 0) {
			msg = "exit";
		}

		if (result == 0) {
			msg = "ok";
		}
		/* System.out.println("nikname: " + msg); */

		return msg;
	}

	@RequestMapping(value = "check-password")
	@ResponseBody
	public String checkPassWord(@RequestParam Map<String, Object> param) throws Exception {

		String password = (String) param.get("password");
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

	@RequestMapping("send-verif-email")
	@ResponseBody
	public String SendVerifEmail(@RequestParam Map<String, Object> param) throws Exception {

		int serti = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);

		String msg = "";
		String emailTo = (String) param.get("email");

		System.out.println(emailTo);

		String emailFrom = "project.e.dev@gmail.com";

		String title = "회원가입시 필요한 인증번호 입니다.";
		String content = "[인증번호] " + serti + " 입니다. <br/> 인증번호 확인란에 기입해주십시오.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(emailFrom);
			messageHelper.setTo(emailTo);
			messageHelper.setSubject(title);
			messageHelper.setText(content);

			mailSender.send(message);

			msg = Integer.toString(serti);

		} catch (Exception e) {
			msg = "err";
		}

		return msg;
	}
}
