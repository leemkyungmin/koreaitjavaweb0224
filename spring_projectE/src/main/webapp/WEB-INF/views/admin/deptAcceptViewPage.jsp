<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	
		* {
			margin: 0;
			border: 0;
		}
		
		ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		    background-color: #333;
		}
		
		ul:after{
		    content:'';
		    display: block;
		    clear:both;
		}
		
		h2	{
	    	color: white;
	    	float: left;
	    	margin-left:100px;
	    	margin-right:100px;
	    }
	    
	    .top_button {
			float: left;
			border-top-left-radius: 5px; 
			border-bottom-left-radius: 5px;
			border-top-right-radius: 5px; 
			border-bottom-right-radius: 5px;
			margin-right:10px;
		}
		
		button	{ 
		    border: 1px solid skyblue; 
		    background-color: rgba(0,0,0,0); 
		    color: skyblue; 
		    padding: 5px; 
		    width:80px;
		    height:78px
		}
		
		button:hover{ 
			color:white; 
			background-color: skyblue; 
		}
		
		table {
			width: 500px;
			margin: auto;
			margin-top: 10px;
			margin-bottom: 10px;
			border-top: 3px solid #168;
			border-bottom: 3px solid #168;
			border-collapse: collapse;
		}
		
		table th {
			padding: 10px 0;
			color: #168;
			background: #f0f6f9;
			text-align: center;
			border: 1px solid #ddd;
			border-top: 1px solid #868686;
			font-size: 1.2em;
			letter-spacing: -0.1em;
		}
		
		table td {
			text-align: left;
			padding: 5px;
			padding-left: 15px;
			border: 1px solid #ddd;
		}
		
		div {
			margin: auto;
			text-align: center;
		}
		
		input {
			padding: 5px;
			display: inline-block;
			width: 100px;
			color: white;
			background: #168;
			border-radius: 5px;
		}
	
	</style>

</head>
<body>

	<ul>
		<li><h2>관리자페이지</h2></li>
		<li><button class="top_button" onclick="fn_cus_list()" >회원관리</button></li>
		<li><button class="top_button" onclick="fn_dept_list()">업체관리</button></li>
		<li><button class="top_button" onclick="location.href='deptAccpetPage'">업체 승인 관리</button><li>
	</ul>
	<br/><br/>

	<form method="post">
		<table>
			<tr>
				<th>상호명</th>
				<td>${deptDTO.dName} (${deptDTO.dSaup_no})</td>
			</tr>
			<tr>
				<th>업종</th>
				<td>${deptDTO.dType}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${deptDTO.dAddress}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td>${fn:substring(deptDTO.dStart, 0, 2)}:${fn:substring(deptDTO.dStart, 2, 4)} ~ ${fn:substring(deptDTO.dEnd,0,2)}:${fn:substring(deptDTO.dEnd,2,4)} (${deptDTO.dSeat}석)</td>
			</tr>
			<tr>
				<th>주차</th>
				<td>${deptDTO.dParking ==1 ? '주차 가능' : '주차 불가' }</td>
			</tr>
		</table>
		<div>
			<input type="hidden" name="dNo" value="${deptDTO.dNo}" />
			<input type="button" value="승인" onclick="endorse(this.form)"/> 
			<input type="button" value="거절" onclick="reject(this.form)"/> 
		</div>
	</form>
		
		<script type="text/javascript">
		
			function endorse(form) {
				if (!confirm('승인하시겠습니까?')) {
					return;
				}
				form.action='deptAccept';
				form.submit();
			}
		
			function reject(form) {
				if (!confirm('거절하시겠습니까?')) {
					return;
				}
				form.action='deptReject';
				form.submit();
			}
		
		</script>
		
</body>
</html>