<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		</tr>
		<c:if test="${empty deptList}">
			<tr>
				<td colspan="3">승인 대기중인 업체가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty deptList}">
			<c:forEach var="deptDTO" items="${deptList}">
				<tr>
					<td>${deptDTO.dName}</td>
					<td>${deptDTO.dReg_date}</td>
					<td>승인대기</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

</body>
</html>