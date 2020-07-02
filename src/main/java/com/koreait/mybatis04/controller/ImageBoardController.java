package com.koreait.mybatis04.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.mybatis04.command.ImageBoardCommand;
import com.koreait.mybatis04.command.ImageBoardDownloadCommand;
import com.koreait.mybatis04.command.ImageBoardMultiUploadCommand;
import com.koreait.mybatis04.command.ImageBoardSingleUploadCommand;
import com.koreait.mybatis04.command.emailAuthCommand;
import com.koreait.mybatis04.command.imageBoardListCommand;

@Controller
public class ImageBoardController {

	@Autowired
	private SqlSession sqlsession;
	
	private ImageBoardCommand imageBoardCommand;
	
	@RequestMapping("/")
	public String goIndex() {
		
		return "index";
	}
	@RequestMapping("UploadPage")
	public String UploadPage() {
		
		return "UploadPage";
	}
	
	@RequestMapping(value="singleUpload",method=RequestMethod.POST)
	public String goSingleUpload(MultipartHttpServletRequest mr,Model model) {
		// 1. 파일 업로드 없는 경우 HttpServletRequest reqest 
		// 2. 파일 업로드가 있는 경우 MultipartHttpServletRequest mr
		
		model.addAttribute("mr",mr);
		
		imageBoardCommand = new ImageBoardSingleUploadCommand();
		imageBoardCommand.execute(sqlsession, model);
		
		return "redirect:imageBoardListPage";
	}
	
	@RequestMapping("imageBoardListPage")
	public String imageBoardListPage(Model model) {
		
		imageBoardCommand=new imageBoardListCommand();
		imageBoardCommand.execute(sqlsession, model);
		
		return "imageBoardListPage";
	}
	@RequestMapping(value="multiUpload",method=RequestMethod.POST)
	public String multiUpload(MultipartHttpServletRequest mr,Model model) {
		
		model.addAttribute("mr",mr);
		
		imageBoardCommand = new ImageBoardMultiUploadCommand();
		imageBoardCommand.execute(sqlsession, model);
		
		return "redirect:imageBoardListPage";
	}
	@RequestMapping("download")
	public void download(HttpServletRequest request,HttpServletResponse response,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		
		imageBoardCommand  = new ImageBoardDownloadCommand();
		imageBoardCommand.execute(sqlsession, model);
		
	}
	
	// ****************** 이메일 인증
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("emailAuth")
	public String emailAuth(@RequestParam("email") String email,Model model) {
		model.addAttribute("email", email);
		model.addAttribute("mailSender", mailSender);
		imageBoardCommand  = new emailAuthCommand();
		imageBoardCommand.execute(sqlsession, model);
		return "emailAuthConfirm";  //이메일 인증코드를   emailAuthConfirm.jsp 로 보내준다.
	}
	
}
