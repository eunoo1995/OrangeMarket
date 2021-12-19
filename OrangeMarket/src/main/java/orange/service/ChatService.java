package orange.service;

import java.util.List;

public interface ChatService {
	
	// 전체 채팅 채널 목록
	List<?> selectChannelList(ChatVO vo) throws Exception;
	
	// 선택 채널 채팅내용 목록
	List<?> selectChatList(ChatSubVO subVo) throws Exception;
	
	// 선택 채널 정보 VO
	ChatVO selectChatInfo(ChatVO vo) throws Exception;
	
	// 채팅 대화 내용 저장
	int insertChatSave(ChatSubVO vo) throws Exception;
	
	// 마지막 대화 내용 저장
	int updateLastChat(ChatSubVO vo) throws Exception;
}
