<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	.main-wrap{
		display:block;
		margin: 61px auto 40px;
    	padding: 10px 15px;
		width: 80%;
	}
	.user-info,.tcontent{
		margin-bottom: 10px;
		padding:  10px 0 10px 0;
		border-bottom: 1px solid lightgray;
		width: 80%;	
	}
	.user-info .user_img{
		display:inline-block;
	}
	.user_img img{
		width: 45px;
		height: 45px;
		margin-right: 10px;
	    border-radius: 100%;
	    background-size: cover;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	}
	.user-nickName{
		margin: 0 10px 4px 0;
		height: 45px;
	}
	
	.title_content{
		
		margin-right: 20px;
	}
	.image-Content{
		width:80%;
		position: relative;
	    margin-bottom: 10px;
	    white-space: nowrap;
	    overflow-x: auto;
	    overflow-y: hidden;
	    overflow-scrolling: touch;
	    -webkit-overflow-scrolling: touch;
	}
	.image_wrap{
		font-size: 0;
    	line-height: 0;
	}
	
	.reviewPicture >img{
		display: inline-block;
	    width: 200px;
	    height: 200px;
	    margin-right: 6px;
	    background-size: cover;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    cursor: pointer;
	}
	.reviewPicture{
		display:inline-block;
	}
	
</style>

</head>
<body>
	<div class="main-wrap">
		<div class="user-info">
			<div class="user_img">
				<img alt="${rdto.cPoto }" src="${pageContext.request.contextPath }/resources/storage/user_img/${rdto.cPoto }">
			</div>
			 <span class="user-nickName">${rdto.cNickname}</span>
		</div>
		<div class ="tcontent">
		<div class="title">
			<span class="title_content">제목</span>${rdto.rTitle }
		</div>
			${rdto.rContent }
		</div>
		<div class="image-Content">
			<div class="image_wrap">
				<c:set var="img" value="${rdto.rPoto }"></c:set>
				<c:forEach var="img" items="${fn:split(img,',') }">
					<div class="reviewPicture">
						<img alt="${img }" src="${pageContext.request.contextPath}/resources/storage/review_img/${img}">
					</div>
				
				</c:forEach>
			</div>
		</div>
		
	</div>

</body>
</html>