package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.DeptVO;
import orange.service.MemberService;
import orange.service.OrangeService;


@Service("memberService")
public class MemberImpl extends EgovAbstractServiceImpl implements MemberService {

	// TODO mybatis 사용
	@Resource(name="memberMapper")
	private MemberMapper memberDAO;

	@Override
	public int isMemberTel(String tel) throws Exception {
		return memberDAO.isMemberTel(tel);
	}

}
