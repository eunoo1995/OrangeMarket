package orange.service;

import java.util.List;

public interface MyPageService {
	
	// 마이페이지 맴버 기본정보
	MemberVO selectMemberInfo(MemberVO vo) throws Exception;
	
	// 프로필 사진 변경 파일 이름 업데이트
	int updateProfile(MemberVO vo) throws Exception;
	int updateSellerProfile(MemberVO vo) throws Exception;
	int updateBuyerPrifile(MemberVO vo) throws Exception;

	// chat에 저장된 구매 판매자 존재 여부
	int countSeller(MemberVO vo) throws Exception;
	int countBuyer(MemberVO vo) throws Exception;
	
	// 관심키워드 목록
	List<?> selectMyKeywordList(MyKeywordVO kvo) throws Exception;
	
	// 관심키워드 추가
	int insertMyKeyword(MyKeywordVO vo) throws Exception;
	
	// 관심키워드 삭제
	int deleteMyKeyword(MyKeywordVO vo) throws Exception;
	
	// 관심게시글 목록
	List<?> selectLikeProduct(ProductVO pvo) throws Exception;
	
	// 관심게시글 삭제
	int deleteLikeList(ProductVO vo) throws Exception;
	
}
