package com.koreait.projectE.contorller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.projectE.command.CustomerSignUpCommand;
import com.koreait.projectE.command.boardViewCommand;
import com.koreait.projectE.commom.Command;


@Controller
public class pojectEController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;


	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	
	@RequestMapping("index")
	public String goIndex2() {
		return "index";
	}
	

	@RequestMapping(value="viewPage",method=RequestMethod.GET)
	public String viewPage(HttpServletRequest request,Model model) {
		
		model.addAttribute("request",request);
		command= new boardViewCommand();
		command.execute(sqlSession, model);
		
		return "board/viewPage";
	}

	
	
	

}
