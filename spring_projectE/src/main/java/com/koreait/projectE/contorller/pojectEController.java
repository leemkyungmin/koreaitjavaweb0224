package com.koreait.projectE.contorller;

<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/leemkyungmin/koreaitjavaweb0224.git
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

<<<<<<< HEAD
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.commom.CustomerSignUpCommand;
=======

import com.koreait.projectE.command.boardViewCommand;
import com.koreait.projectE.commom.Command;

>>>>>>> branch 'master' of https://github.com/leemkyungmin/koreaitjavaweb0224.git
import com.koreait.projectE.dao.DAO;


@Controller
public class pojectEController {
	
	@Autowired
<<<<<<< HEAD
	private SqlSession sqlSession;
	private Command command;
=======

	private SqlSession sqlsession;
	
	private Command command;

	

>>>>>>> branch 'master' of https://github.com/leemkyungmin/koreaitjavaweb0224.git
	
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
<<<<<<< HEAD
	public String customerSignUp(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		command = new CustomerSignUpCommand();
		command.execute(sqlSession, model);
		return "redirec:index";
=======
	public String customerSignUp(@RequestParam("cId") String cId,
								 @RequestParam("cPw") String cPw,
								 @RequestParam("cName") String cName,
								 @RequestParam("cNickname") String cNickname,
								 @RequestParam("cEmail") String cEmail,
								 @RequestParam("cPhone") int cPhone,
								 @RequestParam("cGender") String cGender) {
		DAO dao = sqlsession.getMapper(DAO.class);
		dao.customerSignUp(cId, cPw, cName, cNickname, cEmail, cPhone, cGender);
		return "";
>>>>>>> branch 'master' of https://github.com/leemkyungmin/koreaitjavaweb0224.git
	}
	
	

}
