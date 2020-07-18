
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코리아플레이트:나만의 맛집 지도</title>

<link rel="stylesheet" href="resources/assets/style/main.css" type="text/css">
<link rel="stylesheet" href="resources/assets/style/nav.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-2.2.2.js"></script>

<script type="text/javascript">

	$(function () {
	$('.nav-HomeSearchInput').click(function () {  
	    if($(".nav-invisible").css("display") == "none"){   
	    	$('.nav-invisible').css("display", "block");
	    } else {  
	    	$('.nav-invisible').css("display", "none");   
	    }  
		}); 
	});
	
	
	$( document ).ready(function() {
	    $(document).mouseup(function(e){
	    var container = $(".nav-invisible");
	    if(container.has(e.target).length === 0)
	        container.hide();
	    });
	});
	
	function fn_logout() {
		if(confirm('로그아웃하시겠습니까?')){
			location.href = 'logout';
		}
	}
	function fn_deptlogout() {
		if(confirm('로그아웃하시겠습니까?')){
			location.href = 'deptlogout';
		}
	}
	
</script>

<style>
		.nav-invisible {
			margin-top: 1px;
			margin-left:140px;
			width: 500px;
			top:48px;
			position: fixed;
			background: white;
			z-index:9;
		}
		
		.item {
			height: 1.8em;
			width: 220px;
			outline: none;
			font-size: 20px;
    		padding-left: 15px;
    		color: lightgray;
		}
		
		.item:hover {
			color: #9baec8;
		}
		
		.nav-search-submit {
			display: none;
		}
		
		.nav-search-form {
			display: flex;
		}
</style>

	<script type="text/javascript">
	
		function fn_search() {
			var search_keyword = $(#search_keyword).val();
			location.href="searchPage?main-search=search_keyword";
		}
	
	</script>
</head>
<body class="pt-5">

	
	<header class="Header" data-page="home">
		<ul class="nav-wrap">
				<li class="nav-logo-wrap">
					<a href="index"><img alt="로고이미지" src="<c:url value="/resources/assets/images/logo01.png" />" class="logo"></a>
				</li>
				<li class="nav-search-wrap" >
					<form class="nav-search-form" action="searchPage">
					<div class="nav-icon-box"><i class="fab fa-searchengin"></i></div>
					<input id="search_keyword" class="nav-HomeSearchInput" name="main-search" type="text" maxlength="50" placeholder="지역 또는 맛집 이름" autocomplete="off">
					<input class="nav-search-submit" type="submit" value="전송">
					</form>
				</li>
				<c:if test="${sessionScope !=null && sessionScope.cGrede==5 }">
					<li class="nav-list-wrap">
						<a href="adminmanagePage" class="nav-btn">관리자 페이지로 이동하기</a>
					</li>
				</c:if>
				
				<li class="nav-list-wrap">
					<a href="main2" class="nav-btn">맛집 리스트</a>
				</li>
				
				<li class="nav-user-wrap">
					<c:if test="${sessionScope.cId eq null and sessionScope.dId eq null }">
						<a href="loginChoicePage" class="nav-btn"><i class="far fa-user"></i></a> <!-- 로그인 안돼있으면 로그인페이지 돼어있으면 마이페이지 이동. -->
					</c:if>	
					<c:if test="${sessionScope.cId ne null}">
						<a href="myPage" class="nav-btn"><i class="far fa-user"></i></a>
						<input type="button" value="로그아웃"  onclick="fn_logout()" />
					</c:if>
					<c:if test="${sessionScope.dId ne null }">
						<a href="deptmyPage" class="nav-btn"><i class="far fa-user"></i></a>
						<input type="button" value="로그아웃"  onclick="fn_logout()" />
					</c:if>
					
				</li>
		</ul>
		<!-- <div class="nav-invisible" style="display: none">
			        <div class="item">test0<span class="text"></span></div>
			        <div class="item">test1<span class="text"></span></div>
			        <div class="item">test2<span class="text"></span></div>
			        <div class="item">test3<span class="text"></span></div>
			        <div class="item">test4<span class="text"></span></div>
			        <div class="item">test5<span class="text"></span></div>

    	</div> -->
	</header>

