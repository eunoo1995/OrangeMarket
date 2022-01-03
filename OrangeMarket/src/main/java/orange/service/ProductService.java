package orange.service;

import java.util.List;

public interface ProductService {

	// 제품 등록 기능
	int insertProduct(ProductVO vo) throws Exception;
	
	// 등록 제품 삭제
	int deleteProduct(ProductVO vo) throws Exception;
	
	// 제품 등록용 사용자 저장된 주소 가져오기
	ProductVO selectProductAddr(ProductVO vo) throws Exception;

	// 제품 이미지 뒤에 붙일 번호 부여용 SQL
	int selectSellerCount(ProductVO vo) throws Exception;
	
	// 등록된 제품 리스트 표시
	List<?> selectProductList(ProductVO vo) throws Exception;
	// 카텔고리 별 리스트 출력
	List<?> selectProductCategoryList(ProductVO vo);
	// 카테고리명 리스트 표시
	List<?> selectCategoryList(ProductVO vo) throws Exception;
	// 카테고리 명 가져오기
	String selectProCategory(ProductVO vo);
	// 제품 조회수 증가
	int updateProductHits(ProductVO vo);
	
	// 자신의 판매 제품 리스트
	List<?> selectSellProductList(ProductVO vo);
	// 구매 제품 리스트
	List<?> selectBuyProductList(ProductVO vo);
	
	// 판매 제품 상세보기 기능
	ProductVO selectProductDetail(ProductVO vo);

	// 판매 제품 정보 수정위한 데이터 표시
	ProductVO selectProductModify(ProductVO vo);
	int updateProduct(ProductVO vo);
	
	// 채팅방 갯수 세기
	int selectChatCount(ProductVO vo);

	// 관심 상품 등록
	int insertLikeProduct(ProductVO vo);
	// 관심 상품 중복 등록 방지
	int selectLikeCount(ProductVO vo);
	// 전체 관심 갯수
	int selectLikeAllCount(ProductVO vo);
	
	// 제품 판매 상태 변경
	int updateProductStatus(ProductVO vo);

	// 제품 구매 후 판매자 평가 +1
	int updateUserLevelGood(ProductVO vo);
	// 제품 구매 후 판매자 평가 -1
	int updateUserLevelBad(ProductVO vo);
	// 제품 구매 후 판매자 평가 상태 변경
	int updateRatingStatus(ProductVO vo);
	//제품 구매 후 판매자 평가 +
	int insertReviewGood(ProductVO vo);
	//제품 구매 후 판매자 평가 -
	int insertReviewBad(ProductVO vo);
	// 제품 평가 갯수 카운트
	int selectReviewCount(ProductVO vo);

	

}
