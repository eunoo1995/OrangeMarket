package orange.service;

public interface MemberService {

	int isMemberTel(String tel) throws Exception;

	int isMemberNikname(String nickname) throws Exception;

	int isMemberEmail(String email) throws Exception;
	
	int insertEmailVerif(EmailVerifVO vo) throws Exception;
	
	int selectEmailVerif(EmailVerifVO vo) throws Exception;

	int insertNewMember(MemberVO vo) throws Exception;
	
	int updateUseEmailCode(EmailVerifVO vo) throws Exception;

}
