package com.koreait.projectE.contorller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.koreait.projectE.command.Login.CustomerEmailAuthCommand;
import com.koreait.projectE.command.Login.CustomerFindIdPwCommand;
import com.koreait.projectE.command.Login.CustomerMyPageCommand;
import com.koreait.projectE.command.Login.CustomerSignUpCommand;
import com.koreait.projectE.command.Login.DepartmentMyPageCommand;
import com.koreait.projectE.command.Login.DepartmentUpdateCommand;
import com.koreait.projectE.command.Login.DeptSignUpCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.LoginDAO;
import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DepartmentLoginDTO;


@Controller
public class LoginController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	
	@RequestMapping("index")
	public String goIndex() {
		
		return "redirect:/";
	}
	
	@RequestMapping("loginChoicePage")
	public String loginChoicePage(HttpServletRequest request) {
		
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
	
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new CustomerMyPageCommand();
		command.execute(sqlSession, model);
		return "login/customerMyPage";
	}
	@RequestMapping("deptmyPage")
	public String deptmyPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new DepartmentMyPageCommand();
		command.execute(sqlSession, model);
		return "login/deptMyPage";
	}
	
	
	@RequestMapping(value="customerSignUp", method=RequestMethod.POST)
	public String customerSignUp(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		command = new CustomerSignUpCommand();
		command.execute(sqlSession, model);
		return "redirect:loginChoicePage"; 
	}
	
	
	
	@RequestMapping(value="deptUpdate", method=RequestMethod.POST)
	public String deptUpdate(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		command = new DepartmentUpdateCommand();
		command.execute(sqlSession, model);
		return "redirect:deptmyPage"; 
	}
	
	@RequestMapping(value="deptSignUp", method=RequestMethod.POST)
	public String deptSignUp(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new DeptSignUpCommand();
		command.execute(sqlSession, model);
		return "redirect:loginChoicePage";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String idCheck(@RequestParam("cId") String cId) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.idCheck(cId) + "";
	}
	@RequestMapping(value="deptidCheck", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String deptidCheck(@RequestParam("dId") String dId) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.deptidCheck(dId) + "";
	}
	@RequestMapping(value="dSaup_noCheck", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String dSaup_noCheck(@RequestParam("dSaup_no") String dSaup_no) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.dSaup_noCheck(dSaup_no) + "";
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
	
	
	@RequestMapping(value="customerLogin", method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String customerLogin(HttpServletRequest request) {
		
		String cId = request.getParameter("cId");
		String cPw = request.getParameter("cPw");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		CustomerDTO cDTO = new CustomerDTO();
		cDTO = lDAO.customerLogin(cId, cPw);
		String result = "0";
		if (cDTO != null) {
			request.getSession().setAttribute("cId", cDTO.getcId());
			request.getSession().setAttribute("cNo", cDTO.getcNo());
			request.getSession().setAttribute("cNickname", cDTO.getcNickname());
			result = "1";
		}
				 
		return result;
	}
	
	@RequestMapping(value="departmentLogin", method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String departmentLogin(HttpServletRequest request) {
		
		String dId = request.getParameter("dId");
		String dPw = request.getParameter("dPw");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		DepartmentLoginDTO dDTO = new DepartmentLoginDTO();
		dDTO = lDAO.departmentLogin(dId, dPw);
		String result = "0";
		if (dDTO != null) {
			request.getSession().setAttribute("dId", dDTO.getdId());
			request.getSession().setAttribute("dSaup_no", dDTO.getdSaup_no());
			request.getSession().setAttribute("dPw", dDTO.getdPw());
			result = "1";
		}
				 
		return result;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		
		if (session != null) {
			session.invalidate();
		}
		
		return "redirect:loginChoicePage";
		
	}
	
	
	@RequestMapping(value="pwUpdate", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String pwUpdate(@RequestParam("cPw") String cPw, @RequestParam("cNo")int cNo) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.pwUpdate(cPw, cNo) + "";
	}
	@RequestMapping(value="deptpwUpdate", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String deptpwUpdate(@RequestParam("dPw") String dPw, @RequestParam("dSaup_no")String dSaup_no) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.deptpwUpdate(dPw, dSaup_no) + "";
	}
	
	@RequestMapping(value="nicknameUpdate", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String nicknameUpdate(@RequestParam("cNo")int cNo ,@RequestParam("cNickname") String cNickname) {
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		return lDAO.nicknameUpdate(cNickname, cNo) + "";
	}
	
	
	//사용자 아이디 비밀번호 찾기 
	
	@RequestMapping("findUserIdPw")
	public String goFindUserId() {
		
		return "login/findUserIdPw";
	}
	
	//사용자 아이디 찾기 
	@RequestMapping(value="find_user_id", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String find_uId(HttpServletRequest request,Model model) {
		String cName  = request.getParameter("cName");
		String cEmail  = request.getParameter("cEmail");
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		String cId =lDAO.finduId(cName, cEmail);
		String message ="";
		
		if(cId !=null) {
			model.addAttribute("cId", cId);
			model.addAttribute("cName", cName);
			model.addAttribute("cEmail", cEmail);
			model.addAttribute("type", "id");
			model.addAttribute("mailSender", mailSender);
			CustomerFindIdPwCommand cmd =new CustomerFindIdPwCommand();
			 cmd.execute(sqlSession, model);
			
			message ="등록된 이메일로 아이디를 보냈습니다.";
		}else {
			message ="등록된 사용자가 없습니다. 다시 확인해주세요";
		}
		
		return message;
	}
	//유저 비밀번호 찾기 
	@RequestMapping(value="find_user_pw", method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String find_uPw(HttpServletRequest request,Model model) {
		String cId  = request.getParameter("cId");
		String cEmail  = request.getParameter("cEmail");
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		int count =lDAO.finduPw(cId, cEmail);
		System.out.println(count);
		String message ="";
		if(count>0) {
			model.addAttribute("cId", cId);
			//model.addAttribute("cName", cName);
			model.addAttribute("cEmail", cEmail);
			model.addAttribute("type", "pw");
			model.addAttribute("mailSender", mailSender);
			CustomerFindIdPwCommand cmd =new CustomerFindIdPwCommand();
			String emailAuth = (String) cmd.execute(sqlSession, model);
			lDAO.UpdateTempPw(cId,emailAuth);
			message ="등록된 이메일로 임시 비밀번호를 보냈습니다.";
		}else {
			message ="등록된 사용자가 없습니다. 다시 확인해주세요";
		}
		
		return message;
	}
	
}













