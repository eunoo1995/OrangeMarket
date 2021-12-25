package orange.service.impl;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import orange.service.AdminVO;
import orange.service.PagingVO;

@Mapper("adminMapper")
public interface AdminMapper {
	
	int confirmAdminId(AdminVO vo);
	int confirmAdminPass(AdminVO vo);
	
	int totalMemberList(PagingVO vo);
	List<?> selectMemberList(PagingVO vo);
	
	int updateMemberState(int userId);
}
