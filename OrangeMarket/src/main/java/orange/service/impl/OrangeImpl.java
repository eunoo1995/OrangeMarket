package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.DeptVO;
import orange.service.KeywordVO;
import orange.service.MemberVO;
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
	

	@Override
	public int selectKeywordByIp(KeywordVO vo) throws Exception {
		return orangeDAO.selectKeywordByIp(vo);
	}

	@Override
	public int insertKeyword(KeywordVO vo) throws Exception {
		return orangeDAO.insertKeyword(vo);
	}

	@Override
	public int updateKeyword(KeywordVO vo) throws Exception {
		return orangeDAO.updateKeyword(vo);
	}

	@Override
	public List<?> selectPopularKeywordList() {
		return orangeDAO.selectPopularKeywordList();
	}

	@Override
	public List<?> selectkeywordListByIp(KeywordVO vo) {
		return orangeDAO.selectkeywordListByIp(vo);
	}

	@Override
	public List<?> selectMykeywordList(MemberVO vo) {
		return orangeDAO.selectMykeywordList(vo);
	}
	
	
	
}
