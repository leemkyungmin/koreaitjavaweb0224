<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <%@ include file="../template/header.jsp" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    
    
    <!-- Bootstrap CSS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <title>로그인 폼</title>
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
	</style>
	
	<!-- 구글 리캡챠 -->
	 <!--여기에 div 추가 -->
    
 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- 여기에 스크립트 추가 -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
	
	<script type="text/javascript">
		
		// 일반회원 로그인
		$(function(){
			
			
			var captcha = false;
			$('#login').click(function(){
				
				$.ajax({
	                url: '/projectE/VerifyRecaptcha',
	                type: 'post',
	                data: {
	                    recaptcha: $("#g-recaptcha-response").val()
	                },
	                success: function(data) {
	                    switch (data) {
	                        case 0:
	                            captcha = true;
	                        case 1:
	                        	
	                            return false;
	                        default:
	                            alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                        	break;
	                    }
	                }
	            });
				
				if (captcha == false) {
					alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
					return false;
				}
				
				if (captcha == true){
					
					
					
					$.ajax({
						url:'customerLogin',
						type:'POST',
						data: 'cId=' + $('#cId').val() + '&cPw=' + $('#cPw').val(),
						success:function(data){
							if (data == '1'){
								alert('로그인 성공');
								location.href = 'index';
							} else {
								alert('로그인 실패');
							} 
								
						},
						error:function() {
							alert('AJAX 통신 실패');
						}
					});
				
			}	
			}); // login.click
		}); // function({})
		
		// 사업자 로그인
		
		$(function(){
			
			$('#login_dept').click(function(){
				$.ajax({
					url:'departmentLogin',
					type:'POST',
					data: 'dId=' + $('#dId').val() + '&dPw=' + $('#dPw').val(),
					success:function(data){
						if (data == '1'){
							alert('로그인 성공');
							location.href = 'index';
						} else {
							alert('로그인 실패');
						} 
							
					},
					error:function() {
						alert('AJAX 통신 실패');
					}
				});
			}); // login.click
		}); // function({})
		
		
		$(document).ready(function(){
			
			var savedID = getCookie("savedID");
			$('#cId').val(savedID);
			
			if ($('#cId').val() != '') {
				$('#saveIDCheck').attr('checked', true);
			}
			
			$('#saveIDCheck').change(function(){
				// 체크되어 있다
				if ( $('#saveIDCheck').is(':checked') ) {
					setCookie( "savedID", $('#cId').val(), 7 );  // 7일간 쿠키에 보관
				} 
				// 체크해제되어 있다.
				else {
					deleteCookie( "savedID" );
				}
			});
			
			$('#cId').keyup(function(){
				// 체크되어 있다
				if ( $('#saveIDCheck').is(':checked') ) {
					setCookie( "savedID", $('#cId').val(), 7 );  // 7일간 쿠키에 보관
				}
			});
			
		});
		
		function setCookie( cookieName, value, exdays ) {
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}

		// 2. 쿠키 삭제
		function deleteCookie( cookieName ) {
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}

		// 3. 쿠키 가져오기
		function getCookie( cookieName ) {
		    cookieName = cookieName + "=";
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = "";
		    if ( start != -1 ){
		        start += cookieName.length;
		        var end = cookieData.indexOf(";", start);
		        if(end == -1) {
		            end = cookieData.length;
		        }
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		
	</script>
	<script type="text/javascript">
		$(function(){
			$('.departmentWrap').css('display','none');
			$('.dept').css('background','gray');
			$('.customer').click(function(){
				$('.departmentWrap').css('display','none');
				$('.customerWrap').css('display','block');
				$('.customer').css('background','#007bff');
				$('.dept').css('background','gray');
			});
			$('.dept').click(function(){
				$('.customerWrap').css('display','none');
				$('.departmentWrap').css('display','block');
				$('.customer').css('background','gray');
				$('.dept').css('background','#007bff');
			});
			$('.recaptcha-checkbox').change(function(){
				if($('aria-checked').val() =="true"){
					captcha=true;
				}else{
					captcha=false;
				}
			})
		});
		 
	</script>
	<style>
		.selectButton{
			display: block;
			margin:auto;
			text-align: center;
		}
		.customer,.dept{
			width:150px;
			height:60px;
			line-height:60px;
			display:inline-block;
			text-align: center;
			background: #007bff;
			border-radius: .3rem;;
		}
	</style>
  </head>
<body>
	<div class="selectButton">
		<div class="customer">
			일반 회원 로그인
		</div>
		<div class="dept">
			업체 회원 로그인
		</div>
	</div>
	<div class="customerWrap" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">일반회원 로그인</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input type="text" id="cId" name="cId" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="cPw" name="cPw" class="form-control" placeholder="Password" required><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="true" id="saveIDCheck" name="saveIDCheck"> 기억하기
          </label>
        </div>
        <div style="text-align: center;">
        	<a href="findUserIdPw">아이디/비밀번호 찾기</a> <br/>
        	<a href="customerSignUp">회원가입</a>
        </div>
        <input id="login" name="login" class="btn btn-lg btn-primary btn-block" type="button" value="로 그 인" />
      </form>
      
		</div>
	</div>
	
	<div class="departmentWrap" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">업체 로그인</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" onSubmit="logincall();return false">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input type="text" id="dId" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="dPw" class="form-control" placeholder="Password" required><br>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 기억하기
          </label>
        </div>
        <div style="text-align: center;">
        	<a href="findDeptIdPw">아이디 / 비밀번호 찾기</a> <br/>
        	<a href="deptSignUpPage">업체 회원가입</a>
        </div>
        <input id="login_dept" name="login_dept" class="btn btn-lg btn-primary btn-block" type="button" value="로 그 인" />
      </form>
      
		</div>
	</div>
	
	
	
 
    <!-- <script>
        $(document).ready(function() {
            $("#login").click(function() {
                $.ajax({
                    url: '/projectE/VerifyRecaptcha',
                    type: 'post',
                    data: {
                        recaptcha: $("#g-recaptcha-response").val()
                    },
                    success: function(data) {
                        switch (data) {
                            case 0:
                                alert("자동 가입 방지 봇 통과");
                                break;
 
                            case 1:
                                alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                                return false;
 
                            default:
                                alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                                return false;
                        }
                    }
                });
            });
        });
 
    </script> -->
	<div class="g-recaptcha" data-sitekey="6Lfi_rEZAAAAAJofp01ZBq9JJ5p3cwmrXPyG6ecS"></div>
	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
	
<%@ include file="../template/footer.jsp" %>