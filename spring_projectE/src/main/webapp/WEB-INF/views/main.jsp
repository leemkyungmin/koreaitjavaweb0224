<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/assets/style/MainList.css" rel="stylesheet" type="text/css">

</head>
<body>
	<main class="pg-main">
  <div class="black_screen"></div>
  <article class="contents main-padding">
  

      <a class="inbound_banner only-mobile is_background" href="https://www.mangoplate.com/eat_deals" onclick="common_ga('PG_MAIN', 'CLICK_SALES_LOCAL')" style="background-image: url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/zanmofgd-kuncgxq.png)"></a>

        <section class="module popular_top_list_wrap">
  <div class="module_title_wrap">
    <h2 class="title">믿고 보는 맛집 리스트</h2>
  </div>
  <div class="slider-container toplist-slider">
    <button class="btn-nav prev slick-arrow slick-disabled" aria-disabled="true" style="display: inline-block;"></button>
    

    <div class="top_list_slide slick-initialized slick-slider slick-dotted" role="toolbar">
        <div aria-live="polite" class="slick-list draggable">
        	<div class="slick-track" role="listbox" style="opacity: 1; width: 2000px; transform: translate3d(0px, 0px, 0px);">
        		<c:forEach var="list" items="${list }" varStatus="f">
        		<c:set var="img_source" value="main_list_img"></c:set>
        		<c:if test="${f.count%2==1}">
        			<div class="under_line">
        			<ul class="list-toplist-slider slick-slide slick-current slick-active" style="width: 551px;height:501px"; data-slick-index="0" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide00">
        		</c:if>
            		<li>
              			<img class="center-croping" alt="${img_source}${f.count}" src="${pageContext.request.contextPath }/resources/storage/main_img/${img_source}${f.count}.jpg">

              			<a href="locationlist?location=${list.dong}"  tabindex="0">
	                		<figure class="ls-item">
		                 		<figcaption class="info">
			                    	<div class="info_inner_wrap">
				                      <span class="title" data-ellipsis-id="1">${list.dong} 맛집 ${list.count }곳 </span>
				                      <p class="desc" data-ellipsis-id="31">${list.dong} 베스트</p>
			                    	</div>
		                  		</figcaption>
	                		</figure>
              			</a>
            		</li>
		         <c:if test="${f.count %2==0 or f.last }">
	       			 </ul>
	       			 </div>
		         </c:if> 
       			 </c:forEach>
        	</div>
        </div>
  </div>
</section>

  </article>

    

    


</main>

</body>
</html>