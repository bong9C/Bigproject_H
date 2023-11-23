package com.human.project_H.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

public class NoticeController {

	
	
	@GetMapping("/notice")	// routing 정보, localhost:8090/project_H/home
	public String notice(Model model) {
		model.addAttribute("menu", "home");
		return "notice";				// webapp/WEB-INF/view/home.jsp 를 렌더링해서 보여줌
	}
}
