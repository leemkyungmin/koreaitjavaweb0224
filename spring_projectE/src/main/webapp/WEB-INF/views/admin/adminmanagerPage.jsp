<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>회원관리</h3>
	<table border="1">
			<c:forEach var="user" items="${cList }">
			<tr>
				<td bgcolor="skyblue">번호</td>
				<td>${user.cNo }</td>
				<td bgcolor="skyblue">이름</td>
				<td>${user.cName }</td>
				<td bgcolor="skyblue">닉네임</td>
				<td>${user.cNickname }</td>
				<td bgcolor="skyblue">아이디</td>
				<td>${user.cId }</td>
				<td bgcolor="skyblue">비밀번호</td>
				<td>${user.cPw }</td>
				<td bgcolor="skyblue">휴대폰번호</td>
				<td>${user.cPhone }</td>
				<td bgcolor="skyblue">이메일</td>
				<td>${user.cEmail }</td>
				<td bgcolor="skyblue">등급</td>
				<td>${user.cGrade }</td>
				<td bgcolor="skyblue">업체</td>
				<td>${user.cDept }</td>
				<td bgcolor="skyblue">성별</td>
				<td>성별${user.cGender }</td>
				<td>
					<input type="button" value="회원 정보 삭제" onclick=""/>
					<input type="button" value="회원 정보 수정" onclick=""/>
				</td>
			</tr>
			</c:forEach>
	</table>

	<br/><br/>
	
	<h3>업체관리</h3>	
		<table border="1">
			<c:forEach var="dept" items="${dList }">
				<tr>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dSeat }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dSaup_no}</td>
					<td bgcolor="gray">휴대폰번호</td>
					<td>${dept.dPhone }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
					<td bgcolor="gray">번호</td>
					<td>${dept.dNo }</td>
				</tr>
			</c:forEach>
		</table>
	<br/><br/>
	
	로그아웃
	
	<input type="button" value="로그아웃" onclick="location.href='loginChoicePage'" />

</body>
</html>