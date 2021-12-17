package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.QnaService;
import orange.service.QnaVO;

@Service("qnaService")
public class QnaImpl extends EgovAbstractServiceImpl implements QnaService{

	@Resource(name="qnaMapper")
	private QnaMapper qnaDAO;
	
	@Override
	public List<?> selectQnaList(QnaVO vo) throws Exception {
		return qnaDAO.selectQnaList(vo);
	}

	@Override
	public List<?> selectCategoryList() throws Exception {
		return qnaDAO.selectCategoryList();
	}

}
