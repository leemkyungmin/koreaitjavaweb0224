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
		
		.back_btn {
			text-align: left;
			margin-bottom: 10px;
			margin-left: 50px;
			position: relative;
   			left: 200px;
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
			width: 50%;
			border-top: 3px solid #168;
			border-bottom: 3px solid #168;
			border-collapse: collapse;
			float: left;
		}
		
		table th {
			width: 20%;
			padding: 5px;
			color: #168;
			background: #f0f6f9;
			text-align: center;
			border: 1px solid #ddd;
			border-top: 1px solid #868686;
			font-size: 15px;
			letter-spacing: -0.1em;
		}
		
		table td {
			width: 80%;
			text-align: left;
			padding: 5px;
			padding-left: 15px;
			border: 1px solid #ddd;
		}
		
		.btn_wrap {
			margin: auto;
			text-align: center;
			clear: left;
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
		
		.map {
			float: left;
			margin-left: 36px;
		}
		
		.image-Content {
			width:100%;
			position: relative;
		    white-space: nowrap;
		    overflow-x: auto;
		    overflow-y: hidden;
		    overflow-scrolling: touch;
		    -webkit-overflow-scrolling: touch;
		}
		
		.image_wrap{
		    margin-top: 20px;
		    margin-bottom: 20px;
			font-size: 0;
	    	line-height: 0;
		}
		
		.column-image {
			display:inline-block;
		}
		
		img{
			display: inline-block;
		    width: 200px;
		    height: 200px;
		    margin-right: 6px;
		    background-size: cover;
		    background-position: 50% 50%;
		    background-repeat: no-repeat;
		    cursor: pointer;
		}
		
		img:nth-of-type(5) {
			margin: 0;
		}
		
		ul, ul li {
	    	list-style: none;
		}
		
		.Restaurant_MenuItem {
		    display: -moz-flex;
		    display: -ms-flexbox;
		    display: flex;
		    display: -webkit-box;
		    display: -webkit-flex;
		    -moz-flex-direction: row;
		    -ms-flex-direction: row;
		    flex-direction: row;
		    -webkit-flex-direction: row;
		    -webkit-box-direction: normal;
		    -webkit-box-orient: horizontal;
		    border-bottom: 1px solid #e9e9e9;
		    margin-bottom: 4px;
		}
		.Restaurant_Menu {
		    flex: 1;
		    display: inline-block;
		    margin-right: 30px;
		    white-space: normal;
		}
		.Restaurant_MenuPrice {
		    margin-left: auto;
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
					<!-- Page Heading -->
					<!-- Content Row -->
					<div class="row" style="height: 100%; width:100%;">
						<div class="col-xl-8" style="flex: 0 0 100%; max-width: 100%; margin-top: 20px;">
							<!-- Area Chart -->
							<div class="card shadow mb-4"  style="height: 95%; width:100%;">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">업체 승인 리스트</h6>
								</div>
								<div class="card-body"  style="height: 100%;">
									<div class="chart-area"  style="height: 100%;">
										<!-- 내용 부분 -->
										<div id="custom" style="width: 66.5%; margin:auto; margin-top: 50px;">
											<div class="wrap">
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
														<tr>
															<th>메뉴 </th>
															<td>
																<c:if test="${not empty menuList }">
											                  		<ul class="Restaurant_MenuList">
											                  		<c:forEach var="menu" items="${menuList }">
											                  			<li class="Restaurant_MenuItem">
												                          	<span class="Restaurant_Menu">${menu.mName }</span>
												                            <span class="Restaurant_MenuPrice">${menu.mPrice }원</span>
											                        	</li>
											                  		</c:forEach>
											                  		</ul>
											                  	</c:if>
															</td>
														</tr>
													</table>
													<div class="map" id="map" style="width:45%;height:270px;"></div>
													<div class="image-Content">
														<div class="image_wrap">
															<c:set var="img" value="${deptDTO.dPhoto }"></c:set>
															<!-- 업체에서 등록한 이미지 가져오기 -->
															<c:forEach var="split" items="${fn:split(img,',')}">
																<div class="column-image">
																	<img alt="${split }" src="${pageContext.request.contextPath }/resources/storage/department_img/${split }">
																</div>
															</c:forEach>
														</div>
													</div>
													<div class="btn_wrap">
														<input class="btn" type="hidden" name="dNo" value="${deptDTO.dNo}" />
														<input class="small_btn" type="button" value="목록" onclick="location.href='deptAccpetPage'"/> 
														<input class="btn" type="button" value="승인" onclick="endorse(this.form)"/> 
														<input class="btn" type="button" value="거절" onclick="reject(this.form)"/> 
													</div>
												</form>
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
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=395b351aabfbda166c782bab5c1101f8&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${deptDTO.dAddress}', function(result, status) {
			
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;"><strong class="rate-point">${deptDTO.dName}</strong></div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
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
