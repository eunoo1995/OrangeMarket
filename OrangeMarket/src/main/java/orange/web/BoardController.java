package orange.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.InquiryService;
import orange.service.InquiryVO;
import orange.service.PagingVO;
import orange.service.ReportService;
import orange.service.ReportVO;

@Controller
public class BoardController {
	
	@Resource(name="inquiryService")
	private InquiryService inquiryService;
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	
	
	// 문의하기 리스트 출력
	@RequestMapping(value = "/inquiry-list")
	public String inquiryList(PagingVO vo, Model model) throws Exception {
		
		int total = inquiryService.selectInquiryTotal();
		int pageNo = vo.getPageNo();
		//페이징 객체 생성
		vo = new PagingVO(total, pageNo, 5);
		
		List<InquiryVO> list = inquiryService.selectInquiryList(vo);
		model.addAttribute("list",list);
		model.addAttribute("page",vo);
		return "board/inquiryList";
	}
	// 문의하기 상세보기
	@RequestMapping(value = "/inquiry-detail")
	public String inquiryDetail(InquiryVO vo, Model model) throws Exception {
		
		vo = inquiryService.selectInquiryDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "board/inquiryDetail";
	}
	// 문의하기 문의 작성
	@RequestMapping(value = "/inquiry-write")
	public String inquiryWrite() throws Exception {
		
		return "board/inquiryWrite";
	}
	// 문의하기 문의 작성 저장
	@ResponseBody
	@RequestMapping(value = "/inquiry-write-save")
	public String inquiryWriteSave(InquiryVO vo) throws Exception {
		
		int result = inquiryService.insertInquiry(vo);
		String rs = "";
		if(result == 1) {
			rs = "ok";
		}
		return rs;
	}
	
	//--------------------------------------------------------------
	// 신고하기 리스트 출력
	@RequestMapping(value = "/report-list")
	public String reportList(ReportVO vo, Model model) throws Exception {
		
		List<?> list = reportService.selectReportList(vo);
		int chk = list.size();
		model.addAttribute("list",list);
		model.addAttribute("chk",chk);
		return "board/reportList";
	}
	// 신고하기 상세보기
	@RequestMapping(value = "/report-detail")
	public String reportDetail(ReportVO vo, Model model) throws Exception {
		
		vo = reportService.selectReportDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "board/reportDetail";
	}
	//--------------------------------------------------------------
	// 자주묻는질문 리스트 출력
	@RequestMapping(value = "/qna-list")
	public String infoAccount() throws Exception {
		
		return "board/qnaList";
	}
	
	
	
	
}
