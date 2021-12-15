package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.InquiryService;
import orange.service.InquiryVO;

@Service("inquiryService")
public class InquiryImpl extends EgovAbstractServiceImpl implements InquiryService{

	@Resource(name ="inquiryMapper")
	private InquiryMapper inquiryDAO;
	
	@Override
	public List<?> selectInquiryList(InquiryVO vo) throws Exception {
		return inquiryDAO.selectInquiryList(vo);
	}

	@Override
	public int insertInquiry(InquiryVO vo) throws Exception {
		return inquiryDAO.insertInquiry(vo);
	}
	
}
