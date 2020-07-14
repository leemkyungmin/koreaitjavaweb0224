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
				<td>상호명</td>
				<td>${deptDTO.dName}(${deptDTO.dSaup_no})</td>
			</tr>
			<tr>
				<td>업종</td>
				<td>${deptDTO.dType}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${deptDTO.dAddress}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
			</tr>
			<tr>
				<td>영업시간</td>
				<td>${fn:substring(deptDTO.dStart, 0, 2)}:${fn:substring(deptDTO.dStart, 2, 4)} ~ ${fn:substring(deptDTO.dEnd,0,2)}:${fn:substring(deptDTO.dEnd,2,4)}(${deptDTO.dSeat}석)</td>
			</tr>
			<tr>
				<td>주차</td>
				<td>${dept.dParking ==1 ? '주차 가능' : '주차 불가' }</td>
			</tr>
		</table>
		
		<input type="hidden" name="dSaup_no" value="${deptDTO.dSaup_no}" />
		<input type="submit" value="승인" /> 
		<input type="button" value="거절" /> 
		
	</form>

</body>
</html>