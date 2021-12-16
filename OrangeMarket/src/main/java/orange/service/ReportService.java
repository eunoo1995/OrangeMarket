package orange.service;

import java.util.List;

public interface ReportService {
	
	// 신고내역 리스트 출력
	List<?> selectReportList(ReportVO vo) throws Exception;
	
	// 신고내역 상세보기 출력
	ReportVO selectReportDetail(ReportVO vo) throws Exception;
	
	// 신고하기 작성
	int insertReprot(ReportVO vo) throws Exception;
}
