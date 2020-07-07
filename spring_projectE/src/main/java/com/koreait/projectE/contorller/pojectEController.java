package com.koreait.projectE.contorller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.projectE.command.ReviewInsertCommand;
import com.koreait.projectE.command.boardViewCommand;
import com.koreait.projectE.command.reviewWriteCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dto.ReviewDTO;
import com.sun.mail.iap.Response;


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
	public String reviewPage(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		command= new reviewWriteCommand();
		command.execute(sqlSession, model);
		return "board/reviewWritePage";
	}
	

	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	public String insertReview(MultipartHttpServletRequest mrequest, Model model) {
		model.addAttribute("mrequest", mrequest);
		command = new ReviewInsertCommand();
		command.execute(sqlSession, model);
		return "redirect:index"; // 일단 index로 이동
	}
	
	//테스트용 
	@RequestMapping("insertPage")
	public String insertPage(@RequestParam("dSaup_no") String dSaup_no,@RequestParam("cNo") int cNo,Model model) {
		
		model.addAttribute("dSaup_no", dSaup_no);
		model.addAttribute("cNo", cNo);
		
		return "board/insertPage";
	}
	@RequestMapping(value="getReview", produces="application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity ajax_reviewList(HttpServletRequest request) {
		
		 HttpHeaders responseHeaders = new HttpHeaders();
		 ArrayList<HashMap> review_list = new ArrayList<HashMap>();
		 
		 String type=request.getParameter("type");
		 String dSaup_no=request.getParameter("dSaup_no");
		 BoardDAO bdao = sqlSession.getMapper(BoardDAO.class);
		 List<ReviewDTO> rdto =null ;
		 if(type.equals("all")) {
			 rdto=bdao.reviewAll(dSaup_no);
		 }else if(type.equals("ap")){
			 rdto=bdao.reviewAp(dSaup_no);
		 }else {
			 rdto=bdao.reviewNp(dSaup_no);
		 }
		
		 
		 if(rdto.size()>0) {
			 for(int i=0; i<rdto.size(); i++) {
				 HashMap re = new HashMap();
				 re.put("rNo", rdto.get(i).getrNo());
				 re.put("rTitle",rdto.get(i).getrTitle());
				 re.put("rContent", rdto.get(i).getrContent());
				 re.put("rWriter_date", rdto.get(i).getrWriter_date());
				 
				 review_list.add(re);
			 }
			 
		 }
		 JSONArray json = new JSONArray(review_list);
		 return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		 
	}
	

	
	
	

}
