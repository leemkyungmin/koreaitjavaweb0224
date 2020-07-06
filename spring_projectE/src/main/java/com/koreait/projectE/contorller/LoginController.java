package com.koreait.projectE.contorller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.projectE.command.CustomerSignUpCommand;
import com.koreait.projectE.commom.Command;

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
	
	@RequestMapping("deptSignUp")
	public String godeptSingUpPage() {
		return "login/deptSignUpPage";
	}
	
	@RequestMapping(value="customerSignUp", method=RequestMethod.POST)
	public String customerSignUp(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new CustomerSignUpCommand();
		command.execute(sqlSession, model);
		return "redirec:index"; 
	}
	
}
