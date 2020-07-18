
<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">

   
	<style>ㅋ	
		table{
			width: 1000px;
			margin: auto;
			margin-bottom: 10px;
			border-collapse: collapse;
		    border-top: 3px solid #168;
		}
		table th {
			padding: 10px 5px;
		    color: #168;
		    background: #f0f6f9;
		    text-align: center;
		    border: 1px solid #ddd;
			border-top: 1px solid #868686;
			font-size: 15px;
			letter-spacing: -0.1em;
		}
		table td {
		    padding: 5px;
		    border: 1px solid #ddd;
		    text-align: center;
		}
		#custom{
			display: 'block';
		}
		.left-menu {
			position: fixed;
			top: 50px;
			bottom: 50px;
			left: 0;
			width: 300px;
			background: gray;
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
		  font-weight: bold;
		  margin: 1em auto;
		  padding: 2em 6em;
		  position: relative;
		  text-transform: uppercase;
		}
		
		.del{
			width: 750px;
			display: block;
			
		}
	
		#deleteBtn{
			background: none;
		    border: 3px solid gray;
		    border-radius: 5px;
		    color: gray;
		    display: inline-block;
		    font-weight: bold;
		    margin: 1em auto;
		    padding: 0em 1em;
		    position: relative;
		    right: 0;
		    text-transform: uppercase;
		}
		
		.pageView {
			width: 100%;
			text-align: center;
		}
		
		.button_wrap {
			width: 1000px;
			margin: auto;
			text-align: right;
		}
		
		.center {
			width: 1000px;
			text-align: left;
			margin: auto;
			margin-bottom: 5px;
		}
		
		.searchbox {
			padding: 5px;
			border: 1px solid lightgray;
			border-radius: 5px;
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
		// 회원삭제버튼
		$('#deleteBtn').click(function(){
			$('input:checkbox[name=test]:checked').each(function (){
				alert($(this).val());
					$.ajax({
						type:"POST",
						url:'deleteUser',
						data:'cNo='+$(this).val(),
						success:function(result){
								
						},error:function(){
							return "redirect:adminmanagerPage";
						}
					});
				 
			});
		});

		function deleteCust(form) {
			if (!confirm('회원을 삭제하시겠습니까?')) {
				return;
			} else {
				alert('삭제되었습니다.');			
				form.action='deleteUser';
				form.submit();
			}
		}

		// 체크박스
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

	<!-- Page Wrapper -->
	<div id="wrapper">
	  <!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	  
	    	<!-- Sidebar - Brand -->
	    	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminmanagePage">
	    		<div class="sidebar-brand-icon rotate-n-15">
	        		<i class="fas fa-laugh-wink"></i>
	      		</div>
	      		<div class="sidebar-brand-text mx-3">관리자 페이지</div>
	    	</a>
	    
		    <!-- Divider -->
		    <hr class="sidebar-divider my-0">
		    <!-- Nav Item - Dashboard -->
		    <li class="nav-item">
		    	<a class="nav-link" href="index">
		    		<i class="fas fa-fw fa-tachometer-alt"></i>
		        <span>메인페이지</span>
		     	</a>
		    </li>
	
	    	<!-- Divider -->
	    	<hr class="sidebar-divider my-0">
	 		<li class="nav-item">
	    		<a class="nav-link" href="adminmanagePage">
	        		<span>일반회원관리</span>
	        	</a>
	  		</li>
	    
		    <!-- Heading -->
	    	<hr class="sidebar-divider my-0">
	    	<!-- Nav Item - Pages Collapse Menu -->
	    	<li class="nav-item">
	      		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
	        		<span>기업회원관리</span>
	     		</a>
	      		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	        		<div class="bg-white py-2 collapse-inner rounded">
	          			<h6 class="collapse-header"></h6>
	          			<a class="collapse-item" href="departmentView">업체 정보</a>
	          			<a class="collapse-item" href="deptAccpetPage">업체 승인 대기목록</a>
	        		</div>
	      		</div>
	    	</li>
		</ul> <!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content" style="height: 90%;">
				<!-- Begin Page Content -->
				<div class="container-fluid"  style="height: 100%;">
					<!-- Content Row -->
					<div class="row" style="height: 100%;  width:100%;">
						<div class="col-xl-8" style="flex: 0 0 100%; max-width: 100%; margin-top: 20px;">
							<!-- Area Chart -->
							<div class="card shadow mb-4" style="height: 95%; width:100%;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">회원 리스트</h6>
								</div>
								<div class="card-body"  style="height: 100%;">
									<div class="chart-area"  style="height: 100%;">
										<!-- 내용 부분 -->
										<div id="custom" style="width:1000px; margin: auto;">
											<div class="center">
												<span class="totalCustomer" style= "margin: auto;">전체 회원 수 : ${totalRecord}명</span>
											</div>				
													<div class="searchbox_wrap">
														<input type="text" class="searchbox" name="query" placeholder="이름/아이디" size="15" />
														<input type="submit" class="searchbox" value="검색" />
													</div>
											
											<form id="myForm" method="post">
												<table border="1">
													<thead id="user_info">
														<tr>
															<th><input type="checkbox" id="allCheck"/></th>
															<th>아이디</th>
															<th>이름</th>
															<th>닉네임</th>
															<th>비밀번호</th>
															<th>휴대폰번호</th>
															<th>Email</th>
															<th>등급</th>
															<th>성별</th>
														</tr>
													</thead>	
													<tbody>
														<c:if test="${empty cList}">
															<tr>
																<th colspan="8">회원이 존재하지 않습니다.</th>
															</tr>
														</c:if>
														<c:if test="${not empty cList}">
															<c:forEach var="user" items="${cList }" >
																<tr>
																	<td><input type="checkbox" id="cNo" name="cNo" value="${user.cNo}"/></td>	
																	<td><a href="UpdateUserPage?cNo=${user.cNo }">${user.cId }</a></td>							
																	<td>${user.cName }</td>			
																	<td>${user.cNickname }</td>						
																	<td>${user.cPw }</td>				
																	<td>${fn:substring(user.cPhone, 0, 3)}-${fn:substring(user.cPhone, 3, 7)}-${fn:substring(user.cPhone, 7, 11)}</td>			
																	<td>${user.cEmail }</td>			
																	<td>
																		<c:if test="${user.cGrade ==1 }">브론즈</c:if>			
																		<c:if test="${user.cGrade ==2 }">실버</c:if>			
																		<c:if test="${user.cGrade ==3 }">다이아</c:if>			
																		<c:if test="${user.cGrade ==4 }">vip</c:if>			
																		<c:if test="${user.cGrade ==5 }">관리자</c:if>
																	</td>								
																	<td>${user.cGender == 1 ? '남' : '여'}</td>	
																</tr>
															</c:forEach>
														</c:if>
					
													</tbody>
												</table>
												
												<div class="button_wrap">
														<input type="button" id="deleteBtn" value="회원삭제" onclick="deleteCust(this.form)" />
												</div>
											</form>
											<div class="pageView">
												<!-- 페이지 뷰 -->
												${pageView}
											</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>    
					</div>
				</div>
			</div>
		</div>
	</div>

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

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
	  <i class="fas fa-angle-up"></i>
	</a>

 
 
<!-- Bootstrap core JavaScript-->
<script src="resources/assets/style/admin/jquery/jquery.min.js"></script>
<script src="resources/assets/style/admin/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="resources/assets/style/admin/jquery-easing/jquery.easing.min.js"></script>
<!-- Custom scripts for all pages-->
<script src="resources/assets/style/admin/js/sb-admin-2.min.js"></script>
<!-- Page level plugins -->
<script src="resources/assets/style/admin/chart.js/Chart.min.js"></script>
<!-- Page level custom scripts -->
  
  
<%@ include file="../template/footer.jsp" %>