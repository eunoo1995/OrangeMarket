package orange.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import orange.service.AdminService;
import orange.service.AdminVO;
import orange.service.InquiryVO;
import orange.service.PagingVO;
import orange.service.ReportVO;

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

	@Override
	public int totalWithdrawal(PagingVO vo) throws Exception {
		return adminDAO.totalWithdrawal(vo);
	}

	@Override
	public List<?> selectWithdrawal(PagingVO vo) throws Exception {
		return adminDAO.selectWithdrawal(vo);
	}

	@Override
	public int updateRestore(int userId) throws Exception {
		return adminDAO.updateRestore(userId);
	}

	@Override
	public int totalAdminInquiry(PagingVO vo) throws Exception {
		return adminDAO.totalAdminInquiry(vo);
	}

	@Override
	public List<?> selectAdminInquiry(PagingVO vo) throws Exception {
		return adminDAO.selectAdminInquiry(vo);
	}

	@Override
	public InquiryVO adminInquiryInfo(InquiryVO vo) throws Exception {
		return adminDAO.adminInquiryInfo(vo);
	}

	@Override
	public int responseInquiry(InquiryVO vo) throws Exception {
		return adminDAO.responseInquiry(vo);
	}

	@Override
	public int totalAdminReport(PagingVO vo) throws Exception {
		return adminDAO.totalAdminReport(vo);
	}

	@Override
	public List<?> selectAdminReport(PagingVO vo) throws Exception {
		return adminDAO.selectAdminReport(vo);
	}

	@Override
	public ReportVO adminReportInfo(ReportVO vo) throws Exception {
		return adminDAO.adminReportInfo(vo);
	}

	@Override
	public int updateReportCount(ReportVO vo) throws Exception {
		return adminDAO.updateReportCount(vo);
	}

	@Override
	public int responseReport(ReportVO vo) throws Exception {
		return adminDAO.responseReport(vo);
	}

	@Override
	public int countReport(ReportVO vo) throws Exception {
		return adminDAO.countReport(vo);
	}

	@Override
	public int overCountSuspend(ReportVO vo) throws Exception {
		return adminDAO.overCountSuspend(vo);
	}
	
	
}
