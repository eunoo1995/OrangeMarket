package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.ChatService;
import orange.service.ChatSubVO;
import orange.service.ChatVO;
import orange.service.MemberVO;

@Service("chatService")
public class ChatImpl extends EgovAbstractServiceImpl implements ChatService {

	@Resource(name="chatMapper")
	private ChatMapper chatDAO;
	
	@Override
	public List<?> selectChannelList(ChatVO vo) throws Exception {
		return chatDAO.selectChannelList(vo);
	}

	@Override
	public List<?> selectChatList(ChatSubVO subVo) throws Exception {
		return chatDAO.selectChatList(subVo);
	}

	@Override
	public ChatVO selectChatInfo(ChatVO vo) throws Exception {
		return chatDAO.selectChatInfo(vo);
	}

	@Override
	public int insertChatSave(ChatSubVO vo) throws Exception {
		return chatDAO.insertChatSave(vo);
	}

	@Override
	public int updateLastChat(ChatSubVO vo) throws Exception {
		return chatDAO.updateLastChat(vo);
	}

	@Override
	public int updateChatStatus(ChatSubVO subVo) throws Exception {
		return chatDAO.updateChatStatus(subVo);
	}

	@Override
	public int insertNewChat(ChatVO vo) throws Exception {
		return chatDAO.insertNewChat(vo);
	}

	@Override
	public MemberVO selectBuyerInfo(ChatVO vo) throws Exception {
		return chatDAO.selectBuyerInfo(vo);
	}

	@Override
	public String selectSellerInfo(ChatVO vo) throws Exception {
		return chatDAO.selectSellerInfo(vo);
	}

	@Override
	public int checkedChat(ChatVO vo) throws Exception {
		return chatDAO.checkedChat(vo);
	}

	@Override
	public int getNewChannel(ChatVO vo) throws Exception {
		return chatDAO.getNewChannel(vo);
	}
	

}
