package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.ReportService;
import orange.service.ReportVO;

@Service("reportService")
public class ReportImpl extends EgovAbstractServiceImpl implements ReportService{
	
	@Resource(name="reportMapper")
	private ReportMapper reportDAO;

	@Override
	public List<?> selectReportList(ReportVO vo) throws Exception {
		return reportDAO.selectReportList(vo);
	}

	@Override
	public ReportVO selectReportDetail(ReportVO vo) throws Exception {
		return reportDAO.selectReportDetail(vo);
	}

	@Override
	public int insertReprot(ReportVO vo) throws Exception {
		return reportDAO.insertReprot(vo);
	}
	
	
}
