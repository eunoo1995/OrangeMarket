package orange.service;

import java.util.List;
import java.util.Map;

public interface MemberService {

	int isMemberTel(String tel) throws Exception;

	int isMemberNikname(String nickname) throws Exception;

	int isMemberEmail(String email) throws Exception;
	
	int insertEmailVerif(EmailVerifVO vo) throws Exception;
	
	int selectEmailVerif(EmailVerifVO vo) throws Exception;

	int insertNewMember(MemberVO vo) throws Exception;
	
	int updateUseEmailCode(EmailVerifVO vo) throws Exception;

	int insertAgreeTerms(List<Map<String, Object>> insertList) throws Exception;

	int selectNewUserId() throws Exception;

	int insertMemberStatus(int userId) throws Exception;

	int checkMemberLogin(MemberVO vo) throws Exception;

	MemberVO selectMemberInfo(MemberVO vo) throws Exception;

}
