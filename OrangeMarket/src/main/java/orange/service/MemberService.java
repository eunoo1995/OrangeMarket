package orange.service;

public interface MemberService {

	int isMemberTel(String tel) throws Exception;

	int isMemberNikname(String nickname);

	int isMemberEmail(String email);
	
	int insertEmailVerif(EmailVerifVO vo) throws Exception;
	
	int selectEmailVerif(EmailVerifVO vo) throws Exception;

}
