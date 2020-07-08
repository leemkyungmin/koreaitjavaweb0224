<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
	<title>예약 페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javaScript" language="javascript"></script>
	
	<style type="text/css">
	
		body {
			scrollbar-face-color: #F6F6F6;
			scrollbar-highlight-color: #bbbbbb;
			scrollbar-3dlight-color: #FFFFFF;
			scrollbar-shadow-color: #bbbbbb;
			scrollbar-darkshadow-color: #FFFFFF;
			scrollbar-track-color: #FFFFFF;
			scrollbar-arrow-color: #bbbbbb;
			margin: 0;
		}
		
		.calendar{
			width:20%;
			margin:auto;
		}
		
		.navigation{
			margin-top:100px;
			margin-bottom:30px;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
		
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		
		.before_after_year{
			font-weight: bold;
		}
		
		.this_month{
			margin: 10px;
		}
		
		.day{
			width: 100px; 
			height: 30px;
			font-size: 15px;
			font-weight: bold;
			text-align: center;
		}
		
		.sat{
			color:#529dbc;
		}
		
		.sun{
			color:red;
		}
		
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			margin-bottom: 50px;
			border-collapse: collapse;
		}
		
		.calendar_body .today{
			border:1px solid white;
			height:50px;
			background-color:#c9c9c9;
			text-align: left;
			vertical-align: top;
		}
		
		.calendar_body .date{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.calendar_body .sat_day{
			border:1px solid white;
			height:50px;
			background-color:#EFEFEF;
			text-align:left;
			vertical-align: top;
		}
		
		.calendar_body .sat_day .sat{
			color: #529dbc; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.calendar_body .sun_day{
			border:1px solid white;
			height:50px;
			background-color:#EFEFEF;
			text-align: left;
			vertical-align: top;
		}
		
		.calendar_body .sun_day .sun{
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.calendar_body .normal_day{
			border:1px solid white;
			height:50px;
			background-color:#EFEFEF;
			vertical-align: top;
			text-align: left;
		}
		
		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		
		.contents {
			width:20%;
			margin:auto;
		}
		
		.appintment_table {
			width: 100%;
		}
		
		.appintment_table tr {
			width: 100%;
		}
		
		.text_subject{
			width: 20%;
		    font-size: 18px;
		    vertical-align: middle;
		    text-align: center;
		}
		
		.text_desc {
			width: 80%;
		}
		
		.text_type1 {
			width: 100%;
			font-size: 18px;
			border: 0;
		}
		
		/* .deactive {
			display: none;
		} */
		
		
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}

		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
		A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
		
		.today_button_div{
			float: right;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}		
		
	</style>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	
</head>
<body>
	
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">

		<input type="hidden" name="year" value="${today_info.search_year}" />
		<input type="hidden" name="month" value="${today_info.search_month}" />

		<div class="calendar" >
			<!--날짜 네비게이션  -->
			<div class="navigation">
				<!-- 이전해 -->
				<!-- 버튼을 누르면 달력리스트 새로 가져와야 하므로, CalendarController 한번 더 다녀온다 -->
				<a class="before_after_year" href="calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}">&lt;&lt;</a> 
				<!-- 이전달 -->
				<a class="before_after_month" href="calendar?year=${today_info.before_year}&month=${today_info.before_month}">&lt;</a> 
				
				<!-- yyyy.mm -->
				<span class="this_month">
					&nbsp;${today_info.search_year}. 
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span>
				
				<!-- 다음달 -->
				<a class="before_after_month" href="calendar?year=${today_info.after_year}&month=${today_info.after_month}">&gt;</a> 
				<!-- 다음해 -->
				<a class="before_after_year" href="calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}">&gt;&gt;</a>
			</div>

			<!-- 달력 테이블 -->
			<table class="calendar_body">
				<thead>
					<tr bgcolor="#CECECE">
						<td class="day sun" >일</td>
						<td class="day" >월</td>
						<td class="day" >화</td>
						<td class="day" >수</td>
						<td class="day" >목</td>
						<td class="day" >금</td>
						<td class="day sat" >토</td>
					</tr>
				</thead>
				
				<tbody>
					<tr class="appointBtn">
						<!-- 
							class="today" 오늘 : 달력 CSS를 다르게 설정
							class="sat_day" 토요일 : 달력 CSS를 다르게 설정
							class="sun_day" 일요일 : tr이 끝나므로 닫고 새로 시작함
							class="normal_day" 월~금
						 -->
						<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<td class="today click">
										<button onclick="fn_a(${dateList.date})">
										<div class="date">${dateList.date}</div>
										</button>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day click">
										<button onclick="fn_a(${dateList.date})">
										<div class="sat">${dateList.date}</div>
										</button>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
									</tr>
									<tr>	
										<td class="sun_day click">
											<button onclick="fn_a(${dateList.date})">
											<div class="sun">${dateList.date}</div>
											</button>
										</td>
								</c:when>
								<c:otherwise>
									<td class="normal_day click">
										<button onclick="fn_a(${dateList.date})">
										<div class="date">${dateList.date}</div>
										</button>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</form>
	
	<script type="text/javascript">
		
		function fn_a(da) {
			/* $('#myForm').removeClass('deactive'); */
			$('.text_type1').val('${today_info.search_year}년 ${today_info.search_month}월 ' + da + '일');
		}
		
	</script>
	
	<form name="appointment_form">
		<div id="myForm" class="contents deactive">
			<table class="appintment_table">
				<tr>
					<td class="text_subject">날짜 :</td>
					<td class="text_desc"><input type="text" name="aDate" class="text_type1" /></td>
				</tr>
				<tr>
					<td class="text_subject">시간 :</td>
					<td class="text_desc">
						<!-- 영업시간 별로 생성 -->			
						<select name="">
							<option value="11:00">11:00</option>
							<option value="12:00">12:00</option>
						</select>
					</td> 
				</tr>
				<tr>
					<td class="text_subject">인원 :</td>
					<td class="text_desc">
						<select name="aP_count">
							<option value="1">1명</option>
							<!-- 음식점 좌석 수 만큼 생성 -->
						</select>	
					</td>
				</tr>
			</table>
			<input type="button" value="예약하기" />
		</div>
	</form>
	
</body>
</html>
