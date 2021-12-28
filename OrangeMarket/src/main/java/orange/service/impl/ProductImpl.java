package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.InquiryService;
import orange.service.MemberVO;
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
	public ProductVO selectProductAddr(ProductVO vo) throws Exception { // 주소 가져오기
		// TODO Auto-generated method stub
		return productDAO.selectProductAddr(vo);
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

}
