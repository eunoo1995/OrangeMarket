package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.ReportVO;

@Mapper("reportMapper")
public interface ReportMapper {
	
	List<?> selectReportList(ReportVO vo);
	
	ReportVO selectReportDetail(ReportVO vo);
	
	int insertReprot(ReportVO vo);
}
