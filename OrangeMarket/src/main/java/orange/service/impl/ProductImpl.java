package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.InquiryService;
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
	public int insertProImg(ProductSubVO svo) { // 판매 제품 이미지 저장
		// TODO Auto-generated method stub
		return productDAO.insertProImg(svo);
	}

	@Override
	public List<?> selectProductList(ProductVO vo) throws Exception { // 판매제품 리스트 출력
		// TODO Auto-generated method stub
		return productDAO.selectProductList(vo);
	}

	@Override
	public ProductVO selectProductDetail(ProductVO vo) { // 판매 제품 리스트 -> 상세정보 출력
		// TODO Auto-generated method stub
		return productDAO.selectProductDetail(vo);
	}

	@Override
	public ProductVO selectProductModify(ProductVO vo) { // 판매제품 수정 -> 상세정보 출력
		// TODO Auto-generated method stub
		return productDAO.selectProductModify(vo);
	}

	
	
	
}
