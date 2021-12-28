package orange.service;

import java.util.List;

public interface ReportService {
	
	// 신고내역 리스트 출력
	List<ReportVO> selectReportList(PagingVO vo) throws Exception;
	
	// 신고내역 상세보기 출력
	ReportVO selectReportDetail(ReportVO vo) throws Exception;
	
	// 신고하기 작성
	int insertReport(ReportVO vo) throws Exception;
	
	// 전체 게시글 수 출력
	int selectReportTotal(PagingVO vo) throws Exception;
	
	// 신고 게시글 정보 가져오기
	ReportVO selectReportInfo(ReportVO vo) throws Exception;
	String selectWriterNik(int userId) throws Exception;
}
