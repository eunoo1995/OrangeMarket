package orange.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.MemberVO;
import orange.service.MyPageService;

@Service("myPageService")
public class MyPageImpl extends EgovAbstractServiceImpl implements MyPageService {

	@Resource(name="myPageMapper")
	private MyPageMapper myPageDAO;

	@Override
	public MemberVO selectMemberInfo(MemberVO vo) throws Exception {
		return myPageDAO.selectMemberInfo(vo);
	}
	
	
}
