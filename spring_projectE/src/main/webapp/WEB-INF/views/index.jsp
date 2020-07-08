<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<%@ include file="template/header.jsp" %>
	
	<style>
		.nav-wrap{
			position: fixed;
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
				<input id="main-search" class="HomeSearchInput" name="main-search" type="text" maxlength="50" placeholder="지역, 식당 또는 음식" autocomplete="off" onclick="">
				<input class="btn-search" type="submit" value="검색" onclick="">
			</div>
		</div>
		
		<video autoplay loop muted>
			<source src="<c:url value="/resources/assets/video/indexvideo01.mp4" />" type="video/mp4">
		</video>
	</div>

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
	</script>

	<div class="header-wrap">
		<div class="title-wrap">
			<p class="title">솔직한 리뷰, 믿을 수 있는 평점!</p>
			<h1 class="title">코리아 플레이트</h1>
		</div>
		
 		<div class="search-wrap">
	 		<div class="main-search">
				<div class="icon-box"><i class="fas fa-search"></i></div>
				<input id="main-search" class="HomeSearchInput" name="main-search" type="text" maxlength="50" placeholder="지역, 식당 또는 음식" autocomplete="off" onclick="">
				<input class="btn-search" type="submit" value="검색" onclick="">
			</div>
		</div>
		
		<video autoplay loop muted>
			<source src="<c:url value="/resources/assets/video/indexvideo01.mp4" />" type="video/mp4">
		</video>
	</div>

	<a href="viewPage?dSaup_no=11111111111">view페이지 테스트</a><br/><br/>

	<a href="loginChoicePage">테스트용 로그인하러가기</a> <!-- 테스트용 수정하셔도 됩니다. -->
	<br/>
	<a href="calendar">book페이지</a>
	
<%@ include file="template/footer.jsp" %>


