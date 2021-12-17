package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("qnaMapper")
public interface QnaMapper {
	
	List<?> selectQnaList();
}
