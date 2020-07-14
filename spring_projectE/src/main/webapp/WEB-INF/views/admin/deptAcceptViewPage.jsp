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
		
		table {
			margin: auto;
			margin-top: 50px;
			margin-bottom: 10px;
			width: 500px;
			border-collapse: collapse;
		}
		
		th {
			padding: 10px 0;
			background: #F9F9F9;
			font-size: 15px;
			letter-spacing: -0.1em;
		}
		
		td {
			text-align: left;
			padding: 5px;
			padding-left: 15px;
		}
		
		tr:first-of-type {
			border-top: 1px solid #868686;
		}
		tr:last-of-type {
			border-bottom: 1px solid #868686;
		}
		
		div {
			margin: auto;
			text-align: center;
		}
		
		input {
			padding: 5px;
			display: inline-block;
			width: 100px;
		}
	
	</style>

</head>
<body>

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
			<input type="hidden" name="dSaup_no" value="${deptDTO.dSaup_no}" />
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