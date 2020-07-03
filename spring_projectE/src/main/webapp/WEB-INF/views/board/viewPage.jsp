<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.regex.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
	ArrayList<String> potoList= new ArrayList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<div class="poto">
			이미지 자리
		</div>
		<div class= "view_content">
			<span class="title">
				<h1 class="content">${deptDTO.dName}</h1>
			</span>
		</div>
	</div>
	

</body>
</html>