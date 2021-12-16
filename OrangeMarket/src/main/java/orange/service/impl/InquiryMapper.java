package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.InquiryVO;
import orange.service.PagingVO;

@Mapper("inquiryMapper")
public interface InquiryMapper {
	
	List<InquiryVO> selectInquiryList(PagingVO vo);
	
	int insertInquiry(InquiryVO vo);
	
	InquiryVO selectInquiryDetail(InquiryVO vo);
	
	int selectInquiryTotal();
}
