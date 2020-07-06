<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
	
	<style type="text/css">
			
		* {
			margin: 0;
			padding: 0;
		}	
		
		div {
			display: block;
		}
		
		body {
		    position: relative;
		    width: 687px;
		    margin: 0 auto;
		    font-size: 100%;
		    line-height: 100%;
		    text-size-adjust: 100%;
		    -webkit-text-size-adjust: 100%;
		    word-break: keep-all;
		}
			
		.ReviewWritenpage_Container {
			width: 687px;
			margin: 101px auto 62px;
		}
		
		.DeptName {
			display: block;
			width: 687px;
		    font-size: 28px;
		    line-height: 1.462;
		    color: #ff7100;
		    word-break: break-word;
		}
		
		.ReviewWritenpage_DeptName {
			margin-bottom: 20px;
			border: 0 none;
			text-align: center;
		}
		
		.ReviewPoint {
			text-align: center;
			margin-bottom: 20px;
		}
		
		.ReviewWritenPage_FormWrap {
			width: 687px;
			position: relative;
		}
		
		.ReviewWritenPage_Content {
			border: 1px solid #DBDBDB;
			border-radius: 3px;
			box-sizing: border-box;
			padding: 16px;
		}
		
		.ReviewWritenPage_Title {
			margin-bottom: 10px;
			height: 30px;
		}
		
		.ReviewWritenPage_Title label {
			text-align: center;
			display: inline-block;
			width: 50px;
		}
		
		.ReviewWritenPage_Title input {
			border: 1px solid #DBDBDB;
			padding: 5px;
		}
		
		.ReviewWritenPage_Editor {
			overflow: hidden;
			overflow-wrap: break-word;
			height: 150px;
			display: block;
			width: 100%;
			border: 0;
			resize: none;
			cursor: text;
		}
		
		.ReviewWritenPage_Editor:placeholder-shown {
			color: #CBCBCB;
		}
		
		.ReviewWritenPage_TextWrap {
			width: 687px;
			margin-bottom: 22px;
			position: relative;
		}
		
		.ReviewWritenPage_TextLength {
			position: absolute;
			right: 0;
			font-size: 12px;
			color: #7F7F7F;
			margin-right: 5px;
		}
		
		.ReviewWritenPage_PictureWrap {
			position: relative;
			width: 687px;
			margin-bottom: 41px;
			border: 0;
		}
		
		.ReviewWritenPage_ButtonsWrap {
			width: 678px;
			border: 0 none;
			display: flex;
			justify-content: flex-end;
		}
		
		.ReviewWritingPage_CalcelButton {
			min-width: 140px;
		    min-height: 50px;
		    margin-right: 16px;
		    padding-left: 14px;
		    padding-right: 14px;
		    border: 1px solid #7F7F7F;
		    border-radius: 50px;
		    font-size: 16px;
		    color: #7F7F7F;
		    text-align: center;
		    background-color: #FFFFFF;
		    cursor: pointer;
		}
		
		.ReviewWritingPage_SubmitButton {
			min-width: 140px;
		    min-height: 50px;
		    padding-left: 14px;
		    padding-right: 14px;
		    border: 1px solid #ff7100;
		    border-radius: 50px;
		    font-size: 16px;
		    color: #FFFFFF;
		    text-align: center;
		    background-color: #ff7100;
		}
		
		.ReviewWritingPage_SubmitButton_Deactive {
			border-color: #E9E9E9;
		    background-color: #E9E9E9;
		    color: #FFFFFF;
		    cursor: not-allowed;
		}
		
		ul, li { list-style: none; }
		
		.PictureContainer {
			position: relative;
			border: 0;
		}
		
		.PictureContainer_PictureList {
			margin-top: 5px;
			width: 100%;
		}
		
		.PictureContainer_PictureList img {
			width: 98px;
			height: 98px;
			margin-right: 9px;
    		margin-bottom: 9px;
		}
		
		.PictureContainer_PictureItem {
			position: absolute;
			margin-right: 9px;
			margin-bottom: 9px;
		}
		
	</style>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
		// 별점 스크립트
		var locked = 0;
		
		function show(star) {
			if (locked)
				return;
			
			var i;
			var image;
			var el;
			
			for (i=1; i<=star; i++) {
				image = 'image' + i;
				el = document.getElementById(image);
				el.src = 'resources/assets/images/star-solid.svg';
			}
		}
		
		function noshow(star) {
			if (locked)
				return;
			
			var i;
			var image;
			var el;
			
			for (i=1; i<=star; i++) {
				image='image' + i;
				el = document.getElementById(image);
				el.src = 'resources/assets/images/star-regular.svg';
			}
		}
		
		function lock(star) {
			show(star);
			locked = 1;
		}
		
		function mark(star) {
			lock(star);
			document.myForm.rPoint.value=star; // 평점 값 전송
		}
		
		
		// 리뷰 글자수 계산 스크립트
		$(document).ready(function() {
			
		    $('#review').keyup(function () {
		    	var review = $(this).val();
		    	$('#lengthResult').html(review.length + ' / 1000');
		    	
		    	if (review.length>1000) {
		    		alert('최대 1000자까지 입력 가능합니다.');
		    		$(this).val(review.substring(0, 1000));
		    		$('#lengthResult').html('1000 / 1000');
		    	}
		    	
		    	if (review.length>=1) {
		    		$('#submitBtn').removeClass("ReviewWritingPage_SubmitButton_Deactive");
		    	}
		    	
		    	if (review.length<1) {
		    		$('#submitBtn').addClass('ReviewWritingPage_SubmitButton_Deactive');
		    	}
		    });
		    
		});
		
		function fn_insertReview(form) {
			form.action='insertReview';
			form.submit();
		}
		
	</script>

