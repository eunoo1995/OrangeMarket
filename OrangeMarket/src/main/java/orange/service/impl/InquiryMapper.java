package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.InquiryVO;

@Mapper("inquiryMapper")
public interface InquiryMapper {
	
	List<?> selectInquiryList(InquiryVO vo);
	
	int insertInquiry(InquiryVO vo);
	
	InquiryVO selectInquiryDetail(InquiryVO vo);
}
