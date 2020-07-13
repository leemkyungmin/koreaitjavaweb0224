<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	
	<style>
		.invisible {
			margin-top: 1px;
			margin-left:80px;
			top: 55px;
			width: 500px;
			position: absolute;
			background: white;
		}
		
		.item {
			height: 1.8em;
			width: 220px;
			outline: none;
			font-size: 30px;
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
	
	<script>
		
	function fn_goInput(f){

		var a = document.getElementById("aa")).innerText;
		document.getElementById("search-input").value=a;
		};
	
	</script>
	
	<div class="header-wrap">
		<div class="title-wrap">
			<p class="title">솔직한 리뷰, 믿을 수 있는 평점!</p>
			<h1 class="title">코리아 플레이트</h1>
		</div>
		
 		<div class="search-wrap">
	 		<div class="main-search">
				<div class="icon-box"><i class="fas fa-search"></i></div>
<<<<<<< HEAD
				<form class="search-form" action="searchPage">
				<input id="search-input" class="HomeSearchInput" name="main-search" type="text" maxlength="50" placeholder="지역, 식당 또는 음식" autocomplete="off" >
				<input class="btn-search" type="submit" value="검색">
=======
				<form class="search-form" action="searchResult" method="post" >
				<input id="search-input" class="HomeSearchInput" name="main-search"  type="text" maxlength="50" placeholder="지역, 식당 또는 음식" autocomplete="off" >
				<input class="btn-search" type="submit" value="검색" >
>>>>>>> branch 'master' of https://github.com/leemkyungmin/koreaitjavaweb0224.git
    			</form>
				<div class="invisible" style="display: none">
			       <div class="item"><a href="#" onclick="fn_goInput(this.value)" id="aa">test</a></div>

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


