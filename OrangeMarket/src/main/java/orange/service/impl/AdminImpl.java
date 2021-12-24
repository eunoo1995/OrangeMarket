package orange.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.AdminService;
import orange.service.AdminVO;

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
	
	
}
