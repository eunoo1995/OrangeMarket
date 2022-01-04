package orange.service;

import java.util.List;

public interface OrangeService {

	DeptVO selectDeptDetail(int deptno) throws Exception;

	List<?> selectDeptList() throws Exception;
	

	int selectKeywordByIp(KeywordVO vo) throws Exception;

	int insertKeyword(KeywordVO vo) throws Exception;

	int updateKeyword(KeywordVO vo) throws Exception;

	List<?> selectPopularKeywordList();

	List<?> selectkeywordListByIp(KeywordVO vo);

}
