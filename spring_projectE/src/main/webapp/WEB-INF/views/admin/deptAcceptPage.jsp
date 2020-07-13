<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	
		table {
			margin: auto;
			width: 300px;
		}
	
	</style>

</head>
<body>

	<table>
		<tr>
			<td>상호명</td>
			<td>등록일</td>
			<td>승인상태</td>
		</tr>
		<c:if test="${empty deptList}">
			<tr>
				<td colspan="3">승인 대기중인 업체가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty deptList}">
			<c:forEach var="deptDTO" items="${deptList}">
				<tr>
					<td>${deptDTO.dName}</td>
					<td>${deptDTO.dReg_date}</td>
					<td>승인대기</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>