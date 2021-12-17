package orange.service;

import java.util.List;

public interface QnaService {
	
	List<?> selectQnaList(QnaVO vo) throws Exception;
	
	List<?> selectCategoryList() throws Exception;
}
