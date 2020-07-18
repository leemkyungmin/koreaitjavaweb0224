<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../template/header.jsp" %>

<link href="resources/assets/style/admin/sb-admin-2.min.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<script type="text/javascript">

	function goBack() {
		window.history.back();
	}
	
	</script>

	<style type="text/css">
		form-wrap table {
			width: 500px;
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
		    border: 1px solid black;
			background: #efefef;
			font-size: 120%;
		}
		td {
		    width: 349px;
		    padding: 10px;
		    border: 1px solid black;
		    font-size: 100%;
		}
		#btnUpdate {
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
		.bordered,.form-wrap{
			display:inline-block; 
		}
		.bordered {
			height: 500px;
			position: absolute;
			top: 70px
		}
		.bordered table {
			display: inline-block;
		    width: 1000px;
		    margin-left: 20px;
		    text-align: center;
		    border-collapse: collapse;
		    border: 1px solid black;
		}
		.boarded tr,.boarded td{
		 	border: 1px solid black;
		}
		.pageView{
			display:inline-block;
			width:100%;
			text-align: center;
			
		}
		 #Modal,#myModal {
          display: none;
          position:relative;
          margin:auto;
          width:1000px;
          height:800px;
          z-index:1;
        }
        
        #Modal h2{
          margin:0;
        }
       
        
        #Modal .modal-content,#myModal .modal-body {
          width:100%;
          height:100%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          
        }
        
         #Modal .modal_layer ,#myModal .modal_layer{
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }
        #myModal .modal-header{
        	position: relative;
        	width: 1040px;
        }
        #reviewTable tbody >tr:hover{
        	background-color: lightpink; 
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
		</ul> <!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content" style="height: 90%;">
				<!-- Begin Page Content -->
				<div class="container-fluid"  style="height: 100%;">
					<!-- Content Row -->
					<div class="row" style="height: 100%; width:100%;">
						<div class="col-xl-8"  style="flex: 0 0 100%; max-width: 100%; margin-top: 20px;">
							<!-- Area Chart -->
							<div class="card shadow mb-4"  style="height: 90%; width:100%;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">회원 상세정보</h6>
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
														<td>${cDTO.cGender == 1 ? '남' : '여'}</td>
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
														<td>${cDTO.cPw }</td>
													</tr>
													<tr>
														<th>휴대폰번호</th>
														<td>${fn:substring(cDTO.cPhone, 0, 3)}-${fn:substring(cDTO.cPhone, 3, 7)}-${fn:substring(cDTO.cPhone, 7, 11)}</td>
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
										<div class="bordered">
										     <table border="1" id="reviewTable"  >
												<thead style="background-color: #ccc;">
													<tr>
														<td>업체</td>
														<td>제목</td>
														<td>내용</td>
														<td>별점</td>
													<tr>	
												</thead>		 
												<tbody>
													<c:if test="${empty list }">
														<tr>
															<td colspan="5">
																없음
															</td>
														</tr>
													</c:if>
													<c:if test="${not empty list }">
														<c:forEach var="rDTO" items="${list }" varStatus="name">
															<tr id="review" data-remote="reviewDetail?rNo=${rDTO.rNo}"data-toggle="modal" data-target="#Modal">
																<td>${dList.get(name.count-1)}</td>
																<td>${rDTO.rTitle }</td>
																<td>${rDTO.rContent }</td>
																<td>${rDTO.rPoint }<input type="hidden" value="${rDTO.rNo }" name="rNo" id="rNo"/></td>
																
															</tr>
														</c:forEach>
													</c:if>
													
												</tbody>
											</table>
											<div class="pageView">
												${pageView }
											</div>		
					                	</div>
					                	<div class="modal fade" id="Modal" data-backdrop="static">
							                <div class="modal-dialog" data-backdrop="static">
							                    <div class="modal-content" data-backdrop="static">
							                        <div class="modal-header" data-backdrop="static">
							                            <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
															<i class="fas fa-times fa-3x"></i>
														</button>
							                        </div>
							                        <div class="modal-body">
							                        </div>
							                        <div class="modal_layer" data-backdrop="static"></div>
							                    </div><!-- /.modal-content -->
							                </div><!-- /.modal-dialog -->
							            </div><!-- /.modal -->
									
										<script type="text/javascript">
											$(function(){
								            	$('#reviewTable tr').click(function(e){
								            		$('.modal-body').empty();
								            		$('#Modal .modal-body').load($(this).data('remote'));
								            		var offset = $(".pageView" ).offset();
											        var top =offset.top+100; 
											      
											        $('html,body ').animate({scrollTop :top});
								            	});
								            });
											
										</script>
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
