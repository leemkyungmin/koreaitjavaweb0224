<%@page import="java.util.Map"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.junit.runner.Request"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.regex.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">

	*{
		margin:0;
		padding:0;
	}
	body{
		position: relative;
	    min-width: 320px;
	    margin: 0 auto;
	    font-size: 100%;
	    line-height: 100%;
	    text-size-adjust: 100%;
	    -webkit-text-size-adjust: 100%;
	    word-break: keep-all;
		
	}

	.inner{
		box-sizing: border-box;
	}
	.inner>section{
	    width: 800px;
	    margin: 0 auto;
	    margin-top: 20px;
	}
	
	.pg-restaurant .restaurant-detail {
	    padding: 30px 0 0;
	    width: 800px;
	    margin: 0 auto;
	}
	.restaurant_name {
	    display: inline-block;
	    max-width: 100%;
	    word-break: break-all;
	}
	.rate-point{
		color: #ff792a;
    	margin-left: 5px;
	}
	
	html,body,div,span,h1,p,a,ol,ul,li,form,label{
		border:0 none;
	}
	
	header{
		border-bottom :1px solid lightgray;
		position:relative;
		padding-bottom: 10px;
		heigth:74px;
		display:block;
	}
	header>.restaurant_title_wrap{
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
	}
	header>.status.branch_none{
		margin:5px 0 10px;
	}
	header .title {
	    padding-right: 50px;
	    max-width: 75%;
	    font-size: 1.8rem;
	    line-height: 46px;
    }
    .pg-restaurant .restaurant-detail>header .review_writing_button {
	    display: -moz-flex;
	    display: -ms-flexbox;
	    display: flex;
	    display: -webkit-box;
	    display: -webkit-flex;
	    -moz-flex-direction: column;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    -webkit-flex-direction: column;
	    -webkit-box-direction: normal;
	    -webkit-box-orient: vertical;
	    -moz-align-items: center;
	    align-items: center;
	    -webkit-align-items: center;
	    -webkit-box-align: center;
	    -ms-flex-align: center;
	    margin: 0 19px 0 0;
	}
	
	button {
	    appearance: none;
	    cursor: pointer;
	    border: 0px;
	    border-radius: 0;
	    background-color: transparent;
	}
	
	.info {
	    padding: 20px 0;
	    position: relative;
	    display: block;
	}
	table{
		border-collapse: collapse;
    	border-spacing: 0;
    	border-collapse: separate;
	    box-sizing: border-box;
	    border-spacing: 2px;
	    border-color: grey;
	}
	table tbody {
	    display: table-row-group;
	    vertical-align: middle;
	    border-color: inherit;
	}
	caption, legend {
	    display: none;
	    position: absolute;
	    width: 0;
	    height: 0;
	    font-size: 0;
	    overflow: hidden;
	    visibility: hidden;
    }
	tbody tr {
	    display: table-row;
	    vertical-align: inherit;
	    border-color: inherit;
	  
	}
	.restaurant_action_button_wrap {
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
	    margin-left: auto;
    }
    .review_writing_button{
   		margin: 0 19px 0 0;
    }
	
	.info th {
	    width: 110px;
	    font-size: .9rem;
	    display: table-cell;
	    color: rgba(79,79,79,0.6);
	    line-height: 1.7;
	    text-align: left;
	    vertical-align: top;
	    padding-right: 10px;
	    padding-bottom: 5px;
	    font-weight: normal;
	}
	.info td {
	    font-size: .9rem;
		font-weight:bold;
	    line-height: 1.7;
	    text-align: left;
	    vertical-align: middle;
	    padding-bottom: 5px;
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
	.update_date {
    	padding: 4px 0 20px 0;
    	padding: 20px 10px 19px 10px;
	    font-size: 15px;
	    text-align: right;
	   
	}
	.RestaurantIntroduceSection {
	    display: -moz-flex;
	    display: -ms-flexbox;
	    display: flex;
	    display: -webkit-box;
	    display: -webkit-flex;
	    -moz-flex-direction: column;
	    -ms-flex-direction: column;
	    flex-direction: column;
	    -webkit-flex-direction: column;
	    -webkit-box-direction: normal;
	    -webkit-box-orient: vertical;
	    border-bottom: 1px solid #e9e9e9;
	}
	    
		
</style>

</head>
<body>
	이미지 처리 
	<c:set var="img" value="${deptDTO.dPoto }"></c:set>
	${deptDTO.dPoto }
	
	
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

                  <button class="review_writing_button" onclick="">
                    <i class="fas fa-pen fa-3x"></i>
                    <p class="review_writing_button_text">리뷰쓰기</p>
                  </button>

                 
                    <button class="btn-type-icon favorite wannago_btn " onclick="">
	                    <i class="far fa-calendar-check fa-3x"></i>
	                    <p class="wannago_txt">가고싶다</p>
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
                	예약자 수
                </span>
              </div>
            </header>


            <section class="restaurant_introduce_section_mobile only-mobile">
              <div class="RestaurantIntroduceSection">
  

    

    
		</div>

            

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

              <p class="update_date">
                 	업데이트  : ${deptDTO.dReg_date }
              </p>

            <div id="reviewListFocusId"></div>
          </section>

          <section class="restaurant_introduce_section_desktop only-desktop">
            <div class="RestaurantIntroduceSection">
  

    

    
</div>

          </section>

            <ul class="Restaurant__TagList only-mobile">
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/장어" onclick="trackEvent('CLICK_RELATED_TAG', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;장어&quot;})">#장어</a>
                </li>
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/방배" onclick="trackEvent('CLICK_RELATED_TAG_METRO', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;방배&quot;})">#방배</a>
                </li>
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/반포" onclick="trackEvent('CLICK_RELATED_TAG_METRO', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;반포&quot;})">#반포</a>
                </li>
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/잠원" onclick="trackEvent('CLICK_RELATED_TAG_METRO', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;잠원&quot;})">#잠원</a>
                </li>
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/돈부리" onclick="trackEvent('CLICK_RELATED_TAG_SUBCUISINE', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;돈부리&quot;})">#돈부리</a>
                </li>
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/일본 카레" onclick="trackEvent('CLICK_RELATED_TAG_SUBCUISINE', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;일본 카레&quot;})">#일본 카레</a>
                </li>
                <li class="Restaurant__TagItem">
                  <a class="Restaurant__TagLink" href="/search/벤토" onclick="trackEvent('CLICK_RELATED_TAG_SUBCUISINE', {&quot;restaurant_key&quot;:&quot;KU-4QO6Yvt&quot;,&quot;keyword&quot;:&quot;벤토&quot;})">#벤토</a>
                </li>
            </ul>

          <div class="ad_area info only-desktop" id="web_desktop-restaurant-info"><div class="ad_wrap"><div class="content" id="web_desktop-restaurant-info-content" data-google-query-id="CNGotdyHseoCFRIIXAodzdkN6Q"><div id="google_ads_iframe_/395211568/production/desktop-web.restaurant.info_0__container__" style="border: 0pt none; display: inline-block; width: 728px; height: 90px;"><iframe frameborder="0" src="https://908c4a132c487a0a0030b4b2a0be0a37.safeframe.googlesyndication.com/safeframe/1-0-37/html/container.html" id="google_ads_iframe_/395211568/production/desktop-web.restaurant.info_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="728" height="90" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-google-container-id="1" style="border: 0px; vertical-align: bottom;" data-load-complete="true"></iframe></div></div></div></div>
          <div class="ad_area info only-mobile" id="web_mobile-restaurant-info"><div class="ad_wrap"><div class="content" id="web_mobile-restaurant-info-content"></div></div></div>

          <script id="reviewCountInfo" type="application/json">[{"action_value":1,"count":11},{"action_value":2,"count":35},{"action_value":3,"count":114}]</script>
          
      </div>
   </div>
      

</body>
</html>