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
		
		.top_title {
			width: 100%;
			margin-left: 100px;
			margin-top: 100px;
			text-align: left;
			font-size: 30px;
			font-weight: bold;
		}
		
		.calendar{
			width:80%;
			margin:auto;
		}
		
		.navigation{
			width: 100%;
			margin-top:30px;
			margin-bottom:30px;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
	
		A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
		
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
		
		
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			margin-bottom: 30px;
			border-collapse: collapse;
		}
		
		..calendar_body thead, .calendar_body thead tr {width: 100%;}
		
		.calendar_body thead tr .day{
			width: 14%; 
			height: 30px;
			font-size: 15px;
			font-weight: bold;
			text-align: center;
		}
		
		.calendar_body thead tr .sat{
			color:#529dbc;
		}
		
		.calendar_body thead tr .sun{
			color:red;
		}
		
		.dayCSS {
			border:1px solid white;
			width: 14%;
			height:50px;
			vertical-align: top;
			background-color:#EFEFEF;
		}
		
		.date{
			width: 100%;
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.sat{
			width: 100%;
			color: #529dbc; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.sun{
			width: 100%;
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		
		.today {
			width: 100%;
			text-align: center;
			font-size: 12px;
		}
		
		.notice {
			color: red;
			font-size: 12px;
		}
		
		.click_day {
			border:1px solid white;
			height:50px;
			text-align:left;
			vertical-align: top;
			background-color: lightblue;
		}
		
		.contents {
			width:50%;
			margin:auto;
		}
		
		.deactive {
			display: none;
		}
		
		.appintment_table {
			width: 100%;
			margin-left: 100px;
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
		
		.select_aDate_hour {
			width: 100px;
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
		
	</style>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</head>
<body>
	
	<form name="calendarFrm" id="calendarFrm" action="" method="GET">

		<input type="hidden" name="year" value="${today_info.search_year}" />
		<input type="hidden" name="month" value="${today_info.search_month}" />
		
		<div class="top_title">
			${deptDTO.dName} 예약
		</div>

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
									<td id="${dateList.date}" class="dayCSS"  onclick="fn_a(${dateList.date})">
										<div class="date">${dateList.date}</div>
										<div class="today">today</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td id="${dateList.date}" class="dayCSS"  onclick="fn_a(${dateList.date})">
										<div class="sat">${dateList.date}</div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==0}">
									</tr>
									<tr>	
										<td id="${dateList.date}" class="dayCSS" onclick="fn_a(${dateList.date})">
											<div class="sun" >${dateList.date}</div>
										</td>
								</c:when>
								<c:otherwise>
									<td id="${dateList.date}" class="dayCSS"  onclick="fn_a(${dateList.date})">
										<div class="date">${dateList.date}</div>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" class="notice">
							※ 예약을 원하시는 날짜를 클릭하세요.
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</form>
	
	<script type="text/javascript">
		
		var id = null;
		
		function fn_a(da) {
			if (da == undefined) {
			} else {
				$('#myForm').removeClass('deactive');
				$('.text_type1').val('${today_info.search_year}년 ${today_info.search_month}월 ' + da + '일');
				$('#aDate_day_hidden').val('${today_info.search_year} ${today_info.search_month} ' + da);
				// 클릭한 해당 td 색 변하게
				if (id == null) {
					$('#' + da).removeClass('dayCSS');
					$('#' + da).addClass('click_day');
					id = da;					
				} else {
					$('#' + id).removeClass('click_day');
					$('#' + id).addClass('dayCSS');
					$('#' + da).removeClass('dayCSS');
					$('#' + da).addClass('click_day');
					id = da;
				}
				
			}
			
			$.ajax({
				url: 'getRemainSeatANDTime',
				method: 'post',
				data: {'dSaup_no': ${deptDTO.dSaup_no}, 'aDate': '${today_info.search_year} ${today_info.search_month} ' + da} ,
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
			
			// Number.isInteger()사용시, 인터넷익스플로러에 적용되지 않으며, 정규식을 사용해야 적용됨.
			if (Number.isInteger(aP_count*1) == false) {
				alert('예약 인원을 확인해주세요.');
				return;
			}
			
			$.ajax({
				url: 'getRemainSeat',
				method: 'post',
				data: {'dSaup_no': ${deptDTO.dSaup_no}, 'aDate': date + ' ' + time},
				dataType: 'text',
				success: function (data) {
					if ((aP_count*1) > (1*data) || $('#aP_count_textbox').val() == '') {
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
			<div>
				<table>
					<tr>
						<td>예약자 :</td>
						<td><input type="text" name="" value="" readonly/></td>
					</tr>
					<tr>
						<td>연락처 :</td>
						<td><input type="text" name="" value="" readonly/></td>
					</tr>
				</table>
			</div>
			<div>
				<table class="appintment_table">
					<tr>
						<td class="text_subject">날짜 :</td>
						<td class="text_desc">
							<input id="aDate_day_textbox" type="text" class="text_type1" readonly/>
							<input id="aDate_day_hidden" type="hidden" name="aDate_day" />
						</td>
					</tr>
					<tr>
						<td class="text_subject">시간 :</td>
						<td class="text_desc remainPerson">		
						</td> 
					</tr>
					<tr>
						<td class="text_subject">인원 :</td>
						<td class="text_desc selectAp_count">
							<input id="aP_count_textbox" type="text" name="aP_count" placeholder="숫자" size="1" /> 명
						</td>
					</tr>
				</table>
			</div>
			<div class="submit_btn_wrap">
				<input class="submit_btn" type="button" value="예약하기" onclick="aP_countCHK(this.form)"/>
				<input type="hidden" name="cNo" value="${cNo}" />
				<input type="hidden" name="dSaup_no" value="${deptDTO.dSaup_no}" />
			</div>
		</div>
	</form>
		
</body>
</html>
