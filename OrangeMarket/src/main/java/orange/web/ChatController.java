package orange.web;

import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

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
	public String chatList(ChatVO vo,ChatSubVO subVo, Model model) throws Exception {
		// 세션 값 이용해 해당 아이디가 판매,구매자인 채널 검색
		vo.setBuyer(2021121701);
		vo.setSeller(2021121701);
		
		List<?> list = chatService.selectChannelList(vo);
		List<?> chatList = chatService.selectChatList(subVo);
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
		vo.setPrice(vo.getPrice().replace(",", ""));
		int rs1 = chatService.insertChatSave(vo);
		// chat 테이블 마지막 메시지 인서트
		int rs2 = chatService.updateLastChat(vo);
		String respon = vo.getChannel() +"";
		return respon;
	}
}
