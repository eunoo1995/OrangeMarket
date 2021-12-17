package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.PagingVO;
import orange.service.ReportVO;

@Mapper("reportMapper")
public interface ReportMapper {
	
	List<ReportVO> selectReportList(PagingVO vo);
	
	ReportVO selectReportDetail(ReportVO vo);
	
	int insertReport(ReportVO vo);
	
	int selectReportTotal();
}
