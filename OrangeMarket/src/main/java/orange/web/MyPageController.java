package orange.web;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import orange.service.MemberVO;
import orange.service.MyKeywordVO;
import orange.service.MyPageService;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Controller
public class MyPageController {

	@Resource(name="myPageService")
	private MyPageService myPageService;
	
	@RequestMapping(value="/mypage")
	public String mypageMain(MemberVO vo, MyKeywordVO kvo, ProductVO pvo,
					Model model, HttpSession session) throws Exception {
 		// 세션값이 없으면 로그인 화면으로 리턴
		if(session.getAttribute("sessionId") == null) return "redirect:login";
		int sessionId = (int) session.getAttribute("sessionId");
		// 회원 정보 가져오기
		vo.setUserId(sessionId);
		vo = myPageService.selectMemberInfo(vo);
		// 회원 키워드 목록 가져오기
		kvo.setUserId(sessionId);
		List<?> keywordList = myPageService.selectMyKeywordList(kvo); 
		// 회원 관심게시글 목록 가져오기
		pvo.setLiker(sessionId);
		List<?> likeList = myPageService.selectLikeProduct(pvo);
		model.addAttribute("vo",vo);
		model.addAttribute("keywordList",keywordList);
		model.addAttribute("likeList",likeList);
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
		// 새로 저장한 프로필 업데이트
		vo.setProfileImg(profileImg);
		myPageService.updateProfile(vo);
		// 내 정보 판매자, 구매자 존재 유무 확인 후 프로필 업데이트
		int sellerCnt = myPageService.countSeller(vo);
		if(sellerCnt != 0) {
			myPageService.updateSellerProfile(vo);
		}
		int buyerCnt = myPageService.countBuyer(vo);
		if(buyerCnt != 0) {
			myPageService.updateBuyerPrifile(vo);
		}
		return "";
	}
	
	// 관심키워드 추가
	@RequestMapping(value="mykeyword-save")
	@ResponseBody
	public String addMyKeyword(MyKeywordVO vo, HttpSession session) throws Exception {
		int sessionId = (int) session.getAttribute("sessionId");
		vo.setUserId(sessionId);
		myPageService.insertMyKeyword(vo);
		return "";
	}
	
	// 관심키워드 삭제
	@RequestMapping(value="mykeyword-delete")
	public String deleteMyKeyword(MyKeywordVO vo) throws Exception {
		myPageService.deleteMyKeyword(vo);
		return "redirect:mypage";
	}
	
	// 관심게시글 삭제
	@RequestMapping(value="delete-likelist")
	public String deleteLikeList(ProductVO vo) throws Exception {
		myPageService.deleteLikeList(vo);
		return "redirect:mypage";
	}
	
	// 회원 탈퇴 팝업
	@RequestMapping(value="withdrawal")
	public String withdrawalPop(MemberVO vo,HttpSession session, Model model) throws Exception {
		vo.setUserId((int)session.getAttribute("sessionId"));
		vo = myPageService.selectMemberInfo(vo);
		
		model.addAttribute("vo",vo);
		return "mypage/withdrawal";
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value="update-withdrawal")
	@ResponseBody
	public String updateWithdrawal(MemberVO vo, HttpSession session) throws Exception {
		vo.setUserId((int)session.getAttribute("sessionId"));
		int chk = myPageService.selectPassChk(vo);
		int result = 0;
		if( chk == 1) {
			result = myPageService.updateWithdrawal(vo);
			myPageService.withdrawalDate(vo);
			session.removeAttribute("sessionId");
		}
		return result+"";
	}
	@RequestMapping(value="mypage-addr-pass")
	public String updateAddrPass(int userId) throws Exception {
		myPageService.mypageAddrPass(userId);
		
		return "redirect:mypage";
	}
	
	
}
