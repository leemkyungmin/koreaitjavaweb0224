<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="../template/header.jsp" %>
	
	일반 로그인
	
	<input type="button" value="일반 회원 로그인" onclick="location.href='customerLoginPage'" /> <br/>
	
	업체 로그인
	<input type="button" value="업체 회원 로그인" onclick="location.href='deptLoginPage'" />
	
</body>
</html>