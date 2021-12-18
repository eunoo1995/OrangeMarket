package orange.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.EmailVerifVO;
import orange.service.MemberVO;

@Mapper("memberMapper") 
public interface MemberMapper {


	int isMemberTel(String tel);

	int isMemberNikname(String nickname);

	int isMemberEmail(String email);

	int insertEmailVerif(EmailVerifVO vo);

	int selectEmailVerif(EmailVerifVO vo);
	

}
