<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="LoginController" class="com.koreait.projectE.contorller.LoginController"></jsp:useBean>    
<%
	request.setCharacterEncoding("UTF-8");

	String cId = request.getParameter("cId");
	boolean flag = true;
	String str = "";
	if (cId == null) {
		cId = "";
	}
	
	if(!cId.equals("")){
	}
	if(flag) {
		str = "NO";
		out.print(str);
	}else{
		str="YSE";
		out.print(str);
	}
	
%>
