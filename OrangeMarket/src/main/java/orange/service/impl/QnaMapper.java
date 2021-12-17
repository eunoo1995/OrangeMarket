package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.QnaVO;

@Mapper("qnaMapper")
public interface QnaMapper {
	
	List<?> selectQnaList(QnaVO vo);
	
	List<?> selectCategoryList();
}
