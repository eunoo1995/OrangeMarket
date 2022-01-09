package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.InquiryService;
import orange.service.MemberVO;
import orange.service.PagingVO;
import orange.service.ProductService;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Service("productService")
public class ProductImpl extends EgovAbstractServiceImpl implements ProductService{
	
	@Resource(name="productMapper")
	private ProductMapper productDAO;

	@Override
	public int insertProduct(ProductVO vo) throws Exception { // 판매 제품 정보 저장
		return productDAO.insertProduct(vo);
	}

	@Override
	public int deleteProduct(ProductVO vo) throws Exception { // 제품 삭제
		// TODO Auto-generated method stub
		return productDAO.deleteProduct(vo);
	}
	
	@Override
	public int deleteLikeProduct(ProductVO vo) { // 제품 삭제 시 좋아요 태그 동시 삭제
		// TODO Auto-generated method stub
		return productDAO.deleteLikeProduct(vo);
	}
	
	@Override
	public ProductVO selectProductAddr(ProductVO vo) throws Exception { // 주소 가져오기
		// TODO Auto-generated method stub
		return productDAO.selectProductAddr(vo);
	}

	@Override
	public int selectSellerCount(ProductVO vo) throws Exception { // 이미지 번호 부여용
		// TODO Auto-generated method stub
		return productDAO.selectSellerCount(vo);
	}
	
	@Override
	public List<?> selectProductList(ProductVO vo) throws Exception { // 판매제품 리스트 출력
		// TODO Auto-generated method stub
		return productDAO.selectProductList(vo);
	}
	
	@Override
	public List<?> selectProductCategoryList(ProductVO vo) { // 카테고리 분류 리스트 표시
		// TODO Auto-generated method stub
		return productDAO.selectProductCategoryList(vo);
	}
	
	@Override
	public String selectProCategory(ProductVO vo) { // 리스트 화면에서 카테고리 명 출력
		// TODO Auto-generated method stub
		return productDAO.selectProCategory(vo);
	}
	

	@Override
	public List<?> selectCategoryList(ProductVO vo) throws Exception {  // 카테고리명 리스트 출력
		// TODO Auto-generated method stub
		return productDAO.selectCategoryList(vo);
	}

	@Override
	public List<ProductVO> selectSellProductList(PagingVO pvo) { // 사용자의 판매 제품 리스트
		// TODO Auto-generated method stub
		return productDAO.selectSellProductList(pvo);
	}

	@Override
	public List<ProductVO> selectBuyProductList(PagingVO pvo) { // 사용자의 구매 제품 리스트
		// TODO Auto-generated method stub
		return productDAO.selectBuyProductList(pvo);
	}
	
	@Override
	public int updateProductHits(ProductVO vo) { // 조회수 증가
		// TODO Auto-generated method stub
		return productDAO.updateProductHits(vo);
	}

	@Override
	public ProductVO selectProductDetail(ProductVO vo)  { // 판매 제품 리스트 -> 상세정보 출력
		// TODO Auto-generated method stub
		return productDAO.selectProductDetail(vo);
	}

	@Override
	public ProductVO selectProductModify(ProductVO vo) { // 판매제품 수정 -> 상세정보 출력
		// TODO Auto-generated method stub
		return productDAO.selectProductModify(vo);
	}

	@Override
	public int updateProduct(ProductVO vo) { // 판매제품 정보 수정 저장
		// TODO Auto-generated method stub
		return productDAO.updateProduct(vo);
	}

	@Override
	public int selectChatCount(ProductVO vo) { // 채팅방 개수 세기
		// TODO Auto-generated method stub
		return productDAO.selectChatCount(vo);
	}

	@Override
	public int insertLikeProduct(ProductVO vo) { // 관심 상품 등록
		// TODO Auto-generated method stub
		return productDAO.insertLikeProduct(vo);
	}

	@Override
	public int selectLikeCount(ProductVO vo) { // 관심 상품 중복 등록 방지
		// TODO Auto-generated method stub
		return productDAO.selectLikeCount(vo);
	}

	@Override
	public int selectLikeAllCount(ProductVO vo) { // 좋아요 전체 갯수
		// TODO Auto-generated method stub
		return productDAO.selectLikeAllCount(vo);
	}
	
	@Override
	public int updateProductStatus(ProductVO vo) { // 제품 판매 상태 변경
		// TODO Auto-generated method stub
		return productDAO.updateProductStatus(vo);
	}
	
	@Override
	public int updateProductStatAndBuyer(ProductVO vo) { // 제품 판매 상태 '판매중'으로 변경 시 구매자 정보 삭제
		// TODO Auto-generated method stub
		return productDAO.updateProductStatAndBuyer(vo);
	}

	@Override
	public int updateUserLevelGood(ProductVO vo) { // 제품 구매 후 판매자 평가 +1
		// TODO Auto-generated method stub
		return productDAO.updateUserLevelGood(vo);
	}

	@Override
	public int updateUserLevelBad(ProductVO vo) { // 제품 구매 후 판매자 평가 -1
		// TODO Auto-generated method stub
		return productDAO.updateUserLevelBad(vo);
	}
	
	@Override
	public int updateRatingStatus(ProductVO vo) { // 제품 구매 후 판매자 평가 상태 변경
		// TODO Auto-generated method stub
		return productDAO.updateRatingStatus(vo);
	}

	@Override
	public int insertReviewGood(ProductVO vo) { // 제품 구매 후 판매자 평가 등록
		// TODO Auto-generated method stub
		return productDAO.insertReviewGood(vo);
	}
	
	@Override
	public int insertReviewBad(ProductVO vo) { // 제품 구매 후 판매자 평가 등록
		// TODO Auto-generated method stub
		return productDAO.insertReviewBad(vo);
	}

	@Override
	public int selectReviewCount(ProductVO vo) { // 제품 평가 갯수 카운트
		// TODO Auto-generated method stub
		return productDAO.selectReviewCount(vo);
	}

	@Override
	public String selectMemberAddr(ProductVO vo) { // 사용자 주소 가져오기
		// TODO Auto-generated method stub
		return productDAO.selectMemberAddr(vo);
	}

	@Override
	public MemberVO selectAddrPass(ProductVO vo) { // 사용자 동네인증 여부 가져오기
		// TODO Auto-generated method stub
		return productDAO.selectAddrPass(vo);
	}

	@Override
	public List<?> selectMyKeywordList(ProductVO pvo) { // 설정된 마이 키워드를 기준으로 가져오는 리스트
		// TODO Auto-generated method stub
		return productDAO.selectMyKeywordList(pvo);
	}

	@Override
	public int selectMykeywrodCount(ProductVO pvo) { // 마이키워드 유무 확인용
		// TODO Auto-generated method stub
		return productDAO.selectMykeywrodCount(pvo);
	}

	@Override
	public int selectSellHistoryTotal(PagingVO pvo) { // 판매 목록 갯수 카운트
		// TODO Auto-generated method stub
		return productDAO.selectSellHistoryTotal(pvo);
	}

	@Override
	public int selectBuyHistoryTotal(PagingVO pvo) { // 구매 목록 갯수 카운트
		// TODO Auto-generated method stub
		return productDAO.selectBuyHistoryTotal(pvo);
	}

	@Override
	public List<?> selectLikeProductList(ProductVO pvo) { // 동네별 관심순 리스트 출력
		// TODO Auto-generated method stub
		return productDAO.selectLikeProductList(pvo);
	}

}
