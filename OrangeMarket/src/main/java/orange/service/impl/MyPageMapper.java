package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.MemberVO;
import orange.service.MyKeywordVO;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Mapper("myPageMapper")
public interface MyPageMapper {
	
	MemberVO selectMemberInfo(MemberVO vo);
	
	int updateProfile(MemberVO vo);
	
	int updateSellerProfile(MemberVO vo);
	
	int updateBuyerPrifile(MemberVO vo);
	
	int countSeller(MemberVO vo);
	
	int countBuyer(MemberVO vo);
	
	List<?> selectMyKeywordList(MyKeywordVO kvo);
	
	int insertMyKeyword(MyKeywordVO vo);
	
	int deleteMyKeyword(MyKeywordVO vo);
	
	List<?> selectLikeProduct(ProductVO pvo);
	
	int deleteLikeList(ProductVO vo);
	
	int updateWithdrawal(MemberVO vo);
	
	int selectPassChk(MemberVO vo);
	
	int withdrawalDate(MemberVO vo);
}
