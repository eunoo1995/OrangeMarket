package orange.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.EmailVerifVO;
import orange.service.MemberService;
import orange.service.MemberVO;
import orange.service.TermsAgreeVO;

@Service("memberService")
public class MemberImpl extends EgovAbstractServiceImpl implements MemberService {

	// TODO mybatis 사용
	@Resource(name = "memberMapper")
	private MemberMapper memberDAO;

	@Override
	public int isMemberTel(String tel) throws Exception {
		return memberDAO.isMemberTel(tel);
	}

	@Override
	public int isMemberNikname(String nickname) throws Exception {
		return memberDAO.isMemberNikname(nickname);
	}

	@Override
	public int isMemberEmail(String email) throws Exception {
		return memberDAO.isMemberEmail(email);
	}

	@Override
	public int insertEmailVerif(EmailVerifVO vo) throws Exception {
		return memberDAO.insertEmailVerif(vo);
	}

	@Override
	public int selectEmailVerif(EmailVerifVO vo) throws Exception {
		return memberDAO.selectEmailVerif(vo);
	}

	@Override
	public int insertNewMember(MemberVO vo) throws Exception {
		return memberDAO.insertNewMember(vo);
	}

	@Override
	public int updateUseEmailCode(EmailVerifVO vo) throws Exception {
		return memberDAO.updateUseEmailCode(vo);
	}


	@Override
	public int insertAgreeTerms(List<Map<String, Object>> insertList) throws Exception {
		return memberDAO.insertAgreeTerms(insertList);
	}

	@Override
	public int selectNewUserId() throws Exception {
		return memberDAO.selectNewUserId();
	}

	@Override
	public int insertMemberStatus(int userId) throws Exception {
		return memberDAO.insertMemberStatus(userId);
	}

	@Override
	public int checkMemberLogin(MemberVO vo) throws Exception {
		return memberDAO.checkMemberLogin(vo);
	}

	@Override
	public MemberVO selectMemberInfo(MemberVO vo) throws Exception {
		return (MemberVO) memberDAO.selectMemberInfo(vo);
	}


}
