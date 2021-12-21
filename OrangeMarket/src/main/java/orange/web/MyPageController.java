package orange.web;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import orange.service.MemberVO;
import orange.service.MyPageService;

@Controller
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	@RequestMapping(value="/mypage")
	public String mypageMain(MemberVO vo, Model model, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
 		if(session.getAttribute("sessionId") == null) return "redirect:login";
		int sessionId = (int) session.getAttribute("sessionId");
		vo.setUserId(sessionId);
		
		vo = myPageService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		
		return "mypage/myPage";
	}
	
	// 프로필 사진 변경
	@RequestMapping(value="change-profile")
	@ResponseBody
	public String changeProfile
	(MultipartFile[] uploadProfile ,MemberVO vo, HttpServletRequest request) throws Exception {
		// 저장경로
		String path = request.getServletContext().getRealPath("/images/profiles");
		// 기존 프로필 사진 삭제
		File delFile = new File(path + vo.getProfileImg());
		if(delFile.exists()) delFile.delete();
		// 새로 저장시킬 파일
		String profileImg = "";
		int userId = vo.getUserId();
		for(MultipartFile multipartFile : uploadProfile) {
			// 확장자 구하기
			String realName = multipartFile.getOriginalFilename();
			String ext = realName.substring(realName.lastIndexOf(".")); 
			// userId + 확장자로 파일 저장
			profileImg += userId+ext;
			File saveFile = new File(path, profileImg);
			multipartFile.transferTo(saveFile);
		}
		// 새로 저장한 파일 이름 set
		vo.setProfileImg(profileImg);
		myPageService.updateProfile(vo);
		
		return "";
	}
	
	@RequestMapping(value="/withdrawal")
	public String withdrawalPop(HttpServletRequest request) throws Exception {
		return "mypage/withdrawal";
	}
	
	
	
	
	
}
