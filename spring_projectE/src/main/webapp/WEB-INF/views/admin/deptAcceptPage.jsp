<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
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

	
		table th {
	      color: #168;
	      background: #f0f6f9;
	      text-align: center;
	    }
	    table tr, .table td {
	      padding: 10px;
	      border: 1px solid #ddd;
	    }
	    table tr:first-child, table td:first-child {
	      border-left: 0;
	    }
	    table tr:last-child, .table td:last-child {
	      border-right: 0;
	    }
		table{
			text-align: center;
			border-collapse: collapse;
			height: 100px;
			width: 750px;
		    border-top: 3px solid #168;

		
		* {
			margin: 0;
		}
		
		table {
			margin: auto;
			margin-top: 50px;
			width: 700px;
			border-collapse: collapse;
		}
		
		th {
			padding: 10px 0;
			border-top: 1px solid #868686;
			border-bottom: 1px solid #E5E5E5;
			background: #F9F9F9;
			font-size: 1.2em;
			letter-spacing: -0.1em;
		}
		
		td {
			text-align: center;
			padding: 5px;
		}
		
		tr:last-of-type {
			border-bottom: 1px solid #868686;
		}
		
		a {
			text-decoration: none;
			color: black;
			font-weight: bold;

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
	</style>

</head>
<body>


	<ul>
	<li><h2>관리자페이지</h2></li>
	<li><button id="listbtn" style="display: block; width:80px; margin: 0 auto;" type="button" class="btn_list" onclick="goBack()">업체리스트</button></li>
	</ul>
	<br/><br/>
	
	<table border="1">

		<tr>
			<th>상호명</th>
			<th>등록일</th>
			<th>승인상태</th>
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