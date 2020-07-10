<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<link href="resources/assets/style/locationlist.css" rel="stylesheet" type="text/css">
	<%@ include file="../template/header.jsp" %>
	<main class="mn-toplist pg-toplist">
	<article class="contents">
    <header class="basic-info-list">
      <div class="inner" style="padding-bottom: 10px">
        <h1 class="title">${location_count.dong} 맛집${location_count.count }곳 </h1>
        <h2 class="desc">
          “${location_count.dong} 맛집 베스트”
        </h2>
      </div>
    </header>

    <div class="container-list" id="contents_width">
      <div class="inner">
        <div class="ad_area right_space only-desktop" id="web_desktop-toplist-right_space"><div class="ad_wrap"><div class="content" id="web_desktop-toplist-right_space-content" data-google-query-id="CLHRvJ3bweoCFQWewgody_MIow"><div id="google_ads_iframe_/395211568/alpha/desktop-web.toplist.right-side_0__container__" style="border: 0pt none; display: inline-block; width: 160px; height: 600px;"><iframe frameborder="0" src="https://f431e69df376240d008dc454aec7ffb4.safeframe.googlesyndication.com/safeframe/1-0-37/html/container.html" id="google_ads_iframe_/395211568/alpha/desktop-web.toplist.right-side_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="160" height="600" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-google-container-id="3" style="border: 0px; vertical-align: bottom;" data-load-complete="true"></iframe></div></div></div></div>

        <!-- 해당 레스토랑 목록 -->
        <section id="contents_list">
          
          <ul class="list-restaurants type-single-big top_list_restaurant_list">
          	<c:forEach var="list" items="${location_list }" varStatus="index">
          	
              <li class="toplist_list">
                <div class="with-review">
                  <figure class="restaurant-item">
                    <a href="viewPage?dSaup_no=${list.dSaup_no }">
                      <div class="thumb">
                      	<c:set var="img" value="${list.dPhoto }"></c:set>
                      	<c:set var="img_index" value="${fn:indexOf(img,',') }"></c:set>
                        <img class="center-croping lazy" alt="${list.dName } 메인사진" src="${pageContext.request.contextPath }/resources/storage/department_img/${fn:substring(img,0,img_index)}">
                      </div>
                    </a>
                    <figcaption>
                      <div class="info">
                       
                        <span class="title ">
                          <a href="viewPage?dSaup_no=${list.dSaup_no }" >
                            ${index.count }.<h3>${list.dName}</h3>
                          </a>
                        </span>
                        <strong class="point  ">
                          <span>${list.dRating}</span>
                        </strong>
                        <p class="etc ">${list.dAddress }</p>
                        <!-- <div class="menu-List">
                        	<ul class="Restaurant_MenuList">
	                  		
	                  			<li class="Restaurant_MenuItem">
		                          	<span class="Restaurant_Menu">닷샤이 준마이</span>
		                            <span class="Restaurant_MenuPrice">150,000원</span>
	                        	</li>
	                  		
	                  			<li class="Restaurant_MenuItem">
		                          	<span class="Restaurant_Menu">상선여수 준마이</span>
		                            <span class="Restaurant_MenuPrice">68,000원</span>
	                        	</li>
	                  		
	                  			<li class="Restaurant_MenuItem">
		                          	<span class="Restaurant_Menu">초키겐 혼죠조</span>
		                            <span class="Restaurant_MenuPrice">46,000원</span>
	                        	</li>
	                  		
	                  		</ul>
                        </div> -->
                      </div>
                    </figcaption>
                  </figure>

                    


                  <a href="viewPage?dSaup_no=${list.dSaup_no }" class="btn-detail" >
                      <div class="restaurant-more-name">${list.dName }</div>
                      <div class="restaurant-more-text">더보기 &gt;</div>
                  </a>
                </div>
              </li>
              </c:forEach>
          </ul>

          
          </section>
      </div>
    </div>

  </article>
</main>

	<%@ include file="../template/footer.jsp" %>