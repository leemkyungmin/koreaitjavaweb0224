package com.koreait.projectE.contorller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.projectE.command.AdminCommand;
import com.koreait.projectE.command.AdminUpdateDepartmentCommand;
import com.koreait.projectE.command.AdminUpdateUserCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;



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
	
	@RequestMapping(value="UpdateDepartment", method=RequestMethod.GET)
	public String UpdateDepartment(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		command=new AdminUpdateDepartmentCommand();
		command.execute(sqlSession, model);
		return "admin/UpdateDepartment";
	}
	
	@RequestMapping(value="deleteUser", method=  RequestMethod.POST)
	public void deleteBtnuser(@RequestParam("cNo") String cNo) {
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		aDAO.deleteReview(cNo);
		aDAO.deleteUser(cNo);
		
	}

	
		
		
		
	}
	

	

