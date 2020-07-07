<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<title>${deptDTO.dName }&nbsp;${deptDTO.dType }</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link href="resources/assets/style/ViewPage.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">

	function fn_review(){
	   
	   $('#Modal .modal-content').load("reviewWritePage?&dSaup_no="+${deptDTO.dSaup_no}+"&cNo="+1);
	   $('#Modal').modal();
	  
	}

</script>
<style>
        #Modal {
          display: none;
          position:relative;
          margin:auto;
          width:1000px;
          height:800px;
          z-index:1;
        }
        
        #Modal h2 {
          margin:0;
        }
       
        
        #Modal .modal-content {
          width:100%;
          height:100%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          
        }
        
        #Modal .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
</style> 

</head>

<body>

	<c:set var="img" value="${deptDTO.dPhoto }"></c:set>
	
	<div class="top-image">
	
	<c:forEach var="split" items="${fn:split(img,',')}">
		<div class="column-image">
		<img alt="${split }" src="${pageContext.request.contextPath }/resources/storage/department_img/${split }">
		</div>
	</c:forEach>
	</div>
	
	<div class="column-wrapper">
		<div class="column-contents">
	        <div class="inner">
	
	          <!-- 레스토랑 상세 -->
	          <section class="restaurant-detail">
	            <header>
	              <div class="restaurant_title_wrap">
	                <span class="title">
	                   <h1 class="restaurant_name">${deptDTO.dName }</h1>
	                    <strong class="rate-point ">
	                      <span>${deptDTO.dRating }</span>
	                    </strong>
	
	                  <p class="branch"></p>
	                </span>
	
	                <div class="restaurant_action_button_wrap">
	
	                  <button class="review_writing_button" onclick="fn_review()">
	                    <i class="fas fa-pen fa-3x"></i>
	                    <p class="review_writing_button_text">리뷰쓰기</p>
	                  </button>
	
	                 
	                    <button class="btn-type-icon favorite wannago_btn " onclick="">
		                    <i class="far fa-calendar-check fa-3x"></i>
		                    <p class="wannago_txt">예약하기</p>
	                  	</button>
	                </div>
	                 
				  </div>
	
	              <div class="status
	                branch_none
	                ">
	                <span class="cnt hit">
	                	<i class="fas fa-eye"></i>
	                 	${deptDTO.dHit }	
	                 </span>
	                <span class="cnt review">
	                	<i class="fas fa-pen"></i>
	               		${reviewCount }
	                </span>
	                <span class="cnt favorite">
	                	<i class="far fa-calendar-check"></i>
	                	${appointmentCount}
	                </span>
	              </div>
	            </header>
	
	
	            <section class="restaurant_introduce_section_mobile only-mobile">
	              <div class="RestaurantIntroduceSection">
	  
	
	    
	
	    
			</div>
	
	            <div class="mainView_info">
	            
	
	            <!-- 상세 정보 -->
	            <table class="info">
	              <caption>레스토랑 상세 정보</caption>
	
	              <tbody>
	                <tr class="only-desktop">
	           
	                  <th>주소</th>
	                  <td>${deptDTO.dAddress}</td>
	                </tr>
	
	                <tr class="only-desktop">
	                  <th>전화번호</th>
	                  <td>${deptDTO.dPhone}</td>
	                </tr>
	
	                <tr>
	                  <th>음식 종류</th>
	                  <td>
	                    <span>${deptDTO.dType }</span>
	                  </td>
	                </tr> 
	
	                <tr>
	                  <th>주차</th>
	                  <td>${dept.dParking ==1 ? '파킹가능' : '파킹 불가' }</td>
	                </tr>
	
	                <tr>
	                  <th style="vertical-align:top;">영업시간</th>
	                  <td>
					  	${fn:substring(deptDTO.dStart,0,2) }:${fn:substring(deptDTO.dStart,2,4) }&nbsp;~&nbsp;
					  	${fn:substring(deptDTO.dEnd,0,2) }:${fn:substring(deptDTO.dEnd,2,4) }
					  </td>
	                </tr>
					
	               
	
	                <tr>
	                  <th>메뉴</th>
	                  <td class="menu_td">
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
	
	                <tr>
	                  <th>
	                  </th>
	
	                  <td>
	                    <div class="list-thumb-photos size-small">
	                        <button class="btn-thumb" onclick="trackEvent('CLICK_MENU', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;})" ng-click="open_menu_picture(0)">
	                           <img class="center-croping lazy" alt="마루심 메뉴 사진 - 서울시 서초구 반포동 54-10" data-original="https://mp-seoul-image-production-s3.mangoplate.com/1402/804795_1553502245961_8594?fit=around|63:63&amp;crop=63:63;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/1402/804795_1553502245961_8594?fit=around|63:63&amp;crop=63:63;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	
	                         </button>
	                        <button class="btn-thumb" onclick="trackEvent('CLICK_MENU', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;})" ng-click="open_menu_picture(1)">
	                          <img class="center-croping lazy" alt="마루심 메뉴 사진 - 서울시 서초구 반포동 54-10" data-original="https://mp-seoul-image-production-s3.mangoplate.com/411704_1553083695056017.jpg?fit=around|63:63&amp;crop=63:63;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/411704_1553083695056017.jpg?fit=around|63:63&amp;crop=63:63;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	
	                        </button>
	                        <button class="btn-thumb" onclick="trackEvent('CLICK_MENU', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;})" ng-click="open_menu_picture(2)">
	                          <img class="center-croping lazy" alt="마루심 메뉴 사진 - 서울시 서초구 반포동 54-10" data-original="https://mp-seoul-image-production-s3.mangoplate.com/9388_1549362579391934.jpg?fit=around|63:63&amp;crop=63:63;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/9388_1549362579391934.jpg?fit=around|63:63&amp;crop=63:63;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	
	                        </button>
	                    </div>
	                  </td>
	                </tr>
	              </tbody>
	            </table>
	            
	          
	            <div class="map" id="map" style="width:400px;height:350px;"></div>
	            
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
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${deptDTO.dName}</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				</script>
	            </div>
				
				<div class="modal fade" id='Modal' tabindex="-1" role="dialog" aria-labelledby="historyModalLabel" aria-hidden="true" data-backdrop="static">
					<div class="modal-dialog modal-xl" role="document" data-backdrop="static">
			    		<div class="modal-content" data-backdrop="static">
			    		</div>
			  		</div>
			  		<div class="modal_layer" data-backdrop="static"></div>
				</div>
				  
				
				
	              <p class="update_date">
	                 	업데이트  : ${deptDTO.dReg_date }
	              </p>
	
	            <div id="reviewListFocusId"></div>
	          </section>
			  <section class="RestaurantReviewList">
	            <header class="RestaurantReviewList__Header">
	              <h2 class="RestaurantReviewList__Title">
	                <span class="RestaurantReviewList__RestaurantNameSuffixDesktop">리뷰</span>
	              	<span class="RestaurantReviewList__AllCount">(${reviewCount })</span>
	              </h2>
				<!--
	              <ul class="RestaurantReviewList__FilterList">
	                <li class="RestaurantReviewList__FilterItem">
	                  <button class="RestaurantReviewList__FilterButton RestaurantReviewList__AllFilterButton RestaurantReviewList__FilterButton--Selected">
	                    전체
	                  <span class="RestaurantReviewList__ReviewCount">20</span></button>
	                </li>
	
	                <li class="RestaurantReviewList__FilterItem">
	                  <button class="RestaurantReviewList__FilterButton RestaurantReviewList__RecommendFilterButton">
	                    맛있다
	                  <span class="RestaurantReviewList__ReviewCount">18</span></button>
	                </li>
	
	                <li class="RestaurantReviewList__FilterItem">
	                  <button class="RestaurantReviewList__FilterButton RestaurantReviewList__OkFilterButton">
	                    괜찮다
	                  <span class="RestaurantReviewList__ReviewCount">1</span></button>
	                </li>
	
	                <li class="RestaurantReviewList__FilterItem">
	                  <button class="RestaurantReviewList__FilterButton RestaurantReviewList__NotRecommendButton">
	                    별로
	                  <span class="RestaurantReviewList__ReviewCount">1</span></button>
	                </li>
	              </ul>
	             -->
	            </header>
	 			
	            <ul class="RestaurantReviewList__ReviewList">
				<c:forEach var ="review" items="${reviewList }">
					<li class="RestaurantReviewItem RestaurantReviewList__ReviewItem">
	  				<a class="RestaurantReviewItem__Link" href="/reviews/NzE4Mjcw" target="_blank">
	    			<div class="RestaurantReviewItem__User">
	       
		      	<div class="RestaurantReviewItem__UserPictureWrap">
		       		 <img class="RestaurantReviewItem__UserPicture loaded" data-src="https://mp-seoul-image-production-s3.mangoplate.com/1407183_1563215702669?fit=around|56:56&amp;crop=56:56;*,*&amp;output-format=jpg&amp;output-quality=80" alt="user profile picture" src="https://mp-seoul-image-production-s3.mangoplate.com/1407183_1563215702669?fit=around|56:56&amp;crop=56:56;*,*&amp;output-format=jpg&amp;output-quality=80" data-was-processed="true">
		     	 </div>
		      
		     	<!--  
		    	 <span class="RestaurantReviewItem__UserNickName"></span>
			   	-->
			  <!--  유저 글 갯수 
		     	 <ul class="RestaurantReviewItem__UserStat">
		       		 <li class="RestaurantReviewItem__UserStatItem RestaurantReviewItem__UserStatItem--Review">1</li>
		       		 <li class="RestaurantReviewItem__UserStatItem RestaurantReviewItem__UserStatItem--Follower">0</li>
		     	 </ul>
	      	 -->
	      
	    		</div>
			    <div class="RestaurantReviewItem__ReviewContent">
			    	
			      <div class="RestaurantReviewItem__ReviewTextWrap">
					
			        <p class="RestaurantReviewItem__ReviewText">
			        	${review.rTitle }<br/>
			         	 ${review.rContent }
			        </p>
					
		       		 <span class="RestaurantReviewItem__ReviewDate">2020-02-22</span>
				      </div>
				      
			      
			    </div>
			
			    <div class="RestaurantReviewItem__Rating RestaurantReviewItem__Rating--Ok">
			      <span class="RestaurantReviewItem__RatingText">괜찮다</span>
			    </div>
			    
			    
			  	</a>
				</li>
				</c:forEach>
	            
				</ul>
				<c:if test="${empty reviewList }">
		            <div class="RestaurantReviewList__Empty">
		              <span class="RestaurantReviewList__EmptyTitle">아직 작성된 리뷰가 없네요.</span>
		              <span class="RestaurantReviewList__EmptyDescription">앱에서 해당 식당의 첫 리뷰를 작성해주시겠어요?</span>
		            </div>
				</c:if>
	            <div class="RestaurantReviewList__MoreReviewButton" role="button">
	              더보기
	            </div>
	          </section>
	      </div>
	   </div>
   
   <div class="side-wrap">
        <div class="column-side">
          <!-- 지도 -->
          <div class="map-container" style="position: relative; overflow: hidden; background: url(&quot;https://ssl.pstatic.net/static/maps/mantle/1x/pattern_1.png&quot;) 0px 0px repeat transparent;">
          <div class="map_layer"></div><div style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0; cursor: url(&quot;https://ssl.pstatic.net/static/maps/mantle/1x/openhand.cur&quot;), default;"><div style="position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); z-index: 0;"><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1;"><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 0; user-select: none;"></div><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 1; user-select: none;"><div style="position: absolute; top: 0px; left: 0px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; display: block; width: 0px; height: 0px; overflow: visible; box-sizing: content-box !important;"><div draggable="false" unselectable="on" style="position: absolute; top: 196px; left: 108px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55872/25370.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: -60px; left: 108px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55872/25369.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: 452px; left: 108px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55872/25371.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: -316px; left: 108px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55872/25368.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: -316px; left: 364px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55873/25368.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: 452px; left: -148px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55871/25371.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: -60px; left: 364px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55873/25369.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: 196px; left: -148px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55871/25370.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: 196px; left: 364px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55873/25370.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: -60px; left: -148px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55871/25369.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: 452px; left: 364px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55873/25371.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div><div draggable="false" unselectable="on" style="position: absolute; top: -316px; left: -148px; z-index: 0; margin: 0px; padding: 0px; border: 0px solid transparent; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; opacity: 1; width: 256px; height: 256px;"><img draggable="false" unselectable="on" alt="" width="256" height="256" src="https://nrbe.pstatic.net/styles/basic/1592456906/16/55871/25368.png?mt=bg.ol.sw.ar.lko" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; user-select: none; -webkit-user-drag: none; box-sizing: content-box !important; max-width: none !important; max-height: none !important; min-width: 0px !important; min-height: 0px !important; opacity: 1; position: absolute; left: 0px; top: 0px; z-index: 0; width: 256px; height: 256px;"></div></div></div><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 100;"><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 101;"></div><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 103;"></div><div style="overflow: visible; width: 100%; height: 0px; position: absolute; display: block; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; z-index: 106;"></div></div></div><div style="position: absolute; display: none; margin: 0px; padding: 0px; border: 0px none; top: 0px; left: 0px; overflow: visible; width: 100%; height: 100%; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(255, 255, 255); z-index: 10000; opacity: 0.5;"></div></div></div><div style="position: absolute; z-index: 100; margin: 0px; padding: 0px; pointer-events: none; bottom: 0px; right: 0px;"><div style="border: 0px none; margin: 0px; padding: 0px; pointer-events: none; float: right; height: 22px;"><a href="https://ssl.pstatic.net/static/maps/mantle/notice/legal.html" target="_blank" style="display: block; width: 48px; height: 17px; overflow: hidden; margin: 0px 5px 5px 12px; pointer-events: auto;"><img src="https://ssl.pstatic.net/static/maps/mantle/1x/naver-normal-new.png" width="48" height="17" alt="NAVER" style="display:block;width:48px;height:17px;overflow:hidden;border:0 none;margin:0;padding:0;max-width:none !important;max-height:none !important;min-width:0 !important;min-height:0 !important;"></a></div></div></div>

          <div class="inner">
            <!-- 주변 인기 식당 -->
            <section class="module near-rastaurant NearByRestaurantList">
              <span class="title NearByRestaurantList__Title">주변 인기 식당</span>

              <ul class="list-restaurants type-single NearByRestaurantList__List">
              	<c:forEach var="side" items="${side_list }">
              		<li class="NearByRestaurantItem NearByRestaurantList__Item">
				    <div class="NearByRestaurantItem__PictureAndContent">
				  	
				      <a class="NearByRestaurantItem__PictureLink" href="viewPage?dSaup_no=${side.dSaup_no }">
				       <c:set var="index" value="${fn:indexOf(side.dPhoto,',') }"></c:set>
				       
				        <img class="NearByRestaurantItem__Picture loaded"alt="${fn:substring(side.dPhoto,0,index) }" src="${pageContext.request.contextPath }/resources/storage/department_img/${fn:substring(side.dPhoto,0,index) }" >
				       
				      </a>
				  
				      <div class="NearByRestaurantItem__Content">
				        <div class="NearByRestaurantItem__NameWrap">
				          <a class="NearByRestaurantItem__Name" href="viewPage?dSaup_no=${side.dSaup_no }">${side.dName }</a>
				          <span class="NearByRestaurantItem__Rating NearByRestaurantItem__Rating--Expected">4.3</span>
				        </div>
				  
				        <div class="NearByRestaurantItem__MetroAndCuisine">
				          <span class="NearByRestaurantItem__Metro">${side.dAddress }</span>
				          <span class="NearByRestaurantItem__SubCuisine">${side.dType }</span>
				        </div>
				  
				        <div class="NearByRestaurantItem__InfoWrap">
				          <dl class="NearByRestaurantItem__Info">
				            <dt class="NearByRestaurantItem__InfoLabel">음식 종류</dt>
				            <dd class="NearByRestaurantItem__InfoValue NearByRestaurantItem__InfoValue--SubCuisine">${side.dType }</dd>
				          </dl>
				  
				          <dl class="NearByRestaurantItem__Info">
				            <dt class="NearByRestaurantItem__InfoLabel">위치</dt>
				            <dd class="NearByRestaurantItem__InfoValue NearByRestaurantItem__InfoValue--Metro">${side.dAddress }</dd>
				          </dl>
				  
				          
				        </div>
				      </div>
				    </div>
				  </li>
              	
              	</c:forEach>

                
              </ul>
            </section>


          </div>

          <div class="ad_area right_map only-desktop" id="web_desktop-restaurant-right_map"><div class="ad_wrap"><div class="content" id="web_desktop-restaurant-right_map-content" data-google-query-id="CP6vg9P0t-oCFU3VTAIdHQUKyw"><div id="google_ads_iframe_/395211568/production/desktop-web.restaurant.right-side_0__container__" style="border: 0pt none; display: inline-block; width: 336px; height: 280px;"><iframe frameborder="0" src="https://665923654c12c30cb807a540fa4dd999.safeframe.googlesyndication.com/safeframe/1-0-37/html/container.html" id="google_ads_iframe_/395211568/production/desktop-web.restaurant.right-side_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="336" height="280" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-google-container-id="2" style="border: 0px; vertical-align: bottom;" data-load-complete="true"></iframe></div></div></div></div>

        </div>
      </div>
   </div>
      

</body>
</html>