package orange.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import orange.service.InquiryService;
import orange.service.InquiryVO;

@Controller
public class BoardController {
	
	@Resource(name="inquiryService")
	private InquiryService inquiryService;
	
	// 문의하기 리스트 출력
	@RequestMapping(value = "/inquiry-list")
	public String inquiryList(InquiryVO vo, Model model) throws Exception {
		
		List<?> list = inquiryService.selectInquiryList(vo);
		  
		model.addAttribute("list",list);
		 
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
	public String reportList() throws Exception {
		
		return "board/reportList";
	}
	// 신고하기 상세보기
		@RequestMapping(value = "/report-detail")
		public String reportDetail() throws Exception {
			
			return "board/reportDetail";
		}
	//--------------------------------------------------------------
	// 자주묻는질문 리스트 출력
	@RequestMapping(value = "/qna-list")
	public String infoAccount() throws Exception {
		
		return "board/qnaList";
	}
	
	
	
	
}
