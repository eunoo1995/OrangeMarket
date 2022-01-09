package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.MemberVO;
import orange.service.PagingVO;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Mapper("productMapper")
public interface ProductMapper {

	int insertProduct(ProductVO vo);
	int deleteProduct(ProductVO vo);
	int deleteLikeProduct(ProductVO vo);
	ProductVO selectProductAddr(ProductVO vo);
	int selectSellerCount(ProductVO vo);
	
	List<?> selectProductList(ProductVO vo);
	List<?> selectProductCategoryList(ProductVO vo);
	String selectProCategory(ProductVO vo);
	List<?> selectCategoryList(ProductVO vo);
	int updateProductHits(ProductVO vo);
	
	List<ProductVO> selectSellProductList(PagingVO pvo);
	List<ProductVO> selectBuyProductList(PagingVO pvo);

	ProductVO selectProductDetail(ProductVO vo);

	ProductVO selectProductModify(ProductVO vo);
	int updateProduct(ProductVO vo);
	
	int selectChatCount(ProductVO vo);
	
	int insertLikeProduct(ProductVO vo);
	
	int selectLikeCount(ProductVO vo);
	
	int selectLikeAllCount(ProductVO vo);
	
	int updateProductStatus(ProductVO vo);
	int updateProductStatAndBuyer(ProductVO vo);
	
	int updateUserLevelGood(ProductVO vo);
	int updateUserLevelBad(ProductVO vo);
	int updateRatingStatus(ProductVO vo);
	int insertReviewGood(ProductVO vo);
	int insertReviewBad(ProductVO vo);
	int selectReviewCount(ProductVO vo);
	
	String selectMemberAddr(ProductVO vo);
	MemberVO selectAddrPass(ProductVO vo);
	
	List<?> selectMyKeywordList(ProductVO pvo);
	int selectMykeywrodCount(ProductVO pvo);
	
	int selectSellHistoryTotal(PagingVO pvo);
	int selectBuyHistoryTotal(PagingVO pvo);
	List<?> selectLikeProductList(ProductVO pvo);
	List<?> selectKeywordList(ProductVO vo);
	List<?> selectProductPriceAvg(ProductVO vo);
	
}
