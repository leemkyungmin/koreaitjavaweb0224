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
		background-color: Lightgray;
		color: blue;
	}
	table{
		text-align: center;
		border-collapse: collapse;
	}
	#custom{
		display: 'block';
	}
</style>

<script type="text/javascript">
	
	function allChk(obj){
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length -1;
		var check = obj.checked;
		if (check) {
			for (var i=0; i<=rowCnt; i++){
				if(chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}		
		} else {
			for (var i=0; i<=rowCnt;i++){
				if(chkObj[i].type == "checkbox")
					chkObj[i].checked = false;
			}
		}
	}
	
	
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
	
	<br/><br/>
	
	<div id="custom">
	
	<table border="1">
		<thead>
			<tr>
				<td><input id="allCheck" type="checkbox" onclick="allChk(this);"/></td>
				<td>아이디</td>
				<td>번호</td>
				<td>이름</td>
				<td>닉네임</td>
				<td>비밀번호</td>
				<td>휴대폰번호</td>
				<td>이메일</td>
				<td>등급</td>
				<td>성별</td>
			</tr>
		</thead>	
			<c:forEach var="user" items="${cList }">
			<tr>	
				<td><input name="RowCheck" type="checkbox" value="${user.cId }"/></td>
				<td><a href="UpdateUser?cNo=${user.cNo }">${user.cId }</a></td>			
				<td>${user.cNo }</td>				
				<td>${user.cName }</td>			
				<td>${user.cNickname }</td>						
				<td>${user.cPw }</td>				
				<td>${user.cPhone }</td>			
				<td>${user.cEmail }</td>			
				<td>
					<c:if test="${user.cGrade ==1 }">
						브론즈
					</c:if>			
					<c:if test="${user.cGrade ==2 }">
						실버
					</c:if>			
					<c:if test="${user.cGrade ==3 }">
						다이아
					</c:if>			
					<c:if test="${user.cGrade ==4 }">
						vip
					</c:if>			
					<c:if test="${user.cGrade ==5	 }">
						관리자
					</c:if>
				</td>								
				<td>성별${user.cGender }</td>	
			</tr>
			</c:forEach>
	</table>
	</div>
	<br/><br/>
	
	<button id="dept_btn" onclick="fn_dept_list()"><h3>업체관리</h3></button>
	<br/><br/>
	
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