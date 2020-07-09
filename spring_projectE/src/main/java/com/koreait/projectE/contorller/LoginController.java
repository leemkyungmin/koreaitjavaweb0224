package com.koreait.projectE.contorller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.projectE.command.CustomerEmailAuthCommand;
import com.koreait.projectE.command.CustomerSignUpCommand;
import com.koreait.projectE.command.DeptSignUpCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;


@Controller
public class LoginController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	
	
	@RequestMapping("loginChoicePage")
	public String loginChoicePage() {
		return "login/loginChoicePage";
	}
	
	@RequestMapping("customerLoginPage")
	public String goCustomerLoginPage() {
		return "login/customerLoginPage";
	}
	@RequestMapping("deptLoginPage")
	public String goDeptLoginPage() {
		return "login/deptLoginPage";
	}
	
	@RequestMapping("customerSignUp")
	public String goSignUpPage() {
		return "login/customerSignUpPage";
	}
	
	@RequestMapping("deptSignUpPage")
	public String godeptSingUpPage() {
		return "login/deptSignUpPage";
	}
	
	@RequestMapping(value="customerSignUp", method=RequestMethod.POST)
	public String customerSignUp(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		command = new CustomerSignUpCommand();
		command.execute(sqlSession, model);
		return "redirect:customerLoginPage"; 
	}
	
	@RequestMapping(value="deptSignUp", method=RequestMethod.POST)
	public String deptSignUp(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new DeptSignUpCommand();
		command.execute(sqlSession, model);
		return "redirect:deptLoginPage";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String idCheck(@RequestParam("cId") String cId) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.idCheck(cId) + "";
	}
	
	@RequestMapping(value="NicknameCheck", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String NicknameCheck(@RequestParam("cNickname") String cNickname) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.NicknameCheck(cNickname) + "";
	}
	
	
	@RequestMapping(value="emailCheck", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String emailCheck(@RequestParam("cEmail") String cEmail) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.emailCheck(cEmail) + "";
	}
	
	// ▼▼▼▼▼▼▼▼▼▼▼▼ 이메일 인증 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	@Autowired
	private JavaMailSender mailSender; // root-context.xml 의 빈 자동생성
	
	@RequestMapping("emailAuthMapping")
	@ResponseBody
	public String emailAuth(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("mailSender", mailSender);
		CustomerEmailAuthCommand command = new CustomerEmailAuthCommand();
		return command.execute(sqlSession, model) + "";
	}
	
	@RequestMapping(value="singleUpload", method=RequestMethod.POST)
	public String singleUpload(MultipartHttpServletRequest mr, Model model) {
		
		// 1. 업로드 없는 경우 : HttpRequest request
		// 2. 업로드 있는 경우 : MultipartHttpRequest request (mr)
		
		model.addAttribute("mr", mr);
		//
		command.execute(sqlSession, model);
		
		return "redirect:imageBoardListPage";
	}
	
	
	
}













