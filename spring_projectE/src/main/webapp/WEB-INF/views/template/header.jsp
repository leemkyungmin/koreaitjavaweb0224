
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

<script>

	$(function () {
	    var lastScrollTop = 0,
	        delta = 15;
	    $(window).scroll(function (event) {
	        var st = $(this).scrollTop();
	        if (Math.abs(lastScrollTop - st) <= delta) return;
	        if ((st > lastScrollTop) ) {
	            $(".nav-wrap").css("background-color", "white");
	        } if((st < lastScrollTop) ) {
	            $(".nav-wrap").css("background-color", "transparent");
	        }
	        lastScrollTop = st;
	    });
	});  
</script>

</head>
<body>

	
	<header class="Header" data-page="home">
		<ul class="nav-wrap">
				<li class="nav-logo-wrap">
					<a href="index"><img alt="로고이미지" src="<c:url value="/resources/assets/images/logo01.png" />" class="logo"></a>
				</li>
				<li class="nav-search-wrap" >
					<div class="nav-icon-box"><i class="fab fa-searchengin"></i></div><input class="nav-HomeSearchInput" name="main-search" type="text" maxlength="50" placeholder="지역, 식당 또는 음식" autocomplete="off" onclick="">
				</li>
				<li class="nav-list-wrap">
					<a href="">맛집 리스트</a>
				</li>
				<li class="nav-user-wrap">
					<a href=""><i class="far fa-user"></i></a>
				</li>
		</ul>
	</header>
	
