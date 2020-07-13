package com.koreait.projectE.contorller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koreait.projectE.command.ListCommand;
import com.koreait.projectE.command.LocationListCommand;
import com.koreait.projectE.commom.Command;

@Controller
public class listController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;


	@RequestMapping("/")
	public String goIndex(Model model) {
		command=new ListCommand();
		command.execute(sqlSession, model);
		return "index";
	}
	
	@RequestMapping("main")
	public String goMain(Model model) {
		command= new ListCommand();
		command.execute(sqlSession, model);
		return "main";
	}
	@RequestMapping("locationlist")
	public String golocation_list(@RequestParam("location") String location,Model model) {
		
		model.addAttribute("location", location);
		command=new LocationListCommand();
		command.execute(sqlSession, model);
		return "board/location_list";
	}
	
	
	
	
}
