package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.MemberVO;
import orange.service.MyKeywordVO;
import orange.service.MyPageService;

@Service("myPageService")
public class MyPageImpl extends EgovAbstractServiceImpl implements MyPageService {

	@Resource(name="myPageMapper")
	private MyPageMapper myPageDAO;

	@Override
	public MemberVO selectMemberInfo(MemberVO vo) throws Exception {
		return myPageDAO.selectMemberInfo(vo);
	}

	@Override
	public int updateProfile(MemberVO vo) throws Exception {
		return myPageDAO.updateProfile(vo);
	}

	@Override
	public int updateSellerProfile(MemberVO vo) throws Exception {
		return myPageDAO.updateSellerProfile(vo);
	}

	@Override
	public int updateBuyerPrifile(MemberVO vo) throws Exception {
		return myPageDAO.updateBuyerPrifile(vo);
	}

	@Override
	public int countSeller(MemberVO vo) throws Exception {
		return myPageDAO.countSeller(vo);
	}

	@Override
	public int countBuyer(MemberVO vo) throws Exception {
		return myPageDAO.countBuyer(vo);
	}

	@Override
	public List<?> selectMyKeywordList(MyKeywordVO kvo) throws Exception {
		return myPageDAO.selectMyKeywordList(kvo);
	}

	@Override
	public int insertMyKeyword(MyKeywordVO vo) throws Exception {
		return myPageDAO.insertMyKeyword(vo);
	}

	@Override
	public int deleteMyKeyword(MyKeywordVO vo) throws Exception {
		return myPageDAO.deleteMyKeyword(vo);
	}
	
	
}
