<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="../template/header.jsp" %>
	<link href="resources/assets/style/locationlist.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
<% String main_search = request.getParameter("main-search"); %>

	<script>
		
	
	
	$(function(){
		//넣어주기 버튼에 클릭 이벤트 달아줌 
			var q ='<%=main_search%>';
			
			if(Cookies.get('query') === undefined|| // 쿠키에 key로 list 가 존재하지 않거나
					Cookies.get('query') == '[null]'){ // 안에 값이 다 삭제가되어 [null] 인 경우
				Cookies.set('query', "[{\"name\":\""+'<%=main_search%>'+"\"}]");
				
			}else{
				var count =0;
				var json_list = Cookies.getJSON('query');
				
				 for(var i=0; i<json_list.length; i++){
					for(key in json_list[i]){
						if(json_list[i][key]=='<%=main_search%>'){
							delete json_list[i];
							json_list=JSON.parse(JSON.stringify(json_list).replace(/(,null|null,)/g,''));
							console.log(json_list);
							break;
						}
					}
				}
					
				json_list.push({
					name: '<%=main_search%>',
				}); 
				Cookies.set('query', json_list); 
				
			} 
	
		
	 });

		
	
	
	
	  <%-- $(function(){
		var size ='${size}';
		var q = '<%=main_search%>';
		var url ='searchPage?main-search='+q;
		if(size != 0){
			if(Cookies.get('query') === undefined || Cookies.get('query') == '[null]'){
				
				Cookies.set('query', "[{\"name\":\""+q+"\",\"url\" : searchPage?main-search="+q+"}]");
				alert("성공");
				
			}else{
				
				var cookieArr = new Array(Cookies.getJSON('query'));
				
				alert(JSON.stringify(cookieArr));				
				cookieArr.push(
						name: q,
						url:"searchPage?main-search="+q	
				);
				
				
				Cookies.set('query',JSON.stringify(cookieArr));
			}
		
		}else{ 
			
		}
	});   --%>
	
	</script>
	
	<main class="mn-toplist pg-toplist">
	<article class="contents">
    
    <header class="basic-info-list">
      <div class="inner" style="padding-bottom: 10px">
        <h1 class="title"><%=main_search %> 검색 결과 ${size } 곳</h1>
       </div> 
    </header>

    <div class="container-list" id="contents_width">
      <div class="inner">
        <div class="ad_area right_space only-desktop" id="web_desktop-toplist-right_space"><div class="ad_wrap"><div class="content" id="web_desktop-toplist-right_space-content" data-google-query-id="CLHRvJ3bweoCFQWewgody_MIow"><div id="google_ads_iframe_/395211568/alpha/desktop-web.toplist.right-side_0__container__" style="border: 0pt none; display: inline-block; width: 160px; height: 600px;"><iframe frameborder="0" src="https://f431e69df376240d008dc454aec7ffb4.safeframe.googlesyndication.com/safeframe/1-0-37/html/container.html" id="google_ads_iframe_/395211568/alpha/desktop-web.toplist.right-side_0" title="3rd party ad content" name="" scrolling="no" marginwidth="0" marginheight="0" width="160" height="600" data-is-safeframe="true" sandbox="allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation" data-google-container-id="3" style="border: 0px; vertical-align: bottom;" data-load-complete="true"></iframe></div></div></div></div>

        <!-- 해당 레스토랑 목록 -->
        <section id="contents_list">
          
          <ul class="list-restaurants type-single-big top_list_restaurant_list">
          	<c:forEach var="list" items="${list }" varStatus="index">
          	
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