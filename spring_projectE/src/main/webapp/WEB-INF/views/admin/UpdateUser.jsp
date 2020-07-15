<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../template/header.jsp" %>

	<%@ include file="../template/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	  
	  <link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">

  	<script type="text/javascript">

	function goBack() {
		window.history.back();
	}
	
</script>
<style type="text/css">
	table {
		border: 1px solid;
		border-collapse: collapse;	
	}
	tr, td {
		border: 1px solid;
	}
	table {
		margin: 0 auto;
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
	li>button	{ 
	    border: 1px solid skyblue; 
	    background-color: rgba(0,0,0,0); 
	    color: skyblue; 
	    padding: 5px; 
	    width:80px;
	    height:78px
	}
	li>button:hover{ 
		color:white; 
		background-color: skyblue; 
	}
	table.user {
    border-collapse: collapse;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
 	 margin : 20px 10px;
	}
	table.user th {
	    width: 147px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #153d73;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
		background: #efefef;
	}
	table.user td {
	    width: 349px;
	    padding: 10px;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	button {
		width:100px;
	    background-color: #f8585b;
	    border: none;
	    padding: 15px 0;
	    color:#fff;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
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
                  		<div class="form-wrap">
	                    	<form class="UpdateUser" action="UpdateUser">
								<table class="user">
									
									<tr>
										<th>이름</th>
										<td>${cDTO.cName }</td>
									</tr>
									<tr>
										<th>성별</th>
										<td>${cDTO.cGender}</td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td>${cDTO.cNickname }</td>
									</tr>
									<tr>
										<th>아이디</th>
										<td>${cDTO.cId }</td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td>${cDTO.cPw }"</td>
									</tr>
									<tr>
										<th>휴대폰번호</th>
										<td>${cDTO.cPhone }</td>
									</tr>
									<tr>
										<th>이메일</th>
										<td>${cDTO.cEmail }</td>
									</tr>
									<tr>
										<th>등급</th>
										<td><input type="text" name="cGrade"  value="${cDTO.cGrade }"/></td>
									</tr>
									<tr>
										<th>가입날짜</th>
										<td>${cDTO.cRegdate }</td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<input type="hidden" value="${cDTO.cNo }" name=cNo>
											<button type="submit" id="btnUpdate" >수정</button>
										</td> 
									</tr>
								</table>
							</form>
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
