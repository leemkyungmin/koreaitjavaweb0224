<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		
		* {
			margin: 0;
		}
		
		table {
			margin: auto;
			margin-top: 50px;
			width: 600px;
			border-collapse: collapse;
		}
		
		th {
			padding: 10px 0;
			border-top: 1px solid #868686;
			border-bottom: 1px solid #E5E5E5;
			background: #F9F9F9;
			font-size: 1.2em;
			letter-spacing: -0.1em;
		}
		
		td {
			text-align: center;
			padding: 5px;
		}
		
		tr:last-of-type {
			border-bottom: 1px solid #868686;
		}
		
		a {
			text-decoration: none;
			color: black;
			font-weight: bold;
		}
	
	</style>

</head>
<body>
	
	<table>
		<tr>
			<th>사업자번호</th>
			<th>상호명</th>
			<th>전화번호</th>
			<th>업종</th>
			<th>등록일</th>
		</tr>
		<c:if test="${empty deptList}">
			<tr>
				<td colspan="5">승인 대기중인 업체가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty deptList}">
			<c:forEach var="deptDTO" items="${deptList}">
				<tr>
					<td>${deptDTO.dSaup_no}</td>
					<td><a href="deptAcceptView?dNo=${deptDTO.dNo}">${deptDTO.dName}</a></td>
					<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
					<td>${deptDTO.dType}</td>
					<td>${deptDTO.dReg_date}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>