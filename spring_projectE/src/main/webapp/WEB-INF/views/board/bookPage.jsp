<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
			margin-bottom: 20px;
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
		
		.deactive {
			display: none;
		}
		
		.select_aDate_hour {
			width: 100px;
			height: 20px;
		}
		
		.select_aP_count {
			width: 50px;
			height: 20px;
		}
		
		.submit_btn_wrap {
			width: 100%;
			text-align: center;
		}
		
		.submit_btn {
			padding: 5px;
			width: 50%;
			border: 0;
		}
		
		
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
			<div class="navigation">
				<a class="before_after_year" href="calendar?year=${today_info.search_year-1}&month=${today_info.search_month-1}&cNo=${cNo}&dSaup_no=${deptDTO.dSaup_no}">&lt;&lt;</a> 
				<a class="before_after_month" href="calendar?year=${today_info.before_year}&month=${today_info.before_month}&cNo=${cNo}&dSaup_no=${deptDTO.dSaup_no}">&lt;</a> 
				<span class="this_month">
					&nbsp;${today_info.search_year}. 
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span>
				<a class="before_after_month" href="calendar?year=${today_info.after_year}&month=${today_info.after_month}&cNo=${cNo}&dSaup_no=${deptDTO.dSaup_no}">&gt;</a> 
				<a class="before_after_year" href="calendar?year=${today_info.search_year+1}&month=${today_info.search_month-1}&cNo=${cNo}&dSaup_no=${deptDTO.dSaup_no}">&gt;&gt;</a>
			</div>

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
						<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
							<c:choose>
								<c:when test="${dateList.value=='today'}">
									<td class="today click"  onclick="fn_a(${dateList.date})">
										<div class="date">${dateList.date}</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day click"  onclick="fn_a(${dateList.date})">
										<div class="sat">${dateList.date}</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
									</tr>
									<tr>	
										<td class="sun_day click" onclick="fn_a(${dateList.date})">
											<div class="sun" >${dateList.date}</div>
										</td>
								</c:when>
								<c:otherwise>
									<td class="normal_day click"  onclick="fn_a(${dateList.date})">
										<div class="date">${dateList.date}</div>
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
			if (da == undefined) {
			} else {
				$('#myForm').removeClass('deactive');
				$('.text_type1').val('${today_info.search_year}년 ${today_info.search_month}월 ' + da + '일');
			}
			
			$.ajax({
				url: 'getRemainSeatANDTime',
				method: 'post',
				data: {'dSaup_no': ${deptDTO.dSaup_no}, 'aDate': '${today_info.search_year}년 ${today_info.search_month}월 ' + da + '일'},
				dataType: 'text',
				success: function(data){
					$('.remainPerson').empty();
					$('.remainPerson').html(data);
					$('#aP_count_textbox').val('');
				},
				error:function(){
					alert('ajax통신 실패');
				}
			});
		}
		
		function aP_countCHK(form) {
			var aP_count = $('#aP_count_textbox').val();
			var date =$('#aDate_day_textbox').val();
			var time = $('.select_aDate_hour').val();
			
			$.ajax({
				url: 'getRemainSeat',
				method: 'post',
				data: {'dSaup_no': ${deptDTO.dSaup_no}, 'aDate': date + ' ' + time},
				dataType: 'text',
				success: function (data) {
					if ((aP_count*1) > (1*data)) {
						alert('예약 인원을 확인해주세요.');
						$('#aP_count_textbox').val('');
						return;
					}
					form.action = 'insertAppointment';
					form.submit();
				},
				erreor: function() {
					alert('ajax통신 실패');
				}
			});
		}
		
	</script>
	
	<form name="appointment_form" method="post">
		<div id="myForm" class="contents deactive">
			<table class="appintment_table">
				<tr>
					<td class="text_subject">날짜 :</td>
					<td class="text_desc"><input id="aDate_day_textbox" type="text" name="aDate_day" class="text_type1" readonly/></td>
				</tr>
				<tr>
					<td class="text_subject">시간 :</td>
					<td class="text_desc remainPerson">		
					</td> 
				</tr>
				<tr>
					<td class="text_subject">인원 :</td>
					<td class="text_desc selectAp_count">
						<input id="aP_count_textbox" type="text" name="aP_count" placeholder="숫자만 입력" size="6" />
					</td>
				</tr>
			</table>
			<div class="submit_btn_wrap">
				<input class="submit_btn" type="button" value="예약하기" onclick="aP_countCHK(this.form)"/>
				<input type="hidden" name="cNo" value="${cNo}" />
				<input type="hidden" name="dSaup_no" value="${deptDTO.dSaup_no}" />
			</div>
		</div>
	</form>
		
</body>
</html>
