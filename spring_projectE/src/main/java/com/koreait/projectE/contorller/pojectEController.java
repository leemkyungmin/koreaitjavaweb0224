package com.koreait.projectE.contorller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.koreait.projectE.command.boardViewCommand;
import com.koreait.projectE.commom.Command;

import com.koreait.projectE.dao.DAO;


@Controller
public class pojectEController {
	
	@Autowired

	private SqlSession sqlsession;
	
	private Command command;

	private SqlSession sqlSession;

	
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	

	@RequestMapping(value="viewPage",method=RequestMethod.GET)
	public String viewPage(HttpServletRequest request,Model model) {
		
		model.addAttribute("request",request);
		command= new boardViewCommand();
		command.execute(sqlsession, model);
		
		return "board/viewPage";
	}

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
	public String customerSignUp(@RequestParam("cId") String cId,
								 @RequestParam("cPw") String cPw,
								 @RequestParam("cName") String cName,
								 @RequestParam("cNickname") String cNickname,
								 @RequestParam("cEmail") String cEmail,
								 @RequestParam("cPhone") int cPhone,
								 @RequestParam("cGender") String cGender) {
		DAO dao = sqlSession.getMapper(DAO.class);
		dao.customerSignUp(cId, cPw, cName, cNickname, cEmail, cPhone, cGender);
		return "";
	}
	
	

}
