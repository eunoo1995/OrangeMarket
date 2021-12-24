package orange.service;

public interface AdminService {
	
	// 관리자 계정 유무 체크
	int confirmAdminId(AdminVO vo) throws Exception;
	int confirmAdminPass(AdminVO vo) throws Exception;
}
