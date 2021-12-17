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
import orange.service.QnaService;
import orange.service.QnaVO;
import orange.service.ReportService;
import orange.service.ReportVO;

@Controller
public class BoardController {
	
	@Resource(name="inquiryService")
	private InquiryService inquiryService;
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	@Resource(name="qnaService")
	private QnaService qnaService;
	
	
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
		vo.setTitle(vo.getTitle().trim());
		vo.setContent(vo.getContent().trim());
		String content = vo.getContent().replace("\n", "<br>");
		vo.setContent(content);
		String rs = "";
		int result = inquiryService.insertInquiry(vo);
		if(result == 1) {
			rs = "ok";
		}
		return rs;
	}
	
	//--------------------------------------------------------------
	// 신고하기 리스트 출력
	@RequestMapping(value = "/report-list")
	public String reportList(PagingVO vo, Model model) throws Exception {
		//페이징 처리
		int total = reportService.selectReportTotal();
		int pageNo = vo.getPageNo();
		int pageUnit = 5;
		vo = new PagingVO(total,pageNo,pageUnit);
		
		List<ReportVO> list = reportService.selectReportList(vo);
		model.addAttribute("list",list);
		model.addAttribute("page",vo);
		return "board/reportList";
	}
	// 신고하기 상세보기
	@RequestMapping(value = "/report-detail")
	public String reportDetail(ReportVO vo, Model model) throws Exception {
		
		vo = reportService.selectReportDetail(vo);
		
		model.addAttribute("vo",vo);
		
		return "board/reportDetail";
	}
	// 신고하기 작성화면
	@RequestMapping(value = "/report-write")
	public String reportWrite() throws Exception {
		
		return "board/reportWrite";
	}
	// 신고하기 작성 저장
	@RequestMapping(value = "/report-write-save")
	@ResponseBody
	public String reportWriteSave(ReportVO vo) throws Exception {
		
		vo.setContent(vo.getContent().trim());
		String content = vo.getContent().replace("\n", "<br>");
		vo.setContent(content);
		
		String result = "";
		int rs = reportService.insertReport(vo);
		if(rs == 1) {
			result = "ok";
		}
		return result;
	}
	
	
	//--------------------------------------------------------------
	// 자주묻는질문 리스트 출력
	@RequestMapping(value = "/qna-list")
	public String infoAccount(QnaVO vo, Model model) throws Exception {
		
		List<?> list = qnaService.selectQnaList(vo);
		List<?> cateList = qnaService.selectCategoryList();
		model.addAttribute("cateNo",vo.getCategory());
		model.addAttribute("list",list);
		model.addAttribute("cateList",cateList);
		return "board/qnaList";
	}
	
	
	
	
}
