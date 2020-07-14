<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../template/header.jsp" %>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style type="text/css">
		@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	div {
		margin: auto;
	}
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 80px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	}
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
	.selectButton{
			display: block;
			margin:auto;
			text-align: center;
	}
	.findId,.findPw{
		width:150px;
		height:60px;
		line-height:60px;
		display:inline-block;
		text-align: center;
		background: #007bff;
		border-radius: .3rem;;
	}
	.findPwWrap{
		display:none;
	}
	.findPw{
		background:gray;
	}
	</style>
	<script>
	$(function(){
		
		$('.findId').click(function(){
			$('.findPwWrap').css('display','none');
			$('.findIdWrap').css('display','block');
			$('.findId').css('background','#007bff');
			$('.findPw').css('background','gray');
		});
		$('.findPw').click(function(){	
			$('.findIdWrap').css('display','none');
			$('.findPwWrap').css('display','block');
			$('.findId').css('background','gray');
			$('.findPw').css('background','#007bff');
		});
	});
	function fn_findcId(f){
		
		$.ajax({
			url:"find_dept_id",
			type:"POST",
			data:{
					"dSaup_no" : f.dSaup_no.value,
					"dPhone" : f.dPhone.value,
					"dEmail" : f.dEmail.value
			},
			success :function(data){
				alert(data);
			},
			error :function(){
				alert('통신 실패');
			}
		});
	}
	function fn_findPw(f){
		$.ajax({
			url:"find_dept_pw",
			type:"POST",
			data:{
				"dSaup_no" : f.dSaup_no.value,
				"dId" : f.dId.value,
				"dEmail" : f.dEmail.value
			},
			success :function(data){
				alert(data);
			},
			error :function(){
				alert('통신 실패');
			}
		});
	}
		
	</script>
</head>
<body>
	<div class="selectButton">
		<div class="findId">
			아이디 찾기
		</div>
		<div class="findPw">
			비밀번호 찾기
		</div>
	</div>
	<div class="findIdWrap" style="width:22rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">아이디 찾기</h2>
		</div>
		<div class="card-body">
      <form class="form-signin"  method="POST">
        <h5 class="form-signin-heading">사업자 번호,연락처 를 입력해주세요</h5>
        <label for="dSaup_no" class="sr-only">사업자 번호</label>
        <input type="text" id="dSaup_no" name="dSaup_no" class="form-control" placeholder="사업자 번호" maxlength="11" required autofocus><BR>
        <label for="dPhone" class="sr-only">연락처</label>
        <input type="text" id="dPhone" name="dPhone" class="form-control" placeholder="연락처" maxlength="11" required><br>
        <label for="dEmail" class="sr-only">이메일</label>
        <input type="text" id="dEmail" name="dEmail" class="form-control" placeholder="이메일"  required><br>
        <input id="findUId" name="findUId" class="btn btn-lg btn-primary btn-block" type="button" onclick="fn_findcId(this.form)" value="아이디 찾기"  />
      </form>
      
		</div>
	</div>
	
	<div class="findPwWrap" style="width:22rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">비밀번호 찾기</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" onSubmit="logincall();return false">
        <h5 class="form-signin-heading">아이디,사업자 번호를 입력해주세요</h5>
        <label for="cId" class="sr-only">아이디</label>
        <input type="text" id="dId" class="form-control" placeholder="아이디" required autofocus><BR>
        <label for="dSaup_no" class="sr-only">사업자 번호</label>
        <input type="text" id="dSaup_no" class="form-control" placeholder="사업자 번호" maxlength="11" required><br>
         <label for="dEmail" class="sr-only">이메일</label>
        <input type="text" id="dEmail" name="dEmail" class="form-control" placeholder="이메일"  required><br>
        
        <input  name="login_dept" class="btn btn-lg btn-primary btn-block" type="button" onclick="fn_findPw(this.form)" value="비밀번호 찾기" />
      </form>
      
		</div>
	</div>
	

<%@ include file="../template/footer.jsp" %>