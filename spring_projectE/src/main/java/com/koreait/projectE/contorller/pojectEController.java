package com.koreait.projectE.contorller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.koreait.projectE.command.AppointmentInsertCommand;
import com.koreait.projectE.command.ReviewInsertCommand;
import com.koreait.projectE.command.boardViewCommand;
import com.koreait.projectE.command.reviewWriteCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dao.DateData;
import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.ReviewDTO;



@Controller
public class pojectEController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;


	
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
		return "redirect:viewPage?dSaup_no="+mrequest.getParameter("dSaup_no");
	}
	
	//테스트용 
	@RequestMapping("insertPage")
	public String insertPage(@RequestParam("dSaup_no") String dSaup_no,@RequestParam("cNo") int cNo,Model model) {
		
		model.addAttribute("dSaup_no", dSaup_no);
		model.addAttribute("cNo", cNo);
		
		return "board/insertPage";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
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
	

	
	
	// 예약 달력 테스트
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		
		// 달력 페이지가 처음 실행되면,오늘 날짜로 date 생성
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		// 이번달에 대한 모든 정보를 가져온다
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		
		// 달력 데이터 리스트 생성
		List<DateData> dateList = new ArrayList<DateData>();
		
		// 1일에 해당하는 요일까지 null 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		// 1일부터 말일까지 데이터 리스트 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		// 마지막 주를 직사각형 모양으로 맞추기 위해 비어있는 만큼 null 삽입
		int index = 7-dateList.size()%7;
		if(dateList.size()%7!=0){
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		model.addAttribute("dateList", dateList); // 달력 배열
		model.addAttribute("today_info", today_info); // 오늘 날짜에 대한 정보

		String dSaup_no = request.getParameter("dSaup_no");
		BoardDAO bDAO = sqlSession.getMapper(BoardDAO.class);
		DepartmentDTO deptDTO = bDAO.DepartView(dSaup_no);
		model.addAttribute("deptDTO", deptDTO);
		model.addAttribute("cNo", request.getParameter("cNo"));
		
		System.out.println(deptDTO.getdSaup_no());
		
		return "board/bookPage"; // view
	}
	
	// Modal test
	@RequestMapping("test")
		public String goTest() {	
		return "board/testPage";
	}
	
	@RequestMapping(value = "insertAppointment", method = RequestMethod.POST)
	public String insertAppointment(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		command= new AppointmentInsertCommand();
		command.execute(sqlSession, model);
		return "redirect:viewPage?dSaup_no="+request.getParameter("dSaup_no");
	}

}
