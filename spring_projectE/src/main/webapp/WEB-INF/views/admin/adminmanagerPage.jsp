<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<style>
	table >thead >tr{
		background-color: Lightgray;
		color: blue;
	}
	table{
		text-align: center;
		border-collapse: collapse;
		height: 100px;
		width: 750px;
	}
	#custom{
		display: 'block';
	}
</style>

<script type="text/javascript">
	$(function (){
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked",false);
			}
		});
	});
	
	
	
</script>

<body>
	
	<button id="cus_btn" onclick="fn_cus_list()" style="display: block; width:480px; margin: 0 auto;" ><h3>회원관리</h3></button>
	
	<br/><br/>
	
	
	
	<script type="text/javascript">
	$('#deleteBtn').click(function(){
		$('input:checkbox[name=test]:checked').each(function (){
			alert($(this).val());
				$.ajax({
					type:"POST",
					url:'deleteUser',
					data:'cNo='+$(this).val(),
					success:function(result){
							
					},error:function(){
						
					}
				});
			 
		});
	});
	</script>
	
	
	<div id="custom" style="display: block; width:760px; height:100px; margin: 0 auto; overflow:auto; ">
	<table border="1">
		<thead id="user_info">
			<tr>
				<th><input type="checkbox" id="allCheck"/>
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
			<c:forEach var="user" items="${cList }" >
			<tr>	
				<td><input type="checkbox" id="test" name=test value="${user.cNo }"/></td>
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
	<button id="deleteBtn" style= "width:100px; height:20px; margin: 0 auto;" >삭제</button>
	<br/><br/>
	
	<button id="dept_btn" onclick="fn_dept_list()" style="display: block; width:480px; margin: 0 auto;" ><h3>업체관리</h3></button>
	<br/><br/>
	
	
	<div id="dept" style="display: block; width:750px; height:800px; margin: 0 auto; overflow:auto" >	
		<table border="1">
			<thead>
				<tr>
					<td>번호</td>
					<td>사업자 등록번호</td>
					<td>사업체명</td>
					<td>전화번호</td>
				</tr>
			</thead>
			<c:forEach var="dept" items="${dList }">
				<tr>		
					<td>${dept.dNo }</td>
					<td><a href="UpdateDepartment?dNo=${dept.dNo }">${dept.dSaup_no }</a></td>
					<td>${dept.dName }</td>
					<td>${dept.dPhone }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	

</body>
</html>