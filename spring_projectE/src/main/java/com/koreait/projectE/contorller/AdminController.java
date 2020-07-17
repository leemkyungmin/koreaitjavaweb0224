package com.koreait.projectE.contorller;


import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.projectE.command.Admin.AdminCommand;
import com.koreait.projectE.command.Admin.AdminDeptAcceptCommand;
import com.koreait.projectE.command.Admin.AdminDeptAcceptListCommand;
import com.koreait.projectE.command.Admin.AdminDeptAcceptViewCommand;
import com.koreait.projectE.command.Admin.AdminDeptDeleteCommand;
import com.koreait.projectE.command.Admin.AdminDeptViewCommand;
import com.koreait.projectE.command.Admin.AdminSearchQueryDeptInfo;
import com.koreait.projectE.command.Admin.AdminUpdateDepartmentCommand;
import com.koreait.projectE.command.Admin.AdminUpdateUserCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.adminDAO;
import com.koreait.projectE.dto.DepartmentDTO;



@Controller
public class AdminController {

	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	
	
	@RequestMapping("adminmanagePage") 
	public String adminmagePage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command=new AdminCommand();
		command.execute(sqlSession, model);
		return "admin/adminmanagerPage";	
	}
	
	@RequestMapping("departmentView")
	public String departmentView(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command=new AdminDeptViewCommand();
		command.execute(sqlSession, model);
		return "admin/departmentView";	
	}
	
	@RequestMapping(value="UpdateUserPage", method=RequestMethod.GET)
	public String UpdateUserPage(HttpServletRequest request, Model model) {
		
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
	public String deleteBtnuser(HttpServletRequest request, Model model) {
		String[] cNo = request.getParameterValues("cNo");
		System.out.println(cNo.length);
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		
		for (int i=0, len=cNo.length; i<len; i++) {
			aDAO.deleteReview(cNo[i]);
			aDAO.deleteUser(cNo[i]);			
		}

		return "redirect:adminmanagePage";
	}

	@RequestMapping("UpdateUser")
	public String UpdateUser(HttpServletRequest request,Model model) {
		String cGrade = request.getParameter("cGrade");
		String cNo =request.getParameter("cNo");
		adminDAO aDAO = sqlSession.getMapper(adminDAO.class);
		aDAO.UpdateUser(cGrade,cNo);
		return "redirect:adminmanagePage";
	}
		
	@RequestMapping(value="deptAccpetPage")
	public String deptAccpetPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new AdminDeptAcceptListCommand();
		command.execute(sqlSession, model);
		
		return "admin/deptAcceptPage";
	}

	@RequestMapping(value="deptAcceptView")
	public String deptAcceptView(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		command = new AdminDeptAcceptViewCommand();
		command.execute(sqlSession, model);
		
		return "admin/deptAcceptViewPage";
	}
	
	@RequestMapping(value="deptAccept", method=RequestMethod.POST)
	public String deptAccept(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new AdminDeptAcceptCommand();
		command.execute(sqlSession, model);
		return "redirect:deptAccpetPage";
	}
	
	@RequestMapping(value="deptReject", method=RequestMethod.POST)
	public String deptReject(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new AdminDeptDeleteCommand();
		command.execute(sqlSession, model);
		return "redirect:deptAccpetPage";
	}
	
	@RequestMapping(value="searchQueryDeptInfo", method=RequestMethod.GET)
	public String searchQueryDeptInfo(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new AdminSearchQueryDeptInfo();
		command.execute(sqlSession, model);
		return "admin/departmentView";
	}

}
	

	

