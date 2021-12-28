package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.ChatSubVO;
import orange.service.ChatVO;
import orange.service.MemberVO;

@Mapper("chatMapper")
public interface ChatMapper {
	
	List<?> selectChannelList(ChatVO vo);
	
	List<?> selectChatList(ChatSubVO subVo);
	
	ChatVO selectChatInfo(ChatVO vo);
	
	int insertChatSave(ChatSubVO vo);
	
	int updateLastChat(ChatSubVO vo);
	
	int updateChatStatus(ChatSubVO subVo);
	
	MemberVO selectBuyerInfo(ChatVO vo);
	String selectSellerInfo(ChatVO vo);
	
	int checkedChat(ChatVO vo);
	
	int insertNewChat(ChatVO vo);
	
	int getNewChannel(ChatVO vo);
}
