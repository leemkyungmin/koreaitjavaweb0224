<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<style type="text/css">
	table {
		border: 1px solid;
		border-collapse: collapse;	
	}
	tr, td {
		border: 1px solid;
	}
	table {
		margin: 0 auto;
	}	
	ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    background-color: #333;
	}	
	ul:after{
	    content:'';
	    display: block;
	    clear:both;
	}	
	h2	{
    	color: white;
    	float: left;
    	margin-left:100px;
    	margin-right:100px;
    }
    #listbtn {
		float: left;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		margin-right:10px;
	}
	li>button	{ 
	    border: 1px solid skyblue; 
	    background-color: rgba(0,0,0,0); 
	    color: skyblue; 
	    padding: 5px; 
	    width:80px;
	    height:78px
	}
	li>button:hover{ 
		color:white; 
		background-color: skyblue; 
	}
	table.user {
    border-collapse: collapse;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
 	 margin : 20px 10px;
	}
	table.user th {
	    width: 147px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #153d73;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
		background: #efefef;
	}
	table.user td {
	    width: 349px;
	    padding: 10px;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	button {
	width:100px;
    background-color: #f8585b;
    border: none;
    padding: 15px 0;
    color:#fff;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}



출처: https://nimolove.tistory.com/44 [Chaeni_vlog 🌈]
	
</style>
</head>
<body>
	<ul>
	<li><h2>관리자페이지</h2></li>
	<li><button id="listbtn" style="display: block; width:80px; margin: 0 auto;" type="button" class="btn_list" onclick="goBack()">회원리스트</button></li>
	</ul>
	<br/><br/>
	
	<form action="UpdateUser">
		<table class="user">
			
			<tr>
				<th>이름</th>
				<td>${cDTO.cName }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${cDTO.cGender}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${cDTO.cNickname }</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>${cDTO.cId }</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>${cDTO.cPw }"</td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td>${cDTO.cPhone }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${cDTO.cEmail }</td>
			</tr>
			<tr>
				<th>등급</th>
				<td><input type="text" name="cGrade"  value="${cDTO.cGrade }"/></td>
			</tr>
			<tr>
				<th>가입날짜</th>
				<td>${cDTO.cRegdate }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" value="${cDTO.cNo }" name=cNo>
					<button type="submit" id="btnUpdate" >수정</button>
				</td> 
			</tr>
		</table>
	</form>
	<br/>
</body>
</html>