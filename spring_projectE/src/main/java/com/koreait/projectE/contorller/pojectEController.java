package com.koreait.projectE.contorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pojectEController {
	
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
}
