<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../template/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">


	<style>
		table{
			width: 950px;
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
		td:nth-of-type(1) { width: 5%;}
		td:nth-of-type(2) { width: 15%;}
		td:nth-of-type(3) { width: 45%;}
		td:nth-of-type(4) { width: 20%;}
		td:nth-of-type(5) { width: 15%;}
		
		#custom{
			display: 'block';
		}
				
		.del{
			width: 750px;
			display: block;
			
		}
		
		.pageView {
			width: 100%;
			text-align: center;
		}
		.totalDept {
			display: inline-block;
			vertical-align: bottom;
			height: 5px;
			line-height: 90%;
		}
		.center {
			width: 950px;
			height: 40px;
			text-align: left;
			margin: auto;
		}
		
		.searchbox_wrap {
			float: right;
		}
		
		.searchbox {
			padding: 5px;
			border: 1px solid lightgray;
			border-radius: 5px;
		}
		
	</style>
	<c:if test="${sessionScope.cGrede !=5 }">
		<script>
			location.href="index";
		</script>
	</c:if>
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
				<div class="container-fluid"  style="height: 10%;">
					<!-- Content Row -->
					<div class="row" style="height: 100%; width:100%;">
						<div class="col-xl-8" style="flex: 0 0 100%; max-width: 100%; margin-top: 20px;">
							<!-- Area Chart -->
							<div class="card shadow mb-4"  style="height: 95%; width:100%;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">업체 정보 관리</h6>
								</div>
								<div class="card-body"  style="height: 100%;">
									<div class="chart-area"  style="height: 100%;">
										<!-- 내용 부분 -->
										<div id="custom" style="width:100%; margin: auto;">
											<form action="searchQueryDeptInfo">
												<div class="center">
													<span class="totalDept">전체 업체 수 : ${totalRecord}</span>
													<div class="searchbox_wrap">
														<input type="text" class="searchbox" name="query" placeholder="업체명/사업자번호" size="15" />
														<input type="submit" class="searchbox" value="검색" />
													</div>
												</div>
											</form>
											<div id="dept" style="width:950px; margin: auto;" >	
												<table border="1">
													<thead>
														<tr>
															<th>no.</th>
															<th>사업자 등록번호</th>
															<th>사업체명</th>
															<th>전화번호</th>
															<th>승인상태</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${empty dList}">
															<tr>
																<th colspan="5">업체가 존재하지 않습니다.</th>
															</tr>
														</c:if>
														<c:if test="${not empty dList}">
															<c:forEach var="dept" items="${dList}">
																<tr>		
																	<td>${dept.dNo }</td>
																	<td><a href="UpdateDepartment?dNo=${dept.dNo }">${dept.dSaup_no }</a></td>
																	<td>${dept.dName }</td>
																	<td>${fn:substring(dept.dPhone, 0, 3)}-${fn:substring(dept.dPhone, 3, 7)}-${fn:substring(dept.dPhone, 7, 11)}</td>
																	<td>${dept.dAccpet==1 ? '승인완료' : '승인대기'}</td>
																</tr>
															</c:forEach>
														</c:if>
													</tbody>
												</table>
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
