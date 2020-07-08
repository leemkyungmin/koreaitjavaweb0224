<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
</head>
<body>
	<input type="button" class="btn_list" value="리스트 보기" onclick="goBack()"/>
	<br/><br/>
	${cDTO.cNo }
	
	<table border="1">
		
		<tr>
			<td>이름</td>
			<td>${cDTO.cName }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${cDTO.cGender}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${cDTO.cNickname }</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${cDTO.cId }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" value="${cDTO.cPw }"/></td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td><input type="text" value="${cDTO.cPhone }"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" value="${cDTO.cEmail }"/></td>
		</tr>
		<tr>
			<td>등급</td>
			<td>${cDTO.cGrade }</td>
		</tr>
		<tr>
			<td>가입날짜</td>
			<td>${cDTO.cRegdate }</td>
		</tr>
	</table>
	<br/>
	<input type="button" value="수정완료" onclick="" />
</body>
</html>