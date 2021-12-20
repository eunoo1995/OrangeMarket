package orange.service;

public interface MyPageService {
	
	// 마이페이지 맴버 기본정보
	MemberVO selectMemberInfo(MemberVO vo) throws Exception;
	
	// 프로필 사진 변경 이름 업데이트
	int updateProfile(MemberVO vo) throws Exception;
}
