<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-wrap">
		<div class="user-info">
			<div class="user_img">
				<img alt="${rdto.cPoto }" src="${pageContext.request.contextPath }/resources/storage/user_img/${rdto.cPoto }">
				${pageContext.request.contextPath }
			</div>
			 <span class="user-nickName">${rdto.cNickname}</span>
		</div>
		<div class ="content">
			${rdto.rTitle }<br/>
			${rdto.rContent }
		</div>
		<div class="image-Content">
			
		</div>
	</div>

</body>
</html>