package orange.service.impl;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.AdminVO;

@Mapper("adminMapper")
public interface AdminMapper {
	
	int confirmAdminId(AdminVO vo);
	int confirmAdminPass(AdminVO vo);
}
