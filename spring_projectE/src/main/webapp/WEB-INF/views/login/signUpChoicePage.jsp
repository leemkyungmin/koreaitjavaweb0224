<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.main-aside {
		width: 200px;
		border: 1px solid limegreen;
	}
	input:nth-of-type(1) { display: none; } /* input:nth-of-type(1) == input id=a */
	input:nth-of-type(1) ~ div:nth-of-type(1) { display: none; } /* FRONT-END의 div class=tab-contents 숨김 */
	input:nth-of-type(1):checked ~ div:nth-of-type(1) {display: block;} /* FRONT-END 클릭하면 FRONT-END의 div class=tab-contents 보여쥼 */
	
	input:nth-of-type(2) { display: none; } /* input:nth-of-type(2) == input id=b */
	input:nth-of-type(2) ~ div:nth-of-type(2) { display: none; } /* BACK-END의 div class=tab-contents 숨김 */
	input:nth-of-type(2):checked ~ div:nth-of-type(2) {display: block;} /* BACK-END 클릭하면 BACK-END의 div class=tab-contents 보여쥼 */
	
	.tab-buttons { display:flex; }
	.tab-buttons > label {
		display: block;
		width: 100px;
		height: 50px;
		line-height: 50px;  /* height == line-height 이면 텍스트 세로 가운데 맞춤 */
		text-align: center; /* 텍스트 가로 가운데 맞춤 */
		background-color: limegreen;
		color: white; 
	}
	input:nth-of-type(1):checked ~ section.tab-buttons > label:nth-of-type(1){
		background: darkgreen;
		font-weight: bold;
		text-shadow: 2px 2px 1px gray;
	}
	input:nth-of-type(2):checked ~ section.tab-buttons > label:nth-of-type(2){
		background: darkgreen;
		font-weight: bold;
		text-shadow: 2px 2px 1px gray;
	}
	
	.tab-content > ul {
		list-style-type: none;
		padding: 0;
	}
	.tab-content > ul > li.content {
		overflow: hidden;
		width: 180px;
		padding: 10px;
	}
	.tab-content > ul > li.content div.thumbnail {
		float: left;
	}
	.tab-content > ul > li.content div.description {
		float: left;
		margin-left: 10px;
	}
	
</style>
</head>
<body>
	
	일반 회원가입
	<input type="button" value="가입하기" onclick="location.href='customerSignUp'" /> <br/>
	업체 회원가입
	<input type="button" value="가입하기" onclick="location.href='deptSignUp'" /> <br/>
	
	<div class="main-aside">
		<input id="a" type="radio" name="tab" checked />
		<input id="b" type="radio" name="tab" />
		<section class="tab-buttons">
			<label for="a">FRONT-END</label>
			<label for="b">BACK-END</label>
		</section>
		<div class="tab-content">
			<ul>
				<li class="content">
					<a href="http://naver.com">
						<div class="thumbnail">
							<img alt="50X50"src="https://via.placeholder.com/50X50">
						</div>
						<div class="description">
							<strong>HTML</strong><br/>
							<p>HTML설명</p>
						</div>
					</a>
				</li>
				<li class="content">
					<a href="#">
						<div class="thumbnail">
							<img alt="50X50"src="https://via.placeholder.com/50X50">
						</div>
						<div class="description">
							<strong>CSS</strong><br/>
							<p>CSS설명</p>
						</div>
					</a>
				</li>
			</ul>
		</div>
		<div class="tab-content">
			<ul>
				<li class="content">
					<a href="#">
						<div class="thumbnail">
							<img alt="50X50"src="https://via.placeholder.com/50X50">
						</div>
						<div class="description">
							<strong>JSP</strong><br/>
							<p>JSP설명</p>
						</div>
					</a>
				</li>
				<li class="content">
					<a href="#">
						<div class="thumbnail">
							<img alt="50X50"src="https://via.placeholder.com/50X50">
						</div>
						<div class="description">
							<strong>SPRING</strong><br/>
							<p>SPRING 설명</p>
						</div>
					</a>
				</li>
			</ul>
		</div>
	</div>
	
</body>
</html>