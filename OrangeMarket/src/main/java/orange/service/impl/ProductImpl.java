package orange.service.impl;

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
	
	
	
}
