package com.koreait.projectE.contorller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("reviewWritePage")
	public String reviewPage() {
		return "board/reviewWritePage";
	}
	
	//테스트용 
	@RequestMapping("insertPage")
	public String insertPage(@RequestParam("dSaup_no") String dSaup_no,@RequestParam("cNo") int cNo,Model model) {
		
		model.addAttribute("dSaup_no", dSaup_no);
		model.addAttribute("cNo", cNo);
		
		return "board/insertPage";
	}
	//테스트
	

	
	
	

}
