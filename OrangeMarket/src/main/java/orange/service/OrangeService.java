package orange.service;

import java.util.List;

public interface OrangeService {

	DeptVO selectDeptDetail(int deptno) throws Exception;

	List<?> selectDeptList() throws Exception;

}
