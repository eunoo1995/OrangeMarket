package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.AdminService;
import orange.service.AdminVO;
import orange.service.PagingVO;

@Service("adminService")
public class AdminImpl extends EgovAbstractServiceImpl implements AdminService {
	
	@Resource(name="adminMapper")
	private AdminMapper adminDAO;

	@Override
	public int confirmAdminId(AdminVO vo) throws Exception {
		return adminDAO.confirmAdminId(vo);
	}

	@Override
	public int confirmAdminPass(AdminVO vo) throws Exception {
		return adminDAO.confirmAdminPass(vo);
	}

	@Override
	public List<?> selectMemberList(PagingVO vo) throws Exception {
		return adminDAO.selectMemberList(vo);
	}

	@Override
	public int totalMemberList(PagingVO vo) throws Exception {
		return adminDAO.totalMemberList(vo);
	}

	@Override
	public int updateMemberState(int userId) throws Exception {
		return adminDAO.updateMemberState(userId);
	}

	@Override
	public int updateMemberDate(int userId) throws Exception {
		return adminDAO.updateMemberDate(userId);
	}

	@Override
	public int totalSuspendList(PagingVO vo) throws Exception {
		return adminDAO.totalSuspendList(vo);
	}

	@Override
	public List<?> selectSuspendList(PagingVO vo) throws Exception {
		return adminDAO.selectSuspendList(vo);
	}

	@Override
	public int updateUnlock(int userId) throws Exception {
		return adminDAO.updateUnlock(userId);
	}
	
	
}
