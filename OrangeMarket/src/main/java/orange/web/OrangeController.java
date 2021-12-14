package orange.web;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import orange.service.DeptVO;
import orange.service.OrangeService;

@Controller
public class OrangeController {
	
	@Resource(name = "orangeService")
	private OrangeService orangeService;

	@RequestMapping(value = "/deptList.do")
	public String deptlist(DeptVO vo, Model model) throws Exception {
		
		int deptno = 10;
		
		/*
		List<?> list = sampleService.selectDeptList();
		model.addAttribute("list", list);
		*/
		vo = orangeService.selectDeptDetail(deptno);
		model.addAttribute("vo", vo);
		
		return "dept/deptList";
	}
	

	@RequestMapping(value="/main")
	public String showMainPage() throws Exception {
		
		return "main/main";
	}
	
}
