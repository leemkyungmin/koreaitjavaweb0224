<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
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
	button	{ 
	    border: 1px solid skyblue; 
	    background-color: rgba(0,0,0,0); 
	    color: skyblue; 
	    padding: 5px; 
	    width:80px;
	    height:78px
	}
	button:hover{ 
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
</style>
</head>
<body>

	<ul>
	<li><h2>관리자페이지</h2></li>
	<li><button id="listbtn" style="display: block; width:80px; margin: 0 auto;" type="button" class="btn_list" onclick="goBack()">업체리스트</button></li>
	</ul>	
	<br/><br/>
	
	
	<table border="1" class="user">
		
		<tr>
			<th>사업자 등록번호</th>
			<td>${dDTO.dSaup_no }</td>
		</tr>
		<tr>
			<th>사업체명</th>
			<td>${dDTO.dName}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${dDTO.dPhone }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${dDTO.dAddress }</td>
		</tr>
		<tr>
			<th>별점</th>
			<td>${dDTO.dRating }</td>
		</tr>
		<tr>
			<th>오픈날짜</th>
			<td>${dDTO.dReg_date }</td>
		</tr>
	</table>
	<br/> 

</body>
</html>