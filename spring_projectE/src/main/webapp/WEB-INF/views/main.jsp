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
<script type="text/javascript">
	$(function(){
		/* $('#si').change(function(){
			//Select Dong Change
			
			
			$.ajax({
				url:'main/changeDong',
				method:'post',
				data:'si='+$(this).val(),
				success :function(data){
					$('#dong').empty();
					$('#dong').append(data);
				},
				error : function(){
					alert('통신 실패');
				}
					
			});
			
			
			
		}); */
	});
	
	
	function changedong(){
		
	}
	function getAjax(query){
		
	}
	
</script>

</head>
<body>

<!-- 

	<c:forEach var="list" items="${list }">
		            <li>
		              <img class="center-croping" alt="밀면 맛집 베스트 15곳  사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/9utfi6xa3yrqhdcq.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">
		
		              <a href="/top_lists/855_milmyeon" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:0,&quot;link_key&quot;:&quot;WQBIFOR&quot;});" tabindex="0">
		                <figure class="ls-item">
		                  <figcaption class="info">
		                    <div class="info_inner_wrap">
		                      <span class="title" data-ellipsis-id="1">${list.dong } 맛집 베스트 ${list.count } 곳 </span>
		                      <p class="desc" data-ellipsis-id="31">"${list.dong } 맛집 베스트"</p>
		                      
		                    </div>
		                  </figcaption>
		                </figure>
		              </a>
		            </li>
		            </c:forEach>
 -->


	<main class="pg-main">
  <div class="black_screen"></div>
  <article class="contents main-padding">
  

      <a class="inbound_banner only-mobile is_background" href="https://www.mangoplate.com/eat_deals" onclick="common_ga('PG_MAIN', 'CLICK_SALES_LOCAL')" style="background-image: url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/zanmofgd-kuncgxq.png)"></a>

        <section class="module popular_top_list_wrap">
  <div class="module_title_wrap">
    <h2 class="title">믿고 보는 맛집 리스트</h2>
      <a class="module_more" href="/top_lists" onclick="trackEvent('CLICK_TOPLIST_LIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;more_link&quot;:&quot;/top_lists&quot;,&quot;more_label&quot;:&quot;리스트 더보기&quot;})">
        리스트 더보기
      </a>
  </div>
  <div class="slider-container toplist-slider">
    <button class="btn-nav prev slick-arrow slick-disabled" aria-disabled="true" style="display: inline-block;"></button>
    <button class="btn-nav next slick-arrow" aria-disabled="false" style="display: block;"></button>

    <div class="top_list_slide slick-initialized slick-slider slick-dotted" role="toolbar">
        <div aria-live="polite" class="slick-list draggable"><div class="slick-track" role="listbox" style="opacity: 1; width: 3450px; transform: translate3d(0px, 0px, 0px);"><ul class="list-toplist-slider slick-slide slick-current slick-active" style="width: 546px;" data-slick-index="0" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide00">
            <li>
              <img class="center-croping" alt="밀면 맛집 베스트 15곳  사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/9utfi6xa3yrqhdcq.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/855_milmyeon" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:0,&quot;link_key&quot;:&quot;WQBIFOR&quot;});" tabindex="0">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="1">밀면 맛집 베스트 15곳 </span>
                      <p class="desc" data-ellipsis-id="31">"여름엔 밀면으로 더위나기!"</p>
                      <p class="hash">
                          <span>#밀면 </span>
                          <span>#부산 밀면 </span>
                          <span>#부산밀면 </span>
                          <span>#비빔 밀면 </span>
                          <span>#비빔밀면 </span>
                          <span>#물밀면 </span>
                          <span>#물 밀면 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
            <li>
              <img class="center-croping" alt="통인동 맛집 베스트 20곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/327916/ecwwv74p5xzrbc.jpg?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/878_tongindong" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:1,&quot;link_key&quot;:&quot;V7UHV5N&quot;});" tabindex="0">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="2">통인동 맛집 베스트 20곳</span>
                      <p class="desc" data-ellipsis-id="32">"소개팅, 데이트 핫플은 바로 여기!"</p>
                      <p class="hash">
                          <span>#통인동 </span>
                          <span>#대림미술관 </span>
                          <span>#서촌 </span>
                          <span>#경복궁역 </span>
                          <span>#종로 </span>
                          <span>#경복궁 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
        </ul></div></div>
        
        
        
        
        
	</div>
	</div> 
</section>

  </article>

    

    


</main>

</body>
</html>