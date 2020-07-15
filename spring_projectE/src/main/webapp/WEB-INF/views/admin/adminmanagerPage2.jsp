<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../template/header.jsp" %>





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
	button, button::after {
	  -webkit-transition: all 0.3s;
		-moz-transition: all 0.3s;
	  -o-transition: all 0.3s;
		transition: all 0.3s;
	}
	
	button {
	  background: none;
	  border: 3px solid #fff;
	  border-radius: 5px;
	  color: #fff;
	  display: block;
	  font-size: 1.6em;
	  font-weight: bold;
	  margin: 1em auto;
	  padding: 2em 6em;
	  position: relative;
	  text-transform: uppercase;
	}
	
	button::before,
	button::after {
	  background: #fff;
	  content: '';
	  position: absolute;
	  z-index: -1;
	}
	
	button:hover {
	  color: #2ecc71;
	}
	
	/* BUTTON 1 */
	.btn-1::after {
	  height: 0;
	  left: 0;
	  top: 0;
	  width: 100%;
	}
	
	.btn-1:hover:after {
	  height: 100%;
	}
	
	/* BUTTON 2 */
	.btn-2::after {
	  height: 100%;
	  left: 0;
	  top: 0;
	  width: 0;
	}
	
	.btn-2:hover:after {
	  width: 100%;
	}
	
	/* BUTTON 3 */
	.btn-3::after {
	  height: 0;
	  left: 50%;
	  top: 50%;
	  width: 0;
	}
	
	.btn-3:hover:after {
	  height: 100%;
	  left: 0;
	  top: 0;
	  width: 100%;
	}
	.del{
		width: 750px;
		display: block;
		
	}
	/* 사이드바 스타일 */
		.sidenav {
			height:100%;
			width: 300px;
			position: fixed;
			z-index:1;
			top: 0;
			left: 0;
			background-color: rgb(0,154,200);
			overflow-x: hidden;
			transition:0.5s ease-in-out;
			padding-top: 60px;
		}
		.sidenav a {
			padding: 8px 8px 8px 32px;
			text-decoration: none;
			font-size: 25px;
			color: #fff;
			display: block;
			transition: 0.2s ease-in-out;
		}
		.sidenav a:hover, .offcanvas a:focus {
			color: #000;
		}
		.closebtn {
			position: absolute;
			top: 0;
			right: 25px;
			font-size: 36px !important;
			margin-left: 50px;
		}
		.openmenu:hover {
			color:rgb(0,154,200);
			transition:0.5s ease-in-out;
		}
		.openmenu {
			font-size: 25px;
			cursor:pointer;
			transition:0.5s ease-in-out;
		}
		.openmenu > i {
			font-size: 30px;
		}
		/* 미디어쿼리 적용 */
		@media screen and (max-height:450px) {
			.sidenav {
				padding-top:15px;
			}
			.sidenav a {
				font-size: 18px;
			}
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
	function openNav() {
		document.getElementById('mysidenav').style.width = '250px';
	}
	function closeNav() {
		document.getElementById('mysidenav').style.width = '0';
	}
	
</script>



<body>
<div id="mysidenav" class="sidenav">
	<a href="#" class="closebtn" onclick='closeNav()'>x</a>
	<a href="#"><button id="cus_btn" class="btn-1" onclick="fn_cus_list()" >회원관리</button></a>
	<a href="#"><button id="dept_btn" class="btn-2" onclick="fn_dept_list()">업체관리</button></a>
	<a href="#"><button id="Acc_btn" class="btn-3" onclick="location.href='deptAccpetPage'">업체 승인 관리</button></a>
</div>
<h2>관리자 페이지</h2>
<span class="openmenu" onclick='openNav()'><i class="fa fa-angle-double-left fa-5" aria-hidden="true"></i> open</span>
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
	
	<div id="custom" style="width:760px; height:100px; margin: auto; overflow: auto; ">
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
		<div id="del" class="del" style="margin: auto;">
		
			<button id="deleteBtn">회원삭제</button>
		</div>
<br/>
	
	<div id="dept" style="width:760px; height:800px; margin: auto; overflow: auto;" >	
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
	

	

</body>
</html>
<%@ include file="../template/footer.jsp" %>