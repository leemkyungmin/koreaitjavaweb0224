<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
	table >thead >tr{
		background-color: skyblue;
	}
	table{
		text-align: center;
	}
	#custom{
		display: 'block';
	}
</style>

<script type="text/javascript">

	function fn_cus_list(){
		document.getElementById("custom").style.display='block';
		document.getElementById("dept").style.display='none';
		
	}
	function fn_dept_list(){
		document.getElementById("dept").style.display='block';
		document.getElementById("custom").style.display='none';
		
	}
</script>

<body>
	
	<button id="cus_btn" onclick="fn_cus_list()"><h3>회원관리</h3></button>
	<button id="dept_btn" onclick="fn_dept_list()"><h3>업체관리</h3></button>
	
	<div id="custom">
	
	<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>휴대폰번호</td>
				<td>이메일</td>
				<td>등급</td>
				<td>업체</td>
				<td>성별</td>
				<td>회원정보</td>
			</tr>
		</thead>	
			<c:forEach var="user" items="${cList }">
			<tr>				
				<td>${user.cNo }</td>				
				<td>${user.cName }</td>			
				<td>${user.cNickname }</td>				
				<td>${user.cId }</td>			
				<td>${user.cPw }</td>				
				<td>${user.cPhone }</td>			
				<td>${user.cEmail }</td>			
				<td>${user.cGrade }</td>			
				<td>${user.cDept }</td>	
				<td>성별${user.cGender }</td>
			    <td>
					<input type="button" value="삭제" onclick="fn_delete(this.form)"/>
					<input type="button" value="수정" onclick="location.href='UpdatePage'"/>
				</td>	
			</tr>
			</c:forEach>
	</table>
	</div>
	<div id="dept">	
		<table border="1">
			<thead>
				<tr>
					<td>번호</td>
					<td>사업자 등록번호</td>
					<td>사업체명</td>
					<td>전화번호</td>
					<td>주소</td>
					<td>사업체 등급</td>
				</tr>
			</thead>
			<c:forEach var="dept" items="${dList }">
				<tr>
					<td>${dept.dNo }</td>
					<td>${dept.dSaup_no}</td>
					<td>${dept.dName }</td>
					<td>${dept.dPhone }</td>
					<td>${dept.dAddress }</td>
					<td>${dept.dRating }</td>
					
				</tr>
			</c:forEach>
		</table>
	</div>
	

</body>
</html>