package orange.service;

import java.util.List;

public interface AdminService {
	
	// 관리자 계정 유무 체크
	int confirmAdminId(AdminVO vo) throws Exception;
	int confirmAdminPass(AdminVO vo) throws Exception;
	
	// 회원 리스트 출력
	int totalMemberList(PagingVO vo) throws Exception;
	List<?> selectMemberList(PagingVO vo) throws Exception;
	// 회원 상태 정지
	int updateMemberState(int userId) throws Exception;
	
}
