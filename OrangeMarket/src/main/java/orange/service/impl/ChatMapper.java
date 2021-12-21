package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.ChatSubVO;
import orange.service.ChatVO;

@Mapper("chatMapper")
public interface ChatMapper {
	
	List<?> selectChannelList(ChatVO vo);
	
	List<?> selectChatList(ChatSubVO subVo);
	
	ChatVO selectChatInfo(ChatVO vo);
	
	int insertChatSave(ChatSubVO vo);
	
	int updateLastChat(ChatSubVO vo);
	
	int updateChatStatus(ChatSubVO subVo);
}
