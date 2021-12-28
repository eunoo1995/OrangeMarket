package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.PagingVO;
import orange.service.ReportService;
import orange.service.ReportVO;

@Service("reportService")
public class ReportImpl extends EgovAbstractServiceImpl implements ReportService{
	
	@Resource(name="reportMapper")
	private ReportMapper reportDAO;

	@Override
	public List<ReportVO> selectReportList(PagingVO vo) throws Exception {
		return reportDAO.selectReportList(vo);
	}

	@Override
	public ReportVO selectReportDetail(ReportVO vo) throws Exception {
		return reportDAO.selectReportDetail(vo);
	}

	@Override
	public int insertReport(ReportVO vo) throws Exception {
		return reportDAO.insertReport(vo);
	}

	@Override
	public int selectReportTotal(PagingVO vo) throws Exception {
		return reportDAO.selectReportTotal(vo);
	}

	@Override
	public ReportVO selectReportInfo(ReportVO vo) throws Exception {
		return reportDAO.selectReportInfo(vo);
	}

	@Override
	public String selectWriterNik(int userId) throws Exception {
		return reportDAO.selectWriterNik(userId);
	}
	
	
}
