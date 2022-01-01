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
	
	// 문의 목록 가져오기
	int totalAdminInquiry(PagingVO vo) throws Exception;
	List<?> selectAdminInquiry(PagingVO vo) throws Exception;
	
	// 문의 상세 정보 가져오기
	InquiryVO adminInquiryInfo(InquiryVO vo) throws Exception;
	
	// 문의하기 답변 저장
	int responseInquiry(InquiryVO vo) throws Exception;
	
	// 신고 목록 가져오기
	int totalAdminReport(PagingVO vo) throws Exception;
	List<?> selectAdminReport(PagingVO vo) throws Exception;
	
	// 신고 상세 정보 가져오기
	ReportVO adminReportInfo(ReportVO vo) throws Exception;
	
	// 신고횟수 추가
	int updateReportCount(ReportVO vo) throws Exception;
	int responseReport(ReportVO vo) throws Exception;
	
	// 신고횟수 가져오기
	int countReport(ReportVO vo) throws Exception;
	
	// 5회 신고누적 시 회원 영구정지
	int overCountSuspend(ReportVO vo) throws Exception;
	
}
