package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.DeptVO;

@Mapper("orangeMapper") 
public interface OrangeMapper {
	
	DeptVO selectDeptDetail(int deptno);

	List<?> selectDeptList();
	  

}
