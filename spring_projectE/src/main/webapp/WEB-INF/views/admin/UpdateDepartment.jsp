<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../template/header.jsp" %>
	  
<link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">

  	<script type="text/javascript">
		function goBack() {
			window.history.back();
		}
	</script>
	
	<style type="text/css">
		table {
			width: 750px;
			margin: auto;
			border: 1px solid;
			border-collapse: collapse;	
		    border-top: 1px solid #ccc;
		    border-left: 3px solid #369;
		}
		th {
		    width: 147px;
		    padding: 10px;
		    font-weight: bold;
		    text-align: left;
		    color: #153d73;
		    border: 1px solid #ccc;
			background: #efefef;
			font-size: 130%;
		}
		td {
		    width: 349px;
		    padding: 10px;
		    border: 1px solid #ccc;
		    font-size: 120%;
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
		    height:78px;
		}
		
	</style>

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
		</ul>	<!-- End of Sidebar -->
	
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content" style="height: 90%;">
				<!-- Begin Page Content -->
				<div class="container-fluid"  style="height: 100%;">
					<!-- Content Row -->
					<div class="row" style="height: 100%;  width:100%;">
						<div class="col-xl-8"  style="flex: 0 0 100%; max-width: 100%; margin-top: 20px;">
							<!-- Area Chart -->
							<div class="card shadow mb-4"  style="height: 90%; width:100%;">
								<div class="card-header py-3">
								  <h6 class="m-0 font-weight-bold text-primary">업체상세정보</h6>
								</div>
								<div class="card-body"  style="height: 100%;">
									<div class="chart-area"  style="height: 100%;">
										<!-- 내용 부분 -->
										<div id="custom" style="width:100%;">
											<table border="1" class="user">
												<tr>
													<th>사업자 등록번호</th>
													<td>${dDTO.dSaup_no }</td>
												</tr>
												<tr>
													<th>사업체명</th>
													<td>${dDTO.dName}</td>
												</tr>
												<tr>
													<th>전화번호</th>
													<td>${dDTO.dPhone }</td>
												</tr>
												<tr>
													<th>주소</th>
													<td>${dDTO.dAddress }</td>
												</tr>
												<tr>
													<th>별점</th>
													<td>${dDTO.dRating }</td>
												</tr>
												<tr>
													<th>오픈날짜</th>
													<td>${dDTO.dReg_date }</td>
												</tr>
											</table>
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
