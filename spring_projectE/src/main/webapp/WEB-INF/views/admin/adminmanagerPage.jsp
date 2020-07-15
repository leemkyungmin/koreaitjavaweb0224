<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="../template/header.jsp" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	  <!-- Custom styles for this template-->
	  <link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">

   
  	<style>
	table th {
	  border-collapse:collapse;
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
