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
	
	$(document).on("click", "#checkAll", function(){
		if( (! $('#checkAll').attr('checked')){
			$('.checkSelect').attr('checked', false);
		} else {
			$('.checkSelect').attr('checked', 'checked');
		});
	});
		
	$(document).on("click", ".checkSelect", function(){
		$("#checkAll").attr('checked', false);
	});
	
	function fn_cus_list(){
		document.getElementById("custom").style.display='block';
		document.getElementById("dept").style.display='none';
		
	}
	function fn_dept_list(){
		document.getElementById("dept").style.display='block';
		document.getElementById("custom").style.display='none';	
	}
	$(function(){
		$('#RowCheck').click(function(){
			alert($('#RowCheck').checked);
			if($(this).checked==false){
				$('#allCheck').checked=false;
			}
		});
		
		$('#searchBtn').click(function(){
			ajax({
				url:'searchQuery',
				data:'query='+$('#query').val(),
				success:function(data){
					$('#user_info').empty();
					$('#user_info').append(data);
				},
				error:function(){
					alert('ajax통신 실패');
				}
			});
		})
		
	});
	
	
	
</script>

<body>
	
	<button id="cus_btn" onclick="fn_cus_list()" style="display: block; width:480px; margin: 0 auto;" ><h3>회원관리</h3></button>
	
	<br/><br/>
	
	
		
	<div id="custom" style="display: block; width:760px; height:100px; margin: 0 auto; overflow:auto; ">
	<table border="1">
		<thead>
			<tr>
				<td><input id="checkAll" name="" type="checkbox" /></td>
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
		</thead id="user_info">	
			<c:forEach var="user" items="${cList }">
			<tr>	
				<td><input name="chk_box" type="checkbox" class="checkSelect"/></td>
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
	
	<button id="dept_btn" onclick="fn_dept_list()" style="display: block; width:480px; margin: 0 auto;" ><h3>업체관리</h3></button>
	<br/><br/>
	
	<div id="dept" style="display: block; width:750px; margin: 0 auto;" >	
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