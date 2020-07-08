package com.koreait.projectE.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class DateData {

	String year = "";
	String month = "";
	String date = "";
	String value = "";
	//스케쥴 추가시 아래처럼 
	//		1. 변수 추가
	//		2. getter/setter 추가
	//		3. 생성자 추가
	//				하여 사용하면 보다 편리하고 깨끗하게 코드를 만들 수 있다.
	String schedule = "";
	String schedule_detail = "";

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getSchedule_detail() {
		return schedule_detail;
	}

	public void setSchedule_detail(String schedule_detail) {
		this.schedule_detail = schedule_detail;
	}

	// 날짜에 관련된 달력정보를 가지는 메서드
	public Map<String, Integer> today_info(DateData dateData) {
		// 이번달 정보 Map에 담아
		Map<String, Integer> today_Data = new HashMap<String, Integer>();
		
		// calendar 객체에 이번달 1일 세팅
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(dateData.getYear()), Integer.parseInt(dateData.getMonth()), 1);
		
		// 이번달 1일 '월'의 시작일, 말일, 요일을 구한다
		int startDay = cal.getMinimum(java.util.Calendar.DATE); // DATE: 1~31일 -> 의 getMinimu은 1
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH); // DAY_OF_MONTH: 0~11월 -> getActualMaximum은 28, 30, 31 중 1개 
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK); // 1(일) ~ 7(토)
		
		// calendar 객체에 오늘 날짜 세팅
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat ysdf = new SimpleDateFormat("yyyy");
		SimpleDateFormat msdf = new SimpleDateFormat("M");

		// '오늘'에 해당하는 '년도', '월'을 simpleDateFormat을 이용해 구한다
		int today_year = Integer.parseInt(ysdf.format(todayCal.getTime())); // getTime()은 시간을 밀리세컨드로 변환해서 숫자 데이터로 반환한다
		int today_month = Integer.parseInt(msdf.format(todayCal.getTime()));

		int search_year = Integer.parseInt(dateData.getYear());
		int search_month = Integer.parseInt(dateData.getMonth()) + 1;
		
		int today = -1;
		// '올해' = '찾는 해', '이번달' = '찾는 달' == 오늘
		if (today_year == search_year && today_month == search_month) {
			SimpleDateFormat dsdf = new SimpleDateFormat("dd");
			today = Integer.parseInt(dsdf.format(todayCal.getTime()));
		}
		
		search_month = search_month-1; 
		
		// 페이지 상단의 << < > >> 구현
		Map<String, Integer> before_after_calendar = before_after_calendar(search_year,search_month);
		
		//날짜 관련
		System.out.println("search_month : " + search_month);
		// 캘린더 함수 end
		today_Data.put("start", start); // 1일에 해당하는 요일
		today_Data.put("startDay", startDay); // 1
		today_Data.put("endDay", endDay); // 말일
		today_Data.put("today", today); // 오늘날짜 구분
		today_Data.put("search_year", search_year);
		today_Data.put("search_month", search_month+1);
		today_Data.put("before_year", before_after_calendar.get("before_year")); // 이전년도
		today_Data.put("before_month", before_after_calendar.get("before_month")); // 이전달
		today_Data.put("after_year", before_after_calendar.get("after_year")); // 다음년도
		today_Data.put("after_month", before_after_calendar.get("after_month")); // 다음달
		return today_Data;
	}
	
	//이전달 다음달 및 이전년도 다음년도
	private Map<String, Integer> before_after_calendar(int search_year, int search_month){
		Map<String, Integer> before_after_data = new HashMap<String, Integer>();
		int before_year = search_year;
		int before_month = search_month-1; // 지난 달
		int after_year = search_year;
		int after_month = search_month+1; // 다음 달

		if(before_month<0){ // 이전달이 0보다 작으면 작년이야 (0이 1월)
			before_month=11;
			before_year=search_year-1;
		}
		
		if(after_month>11){ // 다음달이 11보다 크면 내년이야 (11이 12월)
			after_month=0;
			after_year=search_year+1;
		}
		
		before_after_data.put("before_year", before_year);
		before_after_data.put("before_month", before_month);
		before_after_data.put("after_year", after_year);
		before_after_data.put("after_month", after_month);
		
		return before_after_data;
	}
	
	// 스케줄 사용시 사용될 생성자
	public DateData(String year, String month, String date, String value, String schedule, String schedule_detail) {

		this.year = year;
		this.month = month;
		this.date = date;
		this.value = value;
		this.schedule = schedule;
		this.schedule_detail = schedule_detail;

	}

	// 달력만 사용시 사용될 생성자
	public DateData(String year, String month, String date, String value) {
		if ((month != null && month != "") && (date != null && date != "")) {
			this.year = year;
			this.month = month;
			this.date = date;
			this.value = value;
		}
	}

	public DateData() {
	}

	@Override
	public String toString() {
		return "DateData [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value + "]";
	}

}
