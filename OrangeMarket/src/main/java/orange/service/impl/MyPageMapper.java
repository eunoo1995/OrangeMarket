package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.MemberVO;
import orange.service.MyKeywordVO;

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
}