package orange.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.EmailVerifVO;
import orange.service.MemberService;
import orange.service.MemberVO;


@Service("memberService")
public class MemberImpl extends EgovAbstractServiceImpl implements MemberService {

	// TODO mybatis 사용
	@Resource(name="memberMapper")
	private MemberMapper memberDAO;

	@Override
	public int isMemberTel(String tel) throws Exception {
		return memberDAO.isMemberTel(tel);
	}

	@Override
	public int isMemberNikname(String nickname) {
		return memberDAO.isMemberNikname(nickname);
	}

	@Override
	public int isMemberEmail(String email) {
		return  memberDAO.isMemberEmail(email);
	}

	@Override
	public int insertEmailVerif(EmailVerifVO vo) throws Exception {
		return memberDAO.insertEmailVerif(vo);
	}

	@Override
	public int selectEmailVerif(EmailVerifVO vo) throws Exception {
		return memberDAO.selectEmailVerif(vo);
	}

}
