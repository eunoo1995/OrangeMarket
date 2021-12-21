package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.InquiryService;
import orange.service.InquiryVO;
import orange.service.PagingVO;

@Service("inquiryService")
public class InquiryImpl extends EgovAbstractServiceImpl implements InquiryService{

	@Resource(name ="inquiryMapper")
	private InquiryMapper inquiryDAO;
	
	@Override
	public List<InquiryVO> selectInquiryList(PagingVO vo) throws Exception {
		return inquiryDAO.selectInquiryList(vo);
	}

	@Override
	public int insertInquiry(InquiryVO vo) throws Exception {
		return inquiryDAO.insertInquiry(vo);
	}

	@Override
	public InquiryVO selectInquiryDetail(InquiryVO vo) throws Exception {
		return inquiryDAO.selectInquiryDetail(vo);
	}

	@Override
	public int selectInquiryTotal(PagingVO vo) throws Exception {
		return inquiryDAO.selectInquiryTotal(vo);
	}

	@Override
	public String selectUserNik(int sessionId) throws Exception {
		return inquiryDAO.selectUserNik(sessionId);
	}
	
}
