package com.koreait.projectE.contorller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.projectE.command.Board.AppointmentInsertCommand;
import com.koreait.projectE.command.Board.ReviewDetailCommand;
import com.koreait.projectE.command.Board.ReviewInsertCommand;
import com.koreait.projectE.command.Board.ReviewUpdateCommand;
import com.koreait.projectE.command.Board.BoardViewCommand;
import com.koreait.projectE.command.Board.ReviewWriteCommand;
import com.koreait.projectE.commom.Command;
import com.koreait.projectE.dao.AppointmentDAO;
import com.koreait.projectE.dao.BoardDAO;
import com.koreait.projectE.dao.LoginDAO;
import com.koreait.projectE.dto.CustomerDTO;
import com.koreait.projectE.dto.DateData;
import com.koreait.projectE.dto.DepartmentDTO;
import com.koreait.projectE.dto.ReviewDTO;



@Controller	
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;


	@RequestMapping(value="viewPage",method=RequestMethod.GET)
	public String viewPage(HttpServletRequest request,Model model) {
		
		model.addAttribute("request",request);
		command= new BoardViewCommand();
		command.execute(sqlSession, model);
		
		return "board/viewPage";
	}
	
	@RequestMapping("reviewWritePage")
	public String reviewPage(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		command= new ReviewWriteCommand();
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
				 re.put("cNickname", rdto.get(i).getcNickname());
				 re.put("cPoto", rdto.get(i).getcPoto());
				 re.put("rPoint",rdto.get(i).getrPoint());
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
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)), null);
		}

		// 이번달에 대한 모든 정보를 가져온다
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		
		// 달력 데이터 리스트 생성
		List<DateData> dateList = new ArrayList<DateData>();
		
		// 1일에 해당하는 요일까지 null 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, "notButton");
			dateList.add(calendarData);
		}
		
		// 1일부터 말일까지 데이터 리스트 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else if (i<today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "notButton");
			}else {
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "Button");
			}
			dateList.add(calendarData);
		}

		// 마지막 주를 직사각형 모양으로 맞추기 위해 비어있는 만큼 null 삽입
		int index = 7-dateList.size()%7;
		if(dateList.size()%7!=0){
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, "notButton");
				dateList.add(calendarData);
			}
		}
		
		model.addAttribute("dateList", dateList); // 달력 배열
		model.addAttribute("today_info", today_info); // 오늘 날짜에 대한 정보
		
		String dSaup_no = request.getParameter("dSaup_no");
		int cNo = Integer.parseInt(request.getParameter("cNo"));
		
		BoardDAO bDAO = sqlSession.getMapper(BoardDAO.class);
		DepartmentDTO deptDTO = bDAO.DepartView(dSaup_no);
		model.addAttribute("deptDTO", deptDTO);
		
		LoginDAO lDAO = sqlSession.getMapper(LoginDAO.class);
		CustomerDTO cDTO = lDAO.selectBycNo(cNo);
		model.addAttribute("cDTO", cDTO);
		
		return "board/bookPage";
	}
	
	@RequestMapping(value = "insertAppointment", method = RequestMethod.GET)
	public String insertAppointment(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		command= new AppointmentInsertCommand();
		command.execute(sqlSession, model);
		return "redirect:viewPage?dSaup_no="+request.getParameter("dSaup_no");
	}
	
	@RequestMapping(value="getRemainSeatANDTime", produces="text/html; charset=utf-8", method = RequestMethod.GET)
	@ResponseBody
	public String getRemainSeatANDTime(HttpServletRequest request) {
		 String dSaup_no = request.getParameter("dSaup_no");
		 String aDate = request.getParameter("aDate");
		 		 
		 BoardDAO bDAO = sqlSession.getMapper(BoardDAO.class);
		 DepartmentDTO deptDTO = bDAO.DepartView(dSaup_no);
		 int dStart = Integer.parseInt(deptDTO.getdStart().substring(0, 2));
		 int dEnd = Integer.parseInt(deptDTO.getdEnd().substring(0, 2));
		 
		 AppointmentDAO aDAO = sqlSession.getMapper(AppointmentDAO.class);
		 
		 int[] remainSeat = new int[dEnd-dStart];
		 
		 // 선택한 날짜가 오늘인 경우 현재 시간 반영하여 예약 시간 선택
		 SimpleDateFormat ysdf = new SimpleDateFormat("yyyy");
		 SimpleDateFormat msdf = new SimpleDateFormat("MM");
		 SimpleDateFormat dsdf = new SimpleDateFormat("dd");
		 SimpleDateFormat hsdf = new SimpleDateFormat("hh");
		 Calendar today = Calendar.getInstance();
		 int year = Integer.parseInt(ysdf.format(today.getTime()));
		 int month = Integer.parseInt(msdf.format(today.getTime()));
		 int day = Integer.parseInt(dsdf.format(today.getTime()));
		 String todayStr = "" + year + month + day;
		 
		 String html ="<select class='select_aDate_hour' name='aDate_hour'>";

		 if (aDate.equals(todayStr)) {
			 int hour = Integer.parseInt(hsdf.format(today.getTime()));
			 if (hour < dEnd) {
				 int count = 0;
				 for (int i=hour+1; i<dEnd; i++) {
					 remainSeat[count] = aDAO.selectAp_count(dSaup_no, aDate + " " + i + "00");
					 html += "<option value="+ i + "00>";
					 html += i + ":00 (" +  remainSeat[count++];
					 html += "명)</option>";
				 }
			 } else {
				 html += "<option value=no>예약 가능한 시간이 없습니다.</option>";
			 }
		 } else {
			 for (int i=0; i<dEnd-dStart; i++) {
				 remainSeat[i] = aDAO.selectAp_count(dSaup_no, aDate + " " + (dEnd-(12-i)) + "00");
				 html += "<option value="+ (dEnd-(12-i)) + "00>";
				 html += (dEnd-(12-i)) + ":00 (" +  remainSeat[i];
				 html += "명)</option>";
			 }		 
		 }
		 
		 html += "</select>";
		 
		 return html;
	}
	
	@RequestMapping(value="getRemainSeat", produces="text/html; charset=utf-8", method = RequestMethod.GET)
	@ResponseBody
	public String getRemainSeat(HttpServletRequest request) {
		String dSaup_no = request.getParameter("dSaup_no");
		String aDate = request.getParameter("aDate");
		
		AppointmentDAO aDAO = sqlSession.getMapper(AppointmentDAO.class);
		String remainSeat = aDAO.selectAp_count(dSaup_no, aDate) + "";
		
		return remainSeat;
	}
	
	//리뷰 Detail
	@RequestMapping("reviewDetail")
	public String reviewDetail(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		command=new ReviewDetailCommand();
		command.execute(sqlSession, model);
		
		return "board/reviewDetail";
	}
	
	@RequestMapping("UpdateReview")
	public String ReviewUpdate(MultipartHttpServletRequest mrequest, Model model) {
		model.addAttribute("mrequest", mrequest);
		command = new ReviewUpdateCommand();
		command.execute(sqlSession, model);
		return "redirect:myPage";
	}

}
