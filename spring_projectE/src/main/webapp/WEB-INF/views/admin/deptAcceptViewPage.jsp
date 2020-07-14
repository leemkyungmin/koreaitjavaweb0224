<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<tr>
				<td>${deptDTO.dSaup_no}</td>
				<td>${deptDTO.dName}</td>
				<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
				<td>${deptDTO.dType}</td>
				<td>${deptDTO.dReg_date}</td>
			</tr>
		</table>
	</form>

</body>
</html>