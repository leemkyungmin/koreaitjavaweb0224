<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../template/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	  <!-- Custom styles for this template-->
	  <link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">

  <style type="text/css">
	
		* {
			margin: 0;
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
		    clear: both;
		}
		
		h2	{
	    	color: white;
	    	float: left;
	    	margin-left:100px;
	    	margin-right:100px;
	    	height:78px;
	    	line-height: 78px;
	    }
	    
	    .top_button {
			float: left;
			border-radius: 5px;
			margin-right:10px;
		    border: 1px solid skyblue; 
		    background-color: rgba(0,0,0,0); 
		    color: skyblue; 
		    padding: 5px; 
		    width:80px;
		    height:78px;
		}
		
		.top_button:hover{ 
			color:white; 
			background-color: skyblue; 
		}
		
		.wrap {
			width: 600px;
			margin: auto;
			margin-top: 10px;
		}
		
		.back_btn {
			text-align: left;
			margin-bottom: 10px;
			margin-left: 50px;
		}
		
		.small_btn {
			padding: 5px;
			display: inline-block;
			width: 50px;
			color: white;
			background: #168;
			border-radius: 5px;
			border: 0;
		}
		
		table {
			width: 500px;
			margin: auto;
			margin-bottom: 10px;
			border-top: 3px solid #168;
			border-bottom: 3px solid #168;
			border-collapse: collapse;
		}
		
		table th {
			padding: 10px 0;
			color: #168;
			background: #f0f6f9;
			text-align: center;
			border: 1px solid #ddd;
			border-top: 1px solid #868686;
			font-size: 1.2em;
			letter-spacing: -0.1em;
		}
		
		table td {
			text-align: left;
			padding: 5px;
			padding-left: 15px;
			border: 1px solid #ddd;
		}
		
		.btn_wrap {
			margin: auto;
			text-align: center;
		}
		
		.btn {
			padding: 5px;
			display: inline-block;
			width: 100px;
			color: white;
			background: #168;
			border-radius: 5px;
			border: 0;
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
          <span>메인페이지</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">
	   <li class="nav-item">
        <a class="nav-link" href="adminmanagePage">
          <span>일반회원관리</span></a>
      </li>
       <hr class="sidebar-divider my-0">
      <!-- Heading -->
      

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

      
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content" style="height: 100%;">

        <!-- Topbar -->
        
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid"  style="height: 100%;">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
         
          <!-- Content Row -->
          <div class="row" style="height: 100%;">

            <div class="col-xl-8 col-lg-7"  style="height: 100%;"	>

              <!-- Area Chart -->
              <div class="card shadow mb-4"  style="height: 100%;">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">111</h6>
                </div>
                <div class="card-body"  style="height: 100%;">
                  <div class="chart-area"  style="height: 100%;">
                  	<!-- 내용 부분 -->
                    <div id="custom" style="width:760px; margin: auto;">
			<div class="wrap">
		<div class="back_btn">
			<input class="small_btn" type="button" value="목록" onclick="location.href='deptAccpetPage'"/> 
		</div>
		<form method="post">
			<table>
				<tr>
					<th>상호명</th>
					<td>${deptDTO.dName} (${deptDTO.dSaup_no})</td>
				</tr>
				<tr>
					<th>업종</th>
					<td>${deptDTO.dType}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${deptDTO.dAddress}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>${fn:substring(deptDTO.dStart, 0, 2)}:${fn:substring(deptDTO.dStart, 2, 4)} ~ ${fn:substring(deptDTO.dEnd,0,2)}:${fn:substring(deptDTO.dEnd,2,4)} (${deptDTO.dSeat}석)</td>
				</tr>
				<tr>
					<th>주차</th>
					<td>${deptDTO.dParking ==1 ? '주차 가능' : '주차 불가' }</td>
				</tr>
			</table>
			<div class="btn_wrap">
				<input class="btn" type="hidden" name="dNo" value="${deptDTO.dNo}" />
				<input class="btn" type="button" value="승인" onclick="endorse(this.form)"/> 
				<input class="btn" type="button" value="거절" onclick="reject(this.form)"/> 
			</div>
		</form>
	</div>
		
		<script type="text/javascript">
		
			function endorse(form) {
				if (!confirm('승인하시겠습니까?')) {
					return;
				}
				form.action='deptAccept';
				form.submit();
			}
		
			function reject(form) {
				if (!confirm('거절하시겠습니까?')) {
					return;
				}
				form.action='deptReject';
				form.submit();
			}
		
		</script>
    </div>
     
    </div>
                 
                </div>
              </div>

              <!-- Bar Chart -->
              
              

            </div>

            <!-- Donut Chart -->
            
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

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
