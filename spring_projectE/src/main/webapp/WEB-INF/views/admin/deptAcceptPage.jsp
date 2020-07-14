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
	
		table {
			margin: auto;
			width: 600px;
		}
		
		table, tr, td {
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
		}
		
		a {
			text-decoration: none;
			color: black;
			font-weight: bold;
		}
	
	</style>

</head>
<body>
	
	<form method="">
		<table>
			<tr>
				<td>사업자번호</td>
				<td>상호명</td>
				<td>전화번호</td>
				<td>업종</td>
				<td>등록일</td>
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
	</form>

</body>
</html>