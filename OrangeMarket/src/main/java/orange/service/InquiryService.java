package orange.service;

import java.util.List;

public interface InquiryService {
	
	// 문의하기 목록 출력
	List<?> selectInquiryList(InquiryVO vo) throws Exception;
	
	// 문의하기 작성
	int insertInquiry(InquiryVO vo) throws Exception;
	
	// 문의하기 상세 출력
	InquiryVO selectInquiryDetail(InquiryVO vo) throws Exception;
	
}
