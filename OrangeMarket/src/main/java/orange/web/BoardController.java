package orange.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	// 문의하기 리스트 출력
	@RequestMapping(value = "/inquiry-list")
	public String inquiryList() throws Exception {
		
		return "board/inquiryList";
	}
	// 문의하기 상세보기
	@RequestMapping(value = "/inquiry-detail")
	public String inquiryDetail() throws Exception {
		
		return "board/inquiryDetail";
	}
	// 문의하기 문의 작성
	@RequestMapping(value = "/inquiry-write")
	public String inquiryWrite() throws Exception {
		
		return "board/inquiryWrite";
	}
	
	@RequestMapping(value = "/inquiry-writeSave")
	public String inquiryWriteSave() throws Exception {
		
		return "";
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
