package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.ProductSubVO;
import orange.service.ProductVO;

@Mapper("productMapper")
public interface ProductMapper {

	int insertProduct(ProductVO vo);
	int insertProImg(ProductSubVO svo);
	
	List<?> selectProductList(ProductVO vo);

	ProductVO selectProductDetail(ProductVO vo);

	ProductVO selectProductModify(ProductVO vo);

	

}
