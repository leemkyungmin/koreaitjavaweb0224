package com.koreait.projectE.contorller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.projectE.command.admin.AdminCommand;
import com.koreait.projectE.command.admin.AdminUpdateUserCommand;
import com.koreait.projectE.commom.Command;


@Controller
public class adminController {

	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	@RequestMapping("adminmanagePage") 
	public String adminmagePage(Model model) {

		command=new AdminCommand();
		command.execute(sqlSession, model);
		return "admin/adminmanagerPage";	
	}
	
	@RequestMapping(value="UpdateUser", method=RequestMethod.GET)
	public String UpdateUser(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		command=new AdminUpdateUserCommand();
		command.execute(sqlSession, model);
		return "admin/UpdateUser";

	}
	
	
	

	
	
}
