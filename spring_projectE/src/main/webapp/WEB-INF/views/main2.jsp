<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/assets/style/MainList.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	$(function(){
		$('#si').change(function(){
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
			
			
			
		});
	});
	
	
	function changedong(){
		
	}
	function getAjax(query){
		
	}
	
</script>

</head>
<body>
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
        <div aria-live="polite" class="slick-list draggable"><div class="slick-track" role="listbox" style="opacity: 1; width: 2000px; transform: translate3d(0px, 0px, 0px);"><ul class="list-toplist-slider slick-slide slick-current slick-active" style="width: 546px;" data-slick-index="0" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide00">
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
        </ul><ul class="list-toplist-slider slick-slide slick-active" style="width: 546px;" data-slick-index="1" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide01">
            <li>
              <img class="center-croping" alt="버블티 맛집 베스트 10곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/dwcfopjpt2dyxicw.jpg?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1681_bubbletea" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:2,&quot;link_key&quot;:&quot;LO5J87Z&quot;});" tabindex="0">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="3">버블티 맛집 베스트 10곳</span>
                      <p class="desc" data-ellipsis-id="33">"쫀뜩한 타피오카를 쪽쪽!"</p>
                      <p class="hash">
                          <span>#버블티 </span>
                          <span>#밀크티 </span>
                          <span>#대만 밀크티 </span>
                          <span>#타피오카 </span>
                          <span>#타로 밀크티 </span>
                          <span>#버블밀크티 </span>
                          <span>#타로 버블티 </span>
                          <span>#블랙티 </span>
                          <span>#그린티 </span>
                          <span>#흑당 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
            <li>
              <img class="center-croping" alt="일본 가정식 맛집 베스트 15곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/u4tflfdkxhc2t20h.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1363_japanese_homemade" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:3,&quot;link_key&quot;:&quot;NBJOSO8&quot;});" tabindex="0">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="4">일본 가정식 맛집 베스트 15곳</span>
                      <p class="desc" data-ellipsis-id="34">"어딜 가나 집밥이 최고!"</p>
                      <p class="hash">
                          <span>#일본 가정식 </span>
                          <span>#일본가정식 </span>
                          <span>#일식 </span>
                          <span>#가정식 </span>
                          <span>#일식가정식 </span>
                          <span>#일본식백반 </span>
                          <span>#일식백반 </span>
                          <span>#일본식 백반 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
        </ul><ul class="list-toplist-slider slick-slide slick-active" style="width: 546px;" data-slick-index="2" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide02">
            <li>
              <img class="center-croping" alt="즉석떡볶이 맛집 베스트 30곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/-uaiojie69-evmxq.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1301_tteokbokki" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:4,&quot;link_key&quot;:&quot;QUJ4Z2R&quot;});" tabindex="0">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="5">즉석떡볶이 맛집 베스트 30곳</span>
                      <p class="desc" data-ellipsis-id="35">"즉떡의 매력은 무궁무진해!"</p>
                      <p class="hash">
                          <span>#즉석떡볶이 </span>
                          <span>#즉석 떡볶이 </span>
                          <span>#즉떡 </span>
                          <span>#즉석 </span>
                          <span>#떡볶이 </span>
                          <span>#분식 </span>
                          <span>#국물 떡볶이 </span>
                          <span>#국물떡볶이 </span>
                          <span>#떡복이 </span>
                          <span>#즉석떡복이 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
            <li>
              <img class="center-croping" alt="빵집 베스트 45곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/sreelxdjgjnq02l3.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/national_bread_top50" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:5,&quot;link_key&quot;:&quot;MSKXWHY&quot;});" tabindex="0">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="6">빵집 베스트 45곳</span>
                      <p class="desc" data-ellipsis-id="36">"밥 없이는 살아도 빵 없이는 못 살아!"</p>
                      <p class="hash">
                          <span>#빵 </span>
                          <span>#빵집 </span>
                          <span>#베이커리 </span>
                          <span>#베이커리카페 </span>
                          <span>#빵카페 </span>
                          <span>#빵 카페 </span>
                          <span>#베이커리 카페 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
        </ul><ul class="list-toplist-slider slick-slide" style="width: 546px;" data-slick-index="3" aria-hidden="true" tabindex="-1" role="option" aria-describedby="slick-slide03">
            <li>
              <img class="center-croping" alt="고속버스터미널 맛집 베스트 50곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/2vtlemcuzn-uces2.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1207_expressbusterminal" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:6,&quot;link_key&quot;:&quot;Z6YZXAQ&quot;});" tabindex="-1">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="7">고속버스터미널 맛집 베스트 50곳</span>
                      <p class="desc" data-ellipsis-id="37">"급하다고 아무거나 먹지 말아요 우리!"</p>
                      <p class="hash">
                          <span>#고속버스터미널 </span>
                          <span>#고터 </span>
                          <span>#신세계백화점 강남점 </span>
                          <span>#강남고속버스터미널 </span>
                          <span>#고속터미널 </span>
                          <span>#고속버스터미널역 </span>
                          <span>#고속터미널역 </span>
                          <span>#파미에스테이션 </span>
                          <span>#파미에스트리트 </span>
                          <span>#강남고터 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
            <li>
              <img class="center-croping" alt="신림 맛집 베스트 20곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/265831/gq4korgghxcm3t.jpg?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/272_sillim_station" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:7,&quot;link_key&quot;:&quot;3JGUTDF&quot;});" tabindex="-1">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="8">신림 맛집 베스트 20곳</span>
                      <p class="desc" data-ellipsis-id="38">"신림에 이렇게 맛집이 많았다구?"</p>
                      <p class="hash">
                          <span>#신림동 </span>
                          <span>#신림 </span>
                          <span>#신림역 </span>
                          <span>#관악 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
        </ul><ul class="list-toplist-slider slick-slide" style="width: 546px;" data-slick-index="4" aria-hidden="true" tabindex="-1" role="option" aria-describedby="slick-slide04">
            <li>
              <img class="center-croping" alt="망원동 맛집 베스트 50곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/ckovffsgyoxfo-61.jpg?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/757_mangwon" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:8,&quot;link_key&quot;:&quot;S1E61YA&quot;});" tabindex="-1">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="9">망원동 맛집 베스트 50곳</span>
                      <p class="desc" data-ellipsis-id="39">"망원동 맛집이 궁금하면? 이 리스트만 확인해봐!"</p>
                      <p class="hash">
                          <span>#망원동 </span>
                          <span>#망원 </span>
                          <span>#망원역 </span>
                          <span>#망리단길 </span>
                          <span>#마포구청역 </span>
                          <span>#마포 </span>
                          <span>#망원시장 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
            <li>
              <img class="center-croping" alt="일본 카레 맛집 베스트 50곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/al6_pajjhmnvppkk.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1037_curry_japanese" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:9,&quot;link_key&quot;:&quot;MCSULHU&quot;});" tabindex="-1">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="10">일본 카레 맛집 베스트 50곳</span>
                      <p class="desc" data-ellipsis-id="40">"일본식 카레 맛집 총집합!"</p>
                      <p class="hash">
                          <span>#카레 </span>
                          <span>#일본 카레 </span>
                          <span>#일본카레 </span>
                          <span>#일본식 카레 </span>
                          <span>#일본식카레 </span>
                          <span>#일식카레 </span>
                          <span>#일식 카레 </span>
                          <span>#커리 </span>
                          <span>#일본식커리 </span>
                          <span>#일본식 커리 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
        </ul><ul class="list-toplist-slider slick-slide" style="width: 546px;" data-slick-index="5" aria-hidden="true" tabindex="-1" role="option" aria-describedby="slick-slide05">
            <li>
              <img class="center-croping" alt="강원도 원주 맛집 베스트 35곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/rnk97um6gfvwm8rx.png?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1766_kangwonwonju" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:10,&quot;link_key&quot;:&quot;YLDBVSK&quot;});" tabindex="-1">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="11">강원도 원주 맛집 베스트 35곳</span>
                      <p class="desc" data-ellipsis-id="41">"원주 여행 시, 필수 먹킷 리스트!"</p>
                      <p class="hash">
                          <span>#강원도 </span>
                          <span>#원주 </span>
                          <span>#강원도 원주 </span>
                          <span>#강원도 원주시 </span>
                          <span>#원주시 </span>
                          <span>#강원도원주 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
            <li>
              <img class="center-croping" alt="부산 맛집 베스트 60곳 사진" src="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/r3rkgfyiohd2vydj.jpg?fit=around|600:400&amp;crop=600:400;*,*&amp;output-format=jpg&amp;output-quality=80">

              <a href="/top_lists/1096_summerguide_busan" onclick="trackEvent('CLICK_TOPLIST', {&quot;section_position&quot;:0,&quot;section_title&quot;:&quot;믿고 보는 맛집 리스트&quot;,&quot;position&quot;:11,&quot;link_key&quot;:&quot;PVUH7FL&quot;});" tabindex="-1">
                <figure class="ls-item">
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title" data-ellipsis-id="12">부산 맛집 베스트 60곳</span>
                      <p class="desc" data-ellipsis-id="42">"이번 휴가, 부산 여행 콜?"</p>
                      <p class="hash">
                          <span>#부산 </span>
                          <span>#해운대 </span>
                          <span>#부산대 </span>
                          <span>#부산진구 </span>
                          <span>#해운대역 </span>
                          <span>#서면역 </span>
                          <span>#남포동 </span>
                          <span>#전포카페거리 </span>
                          <span>#센텀시티 </span>
                          <span>#전포역 </span>
                          <span>#서면 </span>
                          <span>#전포동 </span>
                          <span>#센텀몰 </span>
                          <span>#벡스코 </span>
                          <span>#센텀 </span>
                      </p>
                    </div>
                  </figcaption>
                </figure>
              </a>
            </li>
        </ul></div></div>
        
        
        
        
        
    <ul class="slick-dots" style="display: block;" role="tablist"><li class="slick-active" aria-hidden="false" role="presentation" aria-selected="true" aria-controls="navigation00" id="slick-slide00"><button type="button" data-role="none" role="button" tabindex="0">1</button></li><li aria-hidden="true" role="presentation" aria-selected="false" aria-controls="navigation01" id="slick-slide01"><button type="button" data-role="none" role="button" tabindex="0">2</button></li></ul></div>
  </div>
</section>
</article>
