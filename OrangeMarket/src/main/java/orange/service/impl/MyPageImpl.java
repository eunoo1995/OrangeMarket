package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.MemberVO;
import orange.service.MyKeywordVO;
import orange.service.MyPageService;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

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
	public List<?> selectMyKeywordList(MemberVO vo) throws Exception {
		return myPageDAO.selectMyKeywordList(vo);
	}

	@Override
	public int insertMyKeyword(MyKeywordVO vo) throws Exception {
		return myPageDAO.insertMyKeyword(vo);
	}

	@Override
	public int deleteMyKeyword(MyKeywordVO vo) throws Exception {
		return myPageDAO.deleteMyKeyword(vo);
	}

	@Override
	public List<?> selectLikeProduct(ProductVO pvo) throws Exception {
		return myPageDAO.selectLikeProduct(pvo);
	}

	@Override
	public int deleteLikeList(ProductVO vo) throws Exception {
		return myPageDAO.deleteLikeList(vo);
	}

	@Override
	public int updateWithdrawal(MemberVO vo) throws Exception {
		return myPageDAO.updateWithdrawal(vo);
	}

	@Override
	public int selectPassChk(MemberVO vo) throws Exception {
		return myPageDAO.selectPassChk(vo);
	}

	@Override
	public int withdrawalDate(MemberVO vo) throws Exception {
		return myPageDAO.withdrawalDate(vo);
	}
	
	
}