</head>
<body>
	
		<div>
			<!-- header : 메인페이지로 가는 로고 -->
		</div>
	
	<form name="myForm" method="post" enctype="multipart/form-data">
		<div class="ReviewWritenpage_Container">
			<div class="ReviewWritenpage_DeptName">
				<!-- 가게이름 -->
				<strong class="DeptName">${deptDTO.dName}김밥천국</strong>
			</div>
			<div class="ReviewPoint">
				<!-- 별 개수 선택 -->
				<img id="image1" onmouseover=show(1) onclick="mark(1)" onmouseout=noshow(1) alt="별" src="resources/assets/images/star-regular.svg">
				<img id="image2" onmouseover=show(2) onclick="mark(2)" onmouseout=noshow(2) alt="별" src="resources/assets/images/star-regular.svg">
				<img id="image3" onmouseover=show(3) onclick="mark(3)" onmouseout=noshow(3) alt="별" src="resources/assets/images/star-regular.svg">
				<img id="image4" onmouseover=show(4) onclick="mark(4)" onmouseout=noshow(4) alt="별" src="resources/assets/images/star-regular.svg">
				<img id="image5" onmouseover=show(5) onclick="mark(5)" onmouseout=noshow(5) alt="별" src="resources/assets/images/star-regular.svg">
				
				<input type="hidden" name="rPoint"/>
			</div>
			<div class="ReviewWritenPage_ContentWrap">
				<div class="ReviewWritenPage_FormWrap">
					<div class="ReviewWritenPage_Content">
						<!-- 리뷰작성 -->
						<div class="ReviewWritenPage_Title">
							<label for="title-lbl">제목</label> <input id="title-lbl" type="text" name="rTitle" size="50"/>
						</div>
						<textarea name="rContent" class="ReviewWritenPage_Editor" id="review" rows="1" cols="1" placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
						<p class="ReviewWritenPage_TextLength" id="lengthResult" name="lengthResult">
							<!-- 글자 수 계산 -->
							0 / 1000
						</p>
					</div>
				</div>
				<div class="ReviewWritenPage_TextWrap">
				</div>
				<div class="ReviewWritenPage_PictureWrap">
					<!-- 이미지 업로드 -->
					<input type="file" id="input_file" name="files" multiple />
				</div>
			</div>
			<div class="ReviewWritenPage_ButtonsWrap">
				<!-- 버튼 -->
				<input type="button" class="ReviewWritingPage_CalcelButton" onclick="history.go(-1)" value="취소"/>
				<input type="button" id="submitBtn" class="ReviewWritingPage_SubmitButton ReviewWritingPage_SubmitButton_Deactive" onclick="fn_insertReview(this.form)" value="리뷰 올리기" />
			</div>
		</div>
	</form>

</body>
</html>