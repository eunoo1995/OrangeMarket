package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.DeptVO;
import orange.service.KeywordVO;
import orange.service.MemberVO;

@Mapper("orangeMapper") 
public interface OrangeMapper {
	
	DeptVO selectDeptDetail(int deptno);

	List<?> selectDeptList();
	  
	int selectKeywordByIp(KeywordVO vo);

	int insertKeyword(KeywordVO vo);

	int updateKeyword(KeywordVO vo);

	List<?> selectPopularKeywordList();

	List<?> selectkeywordListByIp(KeywordVO vo);

	List<?> selectMykeywordList(MemberVO vo);
	
}
