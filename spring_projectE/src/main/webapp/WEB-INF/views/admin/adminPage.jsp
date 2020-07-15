<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../template/header.jsp" %>
	  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	  <!-- Custom styles for this template-->
	  <link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">



  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminPage">
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
        <a class="nav-link" href="CustomerList">
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
            <a class="collapse-item" href="buttons.html">업체 정보</a>
            <a class="collapse-item" href="cards.html">업체 승인 대기목록</a>
          </div>
        </div>
      </li>

      
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
         
          <!-- Content Row -->
          <div class="row">

            <div class="col-xl-8 col-lg-7">

              <!-- Area Chart -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">111</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                  	<!-- 내용 부분 -->
                    <table>
                    	<tr>
                    		<td>11111</td>
                    		<td>11111</td>
                    	</tr>
                    	<tr>
                    		<td>11111</td>
                    		<td>11111</td>
                    	</tr>
                    	<tr>
                    		<td>11111</td>
                    		<td>11111</td>
                    	</tr>
                    </table>
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
  
</body>

</html>
