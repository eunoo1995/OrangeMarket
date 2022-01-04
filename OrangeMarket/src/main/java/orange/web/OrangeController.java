package orange.web;


import java.net.InetAddress;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import orange.service.KeywordVO;
import orange.service.MemberVO;
import orange.service.MyPageService;
import orange.service.OrangeService;

@Controller
public class OrangeController {
	
	@Resource(name = "orangeService")
	private OrangeService orangeService;
	
	@Resource(name="myPageService")
	private MyPageService myPageService;

	@RequestMapping(value="/main")
	public String showMainPage() throws Exception {
		
		return "main/main";
	}

	@ResponseBody
	@RequestMapping(value = "/search-list", method = RequestMethod.GET)
	public HashMap<String, Object> searchList(HttpSession session, MemberVO vo, KeywordVO keyVo) throws Exception {
		// Responseentity
		HashMap<String, Object> searchObj = new HashMap<String, Object>();
		String userIp = getUserIp();
		keyVo.setSrchIp(userIp);
		
//		if(session.getAttribute("sessionId") != null)  {
//			int sessionId = (int) session.getAttribute("sessionId");
//			vo.setUserId(sessionId);
//			
//			// 회원 별 등록된 키워드 가져오기
//			List<?> myKeywordList = myPageService.selectMyKeywordList(vo);
//			System.out.println(myKeywordList.toString());
//			
//			searchObj.put("mykeyword", myKeywordList);
//		};
		
//		// 인기 검색어 가져오기 
		List<?> popularKeyword = orangeService.selectPopularKeywordList();
		searchObj.put("popkeyword", popularKeyword);
//		
//		// 최근 검색어 가져오기
		List<?> recentKeyword = orangeService.selectkeywordListByIp(keyVo);
		searchObj.put("reckeyword", recentKeyword);
		
		// System.out.println(searchObj.toString());
		
		
		return searchObj;
	}
	
	@RequestMapping(value = "/search-confirm")
	@ResponseBody
	public String searchConfirm(HttpSession session, KeywordVO vo) throws Exception {

		String msg = "err";
		String userIp = getUserIp();
		
		vo.setSrchIp(userIp);
		
		int isSearched = orangeService.selectKeywordByIp(vo);
		if(isSearched == 0) {
			int insertCnt = orangeService.insertKeyword(vo);
		} else {
			int updateCnt = orangeService.updateKeyword(vo);
		}
		
		msg = "ok";
		
		return msg;
	}
	
	public String getUserIp() throws Exception {

        String ip = null;
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

        ip = request.getHeader("X-Forwarded-For");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-RealIP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip.equals("0:0:0:0:0:0:0:1") || ip.equals("127.0.0.1")) {
        	ip = InetAddress.getLocalHost().getHostAddress();
        }

		return ip;
	}
	
}
