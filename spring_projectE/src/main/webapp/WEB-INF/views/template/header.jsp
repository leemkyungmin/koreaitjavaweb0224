<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코리아플레이트:나만의 맛집 지도</title>
<style type="text/css">
	
	* {
		margin: 0;
		padding:0;
	}
	body {
		background-color: red;
	}
	.header-wrap {
		width:100%;
		height:330px;
		background : transparent;
		overflow: hidden;

	}
	
	.footer-center  a { 
	 	color: #E6E6E6;
		text-decoration:none;
		
	} 
	
	.footer-wrap {
		width: 100%;
		height: 750px;
		background-color: #585858;
		text-align: center;
		color: #E6E6E6;
	}
	.footer-center {
		display: inline-block;
	}
	
	.footer-top {
		display: flex;
		margin-top: 20px;
	}
	
	.footer-top > div {
		
		margin: 10px;
		width : 300px;
		height: 350px;
		text-align: left;
	}

	.footer-logo {
		
	}
	.footer-introduce {

	}
	.footer-notice {

	}
		
	.footer-sns {

	}
	
	.footer-mid {
		margin: 10px;
		width: 1260px;
		height: 70px;
	}
	
	.footer-bottom {
		display: flex;
	}
	
	.footer-bottom > div {
		margin: 10px;
		padding: 10px;
		width: 600px;
		height: 200px;
	}
	.footer-info {
		text-align: left;
	}
	.footer-lang {
		text-align: right;
	}
	video {
		
		position: relative;
		top: 0px;
		left: 0px;
		min-width:100%;
		height:auto;
		z-index:-1;
		overflow: hidden;		
		
	}
	
	.logo {
		top:0;
		left:0;
		width:120px;
		height:60px;
		margin:10px;
		position: absolute;
	}

</style>

</head>
<body>

	<div class="header-wrap">
	
		<a href="/"><img alt="로고이미지" src="<c:url value="/resources/assets/logo01.png" />" class="logo"></a>
		<video autoplay loop muted>
			<source src="<c:url value="/resources/assets/indexvideo01.mp4" />" type="video/mp4">
		</video>
	</div>