package orange.service.impl;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.EmailVerifVO;
import orange.service.MemberVO;
import orange.service.TermsAgreeVO;

@Mapper("memberMapper") 
public interface MemberMapper {


	int isMemberTel(String tel);

	int isMemberNikname(String nickname);

	int isMemberEmail(String email);

	int insertEmailVerif(EmailVerifVO vo);

	int selectEmailVerif(EmailVerifVO vo);

	int insertNewMember(MemberVO vo);

	int updateUseEmailCode(MemberVO vo);

	int updateUseEmailCode(EmailVerifVO vo);

	int insertAgreeTerms(List<Map<String, Object>> insertList);

	int selectNewUserId();

	int insertMemberStatus(int userId);

	int checkMemberLogin(MemberVO vo);

	MemberVO selectMemberLogin(MemberVO vo);

	int selectFindPw(MemberVO vo);

	int updateUserPw(MemberVO vo);


}
