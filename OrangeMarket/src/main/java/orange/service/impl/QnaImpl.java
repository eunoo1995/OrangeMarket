package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.QnaService;

@Service("qnaService")
public class QnaImpl extends EgovAbstractServiceImpl implements QnaService{

	@Resource(name="qnaMapper")
	private QnaMapper qnaDAO;
	
	@Override
	public List<?> selectQnaList() throws Exception {
		return qnaDAO.selectQnaList();
	}

}
