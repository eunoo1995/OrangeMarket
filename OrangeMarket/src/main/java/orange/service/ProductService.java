package orange.service;

import java.util.List;

public interface ProductService {

	// 제품 등록 기능
	int insertProduct(ProductVO vo) throws Exception;

	// 등록된 제품 리스트 표시
	 List<?> selectProductList(ProductVO vo) throws Exception;

	// 판매 제품 상세보기 기능
	ProductVO selectProductDetail(ProductVO vo);
	
}
