package orange.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.ChatService;
import orange.service.ChatSubVO;
import orange.service.ChatVO;
import orange.service.MemberVO;
import orange.service.ProductVO;

@Controller
public class ChatController {
	
	@Resource(name="chatService")
	private ChatService chatService;
	
	
	// 게시글 상세보기 채팅버튼 누를 시 넘어오는 값을 받아 신규 채팅채널 추가
	@RequestMapping(value = "create-chat")
	@ResponseBody
	public String createChat(ChatVO vo, MemberVO mvo, HttpSession session) throws Exception {
		int buyer = (int)session.getAttribute("sessionId");
		vo.setBuyer(buyer);
		mvo = chatService.selectBuyerInfo(vo);
		if(mvo.getAddrPass().equals("N")) return "notAddr";
		String sellerProfile = chatService.selectSellerInfo(vo);
		vo.setBuyerNik(mvo.getNikName());
		vo.setBuyerProfile(mvo.getProfileImg());
		vo.setSellerProfile(sellerProfile);
		int checked = chatService.checkedChat(vo);
		if(checked == 1) return "exist";
		chatService.insertNewChat(vo);
		int channel = chatService.getNewChannel(vo);
		return channel + "";
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
	
	// 게시물 예약하기
	@RequestMapping(value="reserve-product")
	@ResponseBody
	public String reserveProduct(ChatVO vo) throws Exception {
		String result = vo.getBuyerNik();
		int confirm = chatService.confirmBuyer(vo);
		if(confirm != 0) {
			result = "exist";
			return result;
		}
		chatService.updateBuyerInfo(vo);
		return result;
	}
}
