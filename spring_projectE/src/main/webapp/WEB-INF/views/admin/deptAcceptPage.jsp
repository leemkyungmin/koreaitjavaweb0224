<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../template/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
		    clear:both;
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
		}
		
		button	{ 
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
	    
		table{
			margin: auto;
			margin-top: 10px;
		    border-top: 3px solid #168;
			width: 700px;
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
			text-align: center;
			padding: 5px;
			border: 1px solid #ddd;
		}
		
		.tag_a {
			text-decoration: none;
			color: black;
			font-weight: bold;
		}
		
	</style>
	
	<script type="text/javascript">
	
		function goBack() {
			window.history.back();
		}
	
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
					<table border="1">
		<tr>
			<th>사업자번호</th>
			<th>상호명</th>
			<th>전화번호</th>
			<th>업종</th>
			<th>등록일</th>
		</tr>
		<c:if test="${empty deptList}">
			<tr>
				<td colspan="5">승인 대기중인 업체가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty deptList}">
			<c:forEach var="deptDTO" items="${deptList}">
				<tr>
					<td>${deptDTO.dSaup_no}</td>
					<td><a class="tag_a"href="deptAcceptView?dNo=${deptDTO.dNo}">${deptDTO.dName}</a></td>
					<td>${fn:substring(deptDTO.dPhone, 0, 3)}-${fn:substring(deptDTO.dPhone, 3, 7)}-${fn:substring(deptDTO.dPhone, 7, 11)}</td>
					<td>${deptDTO.dType}</td>
					<td>${deptDTO.dReg_date}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
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
