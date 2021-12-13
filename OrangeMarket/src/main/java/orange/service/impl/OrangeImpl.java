package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.DeptVO;
import orange.service.OrangeService;


@Service("orangeService")
public class OrangeImpl extends EgovAbstractServiceImpl implements OrangeService {

	// TODO mybatis 사용
	@Resource(name="orangeMapper")
	private OrangeMapper orangeDAO;

	@Override
	public DeptVO selectDeptDetail(int deptno) throws Exception {
		System.out.println(deptno);
		return orangeDAO.selectDeptDetail(deptno);
	}

	@Override
	public List<?> selectDeptList() throws Exception {
		return orangeDAO.selectDeptList();
	}
	
	
}
