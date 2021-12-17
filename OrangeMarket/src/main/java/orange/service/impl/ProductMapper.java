package orange.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.ProductVO;

@Mapper("productMapper")
public interface ProductMapper {

	int insertProduct(ProductVO vo);

}
