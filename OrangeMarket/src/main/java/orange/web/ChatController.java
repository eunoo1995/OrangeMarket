package orange.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.ChatService;
import orange.service.ChatSubVO;
import orange.service.ChatVO;

@Controller
public class ChatController {
	
	@Resource(name="chatService")
	private ChatService chatService;
	
	
	@RequestMapping(value="testLogin")
	public String sessionTest(HttpSession session) throws Exception {
		int userId = 2021121701;
		session.setAttribute("sessionId", userId);
		return "redirect:main";
	}
	
	// 게시글 상세보기 채팅버튼 누를 시 넘어오는 값을 받아 신규 채팅채널 추가
	@RequestMapping(value = "create-chat")
	public String createChat() throws Exception {
		
		// 게시글, 판매자, 구매자의 정보를 select로 받아온다.
		// 받아온 값들을 ChatVO vo에 세팅한다.
		// vo를 이용한 신규 채팅채널 insert 실행
		
		//로케이션 - 채팅 화면으로 이동시킨다.
		return "redirect:chat";
	}
	
	@RequestMapping(value = "chat")
	public String chatList(ChatVO vo,ChatSubVO subVo,
			HttpSession session, Model model) throws Exception {
		// 세션 값 이용해 해당 아이디가 판매,구매자인 채널 검색
		if(session.getAttribute("sessionId") == null) return "redirect:login";
		int sessionId = (int)session.getAttribute("sessionId");
		vo.setBuyer(sessionId);
		vo.setSeller(sessionId);
		// 채팅방 리스트 가져오기
		List<?> list = chatService.selectChannelList(vo);
		// 해당 채팅방 대화내용 가져오기
		List<?> chatList = chatService.selectChatList(subVo);
		// 해당 채팅방 정보 가져오기
		vo = chatService.selectChatInfo(vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		model.addAttribute("chatList",chatList);
		return "chat/chat";
	}
	
	@RequestMapping(value = "chat-save")
	@ResponseBody
	public String chatSave(ChatSubVO vo) throws Exception {
		// chat sub 테이블 인서트
		chatService.insertChatSave(vo);
		// chat 테이블 마지막 메시지 인서트
		String content = vo.getContent();
		if(content.length() > 12) {
			content = content.substring(0,12) + "...";
		}
		vo.setContent(content);
		chatService.updateLastChat(vo);
		String respon = vo.getChannel() +"";
		return respon;
	}
	
	@RequestMapping(value="read-chat")
	@ResponseBody
	public String readChat(ChatSubVO subVo, HttpSession session) throws Exception {
		// 해당 채팅방 미확인 메세지 업데이트
		int sessionId = (int)session.getAttribute("sessionId");
		subVo.setReceiver(sessionId);
		chatService.updateChatStatus(subVo);
		String respon = subVo.getChannel() + "";
		return respon;
	}
}
