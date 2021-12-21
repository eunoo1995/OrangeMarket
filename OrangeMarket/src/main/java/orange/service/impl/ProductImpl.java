package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.InquiryService;
import orange.service.ProductService;
import orange.service.ProductVO;

@Service("productService")
public class ProductImpl extends EgovAbstractServiceImpl implements ProductService{
	
	@Resource(name="productMapper")
	private ProductMapper productDAO;

	@Override
	public int insertProduct(ProductVO vo) throws Exception {
		return productDAO.insertProduct(vo);
	}

	@Override
	public List<?> selectProductList(ProductVO vo) throws Exception {
		// TODO Auto-generated method stub
		return productDAO.selectProductList(vo);
	}

	@Override
	public ProductVO selectProductDetail(ProductVO vo) {
		// TODO Auto-generated method stub
		return productDAO.selectProductDetail(vo);
	}
	
	
	
}
