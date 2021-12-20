package orange.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.MemberVO;

@Mapper("myPageMapper")
public interface MyPageMapper {
	
	MemberVO selectMemberInfo(MemberVO vo);
}
