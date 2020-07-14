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
	#custom{
		display: 'block';
	}
	div{
		margin: auto;
		overflow: auto;
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
    li >button	{ 
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
	#cus_btn{
		float: left;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		margin-right:10px;
	}
	#dept_btn{
		float: left;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		margin-right:10px;
	}
	#Acc_btn{
	
		float: left;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
	}
	#deleteBtn{
		margin:auto;
		border-top-left-radius: 5px; 
		border-bottom-left-radius: 5px;
		border-top-right-radius: 5px; 
		border-bottom-right-radius: 5px;
		border: 1px solid black; 
	    background-color: rgba(0,0,0,0); 
	    color: black; 
	    padding: 5px; 
	    width:100px;
	    height:30px
	}
	.del{
		width: 750px;
		display: block;
		
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
	function fn_cus_list(){
		document.getElementById("custom").style.display='block';
		document.getElementById("del").style.display='block';
		
		document.getElementById("dept").style.display='none';
		
	}
	function fn_dept_list(){
		document.getElementById("dept").style.display='block';
		document.getElementById("custom").style.display='none';
		document.getElementById("del").style.display='none';
		
	}
	
	
</script>

<body>
<ul>
	<li><h2>관리자페이지</h2></li>
	<li><button id="cus_btn" onclick="fn_cus_list()" >회원관리</button></li>
	<li><button id="dept_btn" onclick="fn_dept_list()">업체관리</button></li>
	<li><button id="Acc_btn"onclick="location.href='deptAccpet'">업체 승인 관리</button><li>
</ul>

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
	<br/>
	
	<div id="custom" style="width:760px; height:100px; ">
	<table border="1">
		<thead id="user_info">
			<tr>
				<th><input type="checkbox" id="allCheck"/></th>
				<th>아이디</th>
				<th>no.</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>비밀번호</th>
				<th>휴대폰번호</th>
				<th>Email</th>
				<th>등급</th>
				<th>성별</th>
			</tr>
		</thead>	
			<c:forEach var="user" items="${cList }" >
			<tr>	
				<td><input type="checkbox" id="test" name=test value="${user.cNo }"/></td>
				<td><a href="UpdateUserPage?cNo=${user.cNo }">${user.cId }</a></td>			
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
		<div id="del" class="del">
		
			<button id="deleteBtn">회원삭제</button>
		</div>
<br/>
	
	<div id="dept" style="width:760px; height:800px;" >	
		<table border="1">
			<thead>
				<tr>
					<th>no.</th>
					<th>사업자 등록번호</th>
					<th>사업체명</th>
					<th>전화번호</th>
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
	
	
	
	<!-- 업체 승인 관리 -->
	
	<script type="text/javascript">
	
/* 		function deptAccpet() {
			$.ajax({
				url: 'deptAccept',
				method: 'get',
				dataType: 'text',
				success: function (data) {
					
				}
			});
		} */
	
	</script>
	
	

</body>
</html>