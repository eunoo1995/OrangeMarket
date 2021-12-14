package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@RequestMapping(value = "chat")
	public String chatList() throws Exception {
		
		return "chat/chat";
	}
}
