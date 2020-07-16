<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/2.2.1/js.cookie.js"></script>
<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="template/header.jsp" %>
	


	<link rel="stylesheet" href="resources/assets/style/main-nav.css" type="text/css">
	
	<script>
	
		$(function () {
		    var lastScrollTop = 0,
		        delta = 15;
		    $(window).scroll(function (event) {
		        var st = $(this).scrollTop();
		        if (Math.abs(lastScrollTop - st) <= delta) return;
		        if ((st > lastScrollTop) ) {
		            $(".nav-wrap").css("background-color", "white");
		            $(".nav-btn").css("color", "black");            
		        } if((st < lastScrollTop) ) {
		            $(".nav-wrap").css("background-color", "transparent");
		            $(".nav-btn").css("color", "white");
		        }
		        lastScrollTop = st;
		    });
		});
		
		$(function () {
		$('.HomeSearchInput').click(function () {  
		    if($(".invisible").css("display") == "none"){   
		    	$('.invisible').css("display", "block");
		    } else {  
		    	$('.invisible').css("display", "none");   
		    }  
			}); 
		});
		
		
		$( document ).ready(function() {
		    $(document).mouseup(function(e){
		    var container = $(".invisible");
		    if(container.has(e.target).length === 0)
		        container.hide();
		    });
		});
	
	</script>
	
	 <script>
	 	var json_list = Cookies.getJSON('query');
		$(function(){
			var html ='';
			console.log(json_list.length);
			console.log(json_list);
			for(var i=json_list.length-1; i>=0; i--){
				for(key in json_list[i]){
					if(json_list[i][key] !=""){
						html +='<div class="item"><a href="searchPage?main-search='+json_list[i][key]+'">'+json_list[i][key]+'</a></div>';
					}
				}
			}
			$('.invisible').html(html);
		});
		
	</script> 
	
	
	<style>
		.invisible {
			margin-top: 1px;
			margin-left:80px;
			top: 61px;
			width: 500px;
			position: absolute;
			background: white;
			z-index: 999;
			border: 2px solid #ff7100;
			border-top: 0;
		}
		
		.item {
			height: 1.8em;
			width: 220px;
			margin-left: 5px;
			margin-top: 10px;
			outline: none;
			font-size: 20px;
    		padding-left: 15px;
    		color: lightgray;
		}
		
		.item:hover {
			color: #9baec8;
		}
		
		#aa {
			text-decoration: none;
		}
		

	</style>
	
	
	<div class="header-wrap">
		<div class="title-wrap">
			<p class="title">솔직한 리뷰, 믿을 수 있는 평점!</p>
			<h1 class="title">코리아 플레이트</h1>
		</div>
		
 		<div class="search-wrap">
	 		<div class="main-search">
				<div class="icon-box"><i class="fas fa-search"></i></div>
				<form class="search-form" action="searchPage">
				<input id="search-input" class="HomeSearchInput" name="main-search" type="text" maxlength="50" placeholder="지역명, 맛집 이름" autocomplete="off" >
				<input class="btn-search" type="submit" value="검색">

    			</form>
				<div class="invisible" style="display: none">
			       
			       <!-- <div class="item"><a href="searchPage?main-search=" ></a></div> -->

    			</div>
			</div>					
		</div>
		
		
		<video autoplay loop muted>
			<source src="<c:url value="/resources/assets/video/indexvideo01.mp4" />" type="video/mp4">
		</video>
	</div>
	

	${sessionScope }
	
	<a href="viewPage?dSaup_no=11111111111">view페이지 테스트</a><br/><br/>

	<a href="loginChoicePage">테스트용 로그인하러가기</a> <!-- 테스트용 수정하셔도 됩니다. --> 
	
	<%@ include file="main.jsp" %>
	
<%@ include file="template/footer.jsp" %>


