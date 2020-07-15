<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">

		* {
			margin: 0;
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
	    
	    .top_button {
			float: left;
			border-radius: 5px;
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
	    
		table{
			margin: auto;
			margin-top: 10px;
		    border-top: 3px solid #168;
			width: 700px;
			border-collapse: collapse;
		}
		
		table th {
			padding: 10px 0;
			color: #168;
			background: #f0f6f9;
			text-align: center;
			border: 1px solid #ddd;
			border-top: 1px solid #868686;
			font-size: 1.2em;
			letter-spacing: -0.1em;
	    }
		
		table td {
			text-align: center;
			padding: 5px;
			border: 1px solid #ddd;
		}
		
		a {
			text-decoration: none;
			color: black;
			font-weight: bold;
		}
		
	</style>
	
	<script type="text/javascript">
	
		function goBack() {
			window.history.back();
		}
	
	</script>

</head>
<body>

	<ul>
		<li><h2>관리자페이지</h2></li>
		<li><button class="top_button" onclick="fn_cus_list()" >회원관리</button></li>
		<li><button class="top_button" onclick="fn_dept_list()">업체관리</button></li>
		<li><button class="top_button" onclick="location.href='deptAccpetPage'">업체 승인 관리</button><li>
	</ul>
	<br/><br/>
	
	<table border="1">
		<tr>
			<th>사업자번호</th>
			<th>상호명</th>
			<th>전화번호</th>
			<th>업종</th>
			<th>등록일</th>
		</tr>
		<c:if test="${empty deptList}">
			<tr>
				<td colspan="5">승인 대기중인 업체가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty deptList}">
			<c:forEach var="deptDTO" items="${deptList}">
				<tr>
					<td>${deptDTO.dSaup_no}</td>
					<td><a href="deptAcceptView?dNo=${deptDTO.dNo}">${deptDTO.dName}</a></td>
					<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
					<td>${deptDTO.dType}</td>
					<td>${deptDTO.dReg_date}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>