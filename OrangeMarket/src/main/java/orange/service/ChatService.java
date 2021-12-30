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
	
	int updateChatStatus(ChatSubVO subVo) throws Exception;
	
	// 채팅 관련 멤버 정보 가져오기
	MemberVO selectBuyerInfo(ChatVO vo) throws Exception;
	String selectSellerInfo(ChatVO vo) throws Exception;
	// 채팅방 존재 유무 확인
	int checkedChat(ChatVO vo) throws Exception;
	// 채팅방 신규 생성
	int insertNewChat(ChatVO vo) throws Exception;
	// 생성된 채팅방 채널 가져오기
	int getNewChannel(ChatVO vo) throws Exception;
}
