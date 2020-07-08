package com.koreait.projectE.contorller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.projectE.commom.Command;

@Controller
public class listController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;


	@RequestMapping("/")
	public String goIndex(Model model) {
		
		return "index";
	}
	@RequestMapping("main")
	public String goMain() {
			
		return "main";
	}
	
}
