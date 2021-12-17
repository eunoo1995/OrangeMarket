package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.DeptVO;

@Mapper("memberMapper") 
public interface MemberMapper {


	int isMemberTel(String tel);

	int isMemberNikname(String nickname);
	

}
