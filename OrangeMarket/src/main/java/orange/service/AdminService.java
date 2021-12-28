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
	int updateMemberDate(int userId) throws Exception;
	
	//정지 회원 리스트 출력
	int totalSuspendList(PagingVO vo) throws Exception;
	List<?> selectSuspendList(PagingVO vo) throws Exception;
	// 회원 정지 해제
	int updateUnlock(int userId) throws Exception;
	
	// 탈퇴 회원 리스트 출력
	int totalWithdrawal(PagingVO vo) throws Exception;
	List<?> selectWithdrawal(PagingVO vo) throws Exception;
	// 탈퇴 회원 복구
	int updateRestore(int userId) throws Exception;
	
}
