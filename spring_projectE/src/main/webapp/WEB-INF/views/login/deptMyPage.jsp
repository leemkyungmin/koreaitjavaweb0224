<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="ko">
    <head>
    <style>
    	#pwUpdate{
    		display:none;
    	}
    </style>
    
   	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <meta charset="utf-8">
        <!-- meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0"/ -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <!-- Bootstrap -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
        <script src="http://code.jquery.com/jquery.js"></script>
        <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<title>Insert title here</title>

	<script type="text/javascript">
		
	var color;
	var ans;
	var no = '${sessionScope.dSaup_no}';
	var pw = '${sessionScope.dPw}';
	var nickname = '${cDTO.cNickname}';
	var PwUpdatePass = false;
	
	
		$(function() {
			// 비밀번호 변경 버튼
			$('#cPwCheckBtn').click(function() {
				$('#pwUpdate').css('display','block')		
			});
			 
			var NicknamePass = false;
           	$('#nickname').blur(function() {
        		$.ajax({
        			url: 'NicknameCheck',
        			type: 'POST',
        			data: 'cNickname=' + $('#nickname').val(),
        			success: function(data) {
        				var color;
        				var ans;
        				if(data == '1'){
        					ans='중복된 별명 입니다.';
        					color='red';
        					
        				}else if ($('#nickname').val() != '' && data == '0'){
        					ans='변경 가능한 별명 입니다.';
        					color='blue';
        					NicknamePass=true;
        				} else {
        					ans='별명을 입력하세요';
        					color='red';
        				}	
        				$('#temp-nickname').text(ans);
        				$('#temp-nickname').css('color',color);
        			},
        			error: function () {
        				alert('AJAX 통신 실패');
        			}
        		});
        	});
			
			
			$('#dPwUpdateBtn').click(function() {
				
				if ($('#dPw').val() == "") {
					ans = '비밀번호를 입력하세요.';
					color = 'red';
					$('#temp').text(ans);
					$('#temp').css('color',color);
					return;
				}
				
				if ($('#dPwUpdate').val() == "") {
					ans = '새로운 비밀번호를 입력하세요.';
					color = 'red';
					$('#temp').text(ans);
					$('#temp').css('color',color);
					return;
				}
				
				
				
				$.ajax({
					url: 'deptpwUpdate',
					type: 'POST',
					data: 'dPw=' + $('#dPwUpdate').val() + '&dSaup_no=' + no,
					success: function (data) {
						if (data == '1') {
							if ($('#dPw').val() != pw) {
								ans = '비밀번호가 일치하지 않습니다.';
								color = 'red';
							} else if ($('#cPwUpdate').val() != $('#cPwCheck').val()) {
								ans = '새로운 비밀번호가 일치하지 않습니다.';
								color = 'red';
							} else if ($('#cPwUpdate').val() == "") {
								ans = '비밀번호를 입력하세요.';
								color = 'red';
							} else {
								ans = '사용가능합니다.';
								color = 'green'
								if (confirm('비밀번호를 변경 하시겠습니가?')){
									PwUpdatePass = true;
									alert('변경되었습니다.');
									location.href = 'deptmyPage';
								} else {
									alert('변경이 취소되었습니다.');
									return false;
								}
						}
							$('#temp').text(ans);
							$('#temp').css('color',color);
						}
					},
					error: function () {
						
					}
				});
			});
				
		}); // function({})
		
		function fileCheck(obj) {
			   pathpoint = obj.value.lastIndexOf('.');
			   filepoint = obj.value.substring(pathpoint+1,obj.length);
			   filetype=filepoint.toLowerCase();
			   if(filetype=='jpg' || filetype=='png' || filetype=='jpeg'){
				   
			   } else {
				   alert('이미지 파일만 선택할 수 있습니다.');
				   parentObj = obj.parentNode
				   node = parentObj.replaceChild(obj.cloneNode(true),obj);
				   return false;
			   }
			   
		   }
		function fn_multiUpload(f) {
			f.action = 'deptUpdate';
			f.submit();
		}
		
	
	</script>

</head>
<body>
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            <div class="row">
                <p></p>
                <div class="col-md-12">
                    <small>
                    <a href="loginPage">로그인</a> | <a href="#">회원가입</a>
                    </small>
                </div>
            </div>
            <!--// 헤더 들어가는 부분 -->
            <!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <!--// 모달창 -->
            <hr/>
            <!-- 본문 들어가는 부분 -->
                
 
 
            <form class="form-horizontal" id="loginForm" role="form" method="post"enctype="multipart/form-data">
                <div class="form-group" id="divId">
                	<h6>회원번호 : ${dDTO.dNo }</h6>
                	<input type="hidden" value="${dDTO.dNo }" name="dNo" id="dNo"/>
                	<c:if test="${dDTO.dAccpet eq '0' }"><h2 style="color:red; margin-left: 20px;">가입승인 대기중입니다. 관리자 승인을 기다려 주세요.</h2></c:if>
                    <label for="inputId" class="col-lg-2 control-label">아이디 *수정불가</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyAlphabetAndNumber" name="dId" id="id" data-rule-required="true" readonly value="${sessionScope.dId}"maxlength="30"><br/>
                    </div>
                    <div class="check-font" id="id_check">
                    	&nbsp;&nbsp;
                    	<input type="button" class="btn btn-primary" value="비밀번호 변경하기" id="cPwCheckBtn" name="cPwCheckBtn" />
                    	<div id="pwUpdate" class="pw_font">
                    		기존 비밀번호 입력 <br/>
                    		<input type="password" placeholder="기존 비밀번호 입력" id="dPw" name="dPw" /> <br/>
                    		새로운 비밀번호 입력 <br/>
                    		<input type="password" placeholder="새로운 비밀번호 입력" id="dPwUpdate" name="dPwUpdate" /> <br/>
                    		새로운 비밀번호 확인 <br/>
                    		<input type="password" placeholder="비밀번호 확인" id="dPwCheck" name="dPwCheck" /> <br/>
                    		<div id="temp" class="temp"></div> <br/>
                    		<input type="button" value="비밀번호 변경" class="btn btn-primary" id="dPwUpdateBtn" name="dPwUpdateBtn" />
                    	</div>
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">음식점 이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" name="dName" id="name" data-rule-required="true" value="${dDTO.dName }"  />
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">음식점 주소</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" name="dAddress" id="name" data-rule-required="true" value="${dDTO.dAddress}"  />
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">음식점 전화번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="dPhone" data-rule-required="true" value="${dDTO.dPhone }" placeholder="숫자만 입력 가능합니다." maxlength="11">
                    </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">음식점 좌석수</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="dSeat" data-rule-required="true" value="${dDTO.dSeat }" placeholder="숫자만 입력 가능합니다." maxlength="5">
                    </div>
                </div>
                
				<div>
					<label for="inputPhoneNumber" class="col-lg-2 control-label">음식점 시작 시간</label>
					<div>
						<input id="dStart" name="dStart" type="text" placeholder="00:00"  maxlength="5" class="form-control" value="${dDTO.dStart }" />
					</div>
				</div>	
				<div>
					<label for="inputPhoneNumber" class="col-lg-2 control-label">음식점 마감 시간</label>
					<div>
						<input id="dEnd" name="dEnd" type="text" placeholder="00:00"  maxlength="5" class="form-control" value="${dDTO.dEnd }" />
					</div>
				</div>
				<script type="text/javascript">
				$(function(){
					
					$('#dStart').keyup(function(){
						if($('#dStart').val().length==2){
							if(($('#dStart').val()>24)){
								alert('잘못된 입력입니다.');
								$('#dStart').val('');
							}else{
								$('#dStart').val($('#dStart').val()+":");								
							}
						}
					});
					
					$('#dEnd').keyup(function(){
						if($('#dEnd').val().length==2){
							if(($('#dEnd').val()>24)){
								alert('잘못된 입력입니다.');
								$('#dEnd').val('');
							}else{
								$('#dEnd').val($('#dEnd').val()+":");								
							}
						}
					});
					
				});
				</script>	                
				                
                <div>
                	<label for="#" class="col-lg-2 control-label">음식점 종류</label>
                	<div>
                		<input type="text" id="dType" name="dType" placeholder="일식/양식/한식" class="form-control" value="${dDTO.dType }"/>
                	</div>
                </div>
                
                <div class="form-group" id="divPhoto">
                	<label for="inputPhoto" class="col-lg-2 control-label">프로필 사진</label><br/> &nbsp;&nbsp;&nbsp;
                	<div id="photoBox" style="width:50; height:50;">
                		<input type="file" id="dPhoto" name="dPhoto" onchange="fileCheck(this)" accept="image/jpeg,image/png,image/jpg" multiple="multiple" value="${dDTP.dPhoto }" /> 
                	</div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">사업자 번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="dSaup_no" data-rule-required="true" value="${sessionScope.dSaup_no }" readonly="readonly" maxlength="11">
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">주차 여부</label>
                    <div class="col-lg-10">
                        <select class="form-control" id="gender" name="dParking">
                        	<c:if test="${dDTO.dParking eq '1' }">
                            <option value="1" selected>가능</option>
                            <option value="2">불가</option>
                        	</c:if>
                        	<c:if test="${dDTO.dParking eq '2' }">
                        	<option value="1">가능</option>
                            <option value="2" selected>불가</option>
                        	</c:if>
                        	<c:if test="${dDTO.dParking eq null }">
                        	<option value="1" selected>가능</option>
                            <option value="2">불가</option>
                        	</c:if>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                    	<c:if test="${dDTO.dNo eq null }">
	                    	<input type="button" value="승인 요청하기." class="btn btn-primary" onclick="fn_multiUpload(this.form)" />
                    	</c:if>
                    	<c:if test="${dDTO.dNo ne null }">
	                    	<input type="button" value="정보 수정하기." class="btn btn-primary" onclick="fn_multiUpload(this.form)" />
                    	</c:if>
                        <input type="button" value="돌아가기" class="btn btn-primary" onclick="index" />
                        <input type="button" value="회원탈퇴" class="btn btn-primary" onclick="index" />
                    </div>
                </div>
            </form>
        
        
        <script>
        	
        $(function(){
            //모달을 전역변수로 선언
            var modalContents = $(".modal-contents");
            var modal = $("#defaultModal");
            
            $('.onlyAlphabetAndNumber').keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                }
            });
            
            $(".onlyHangul").keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                }
            });
        
            $(".onlyNumber").keyup(function(event){
                if (!(event.keyCode >=37 && event.keyCode<=40)) {
                    var inputVal = $(this).val();
                    $(this).val(inputVal.replace(/[^0-9]/gi,''));
                }
            });
            
            //------- 검사하여 상태를 class에 적용
            $('#id').keyup(function(event){
                
                var divId = $('#divId');
                
                if($('#id').val()==""){
                    divId.removeClass("has-success");
                    divId.addClass("has-error");
                }else{
                    divId.removeClass("has-error");
                    divId.addClass("has-success");
                }
            });
            
            $('#password').keyup(function(event){
                
                var divPassword = $('#divPassword');
                
                if($('#password').val()==""){
                    divPassword.removeClass("has-success");
                    divPassword.addClass("has-error");
                }else{
                    divPassword.removeClass("has-error");
                    divPassword.addClass("has-success");
                }
            });
            
            $('#passwordCheck').keyup(function(event){
                
                var passwordCheck = $('#passwordCheck').val();
                var password = $('#password').val();
                var divPasswordCheck = $('#divPasswordCheck');
                
                if((passwordCheck=="") || (password!=passwordCheck)){
                    divPasswordCheck.removeClass("has-success");
                    divPasswordCheck.addClass("has-error");
                }else{
                    divPasswordCheck.removeClass("has-error");
                    divPasswordCheck.addClass("has-success");
                }
            });
            
            $('#name').keyup(function(event){
                
                var divName = $('#divName');
                
                if($.trim($('#name').val())==""){
                    divName.removeClass("has-success");
                    divName.addClass("has-error");
                }else{
                    divName.removeClass("has-error");
                    divName.addClass("has-success");
                }
            });
            
            $('#nickname').keyup(function(event){
                
                var divNickname = $('#divNickname');
                
                if($.trim($('#nickname').val())==""){
                    divNickname.removeClass("has-success");
                    divNickname.addClass("has-error");
                }else{
                    divNickname.removeClass("has-error");
                    divNickname.addClass("has-success");
                }
            });
            
            $('#email').keyup(function(event){
                
                var divEmail = $('#divEmail');
                
                if($.trim($('#email').val())==""){
                    divEmail.removeClass("has-success");
                    divEmail.addClass("has-error");
                }else{
                    divEmail.removeClass("has-error");
                    divEmail.addClass("has-success");
                }
            });
            
            $('#phoneNumber').keyup(function(event){
                
                var divPhoneNumber = $('#divPhoneNumber');
                
                if($.trim($('#phoneNumber').val())==""){
                    divPhoneNumber.removeClass("has-success");
                    divPhoneNumber.addClass("has-error");
                }else{
                    divPhoneNumber.removeClass("has-error");
                    divPhoneNumber.addClass("has-success");
                }
            });
            
            
            //------- validation 검사
            $( "form" ).submit(function( event ) {
                
                var provision = $('#provision');
                var memberInfo = $('#memberInfo');
                var divId = $('#divId');
                var divPassword = $('#divPassword');
                var divPasswordCheck = $('#divPasswordCheck');
                var divName = $('#divName');
                var divNickname = $('#divNickname');
                var divEmail = $('#divEmail');
                var divPhoneNumber = $('#divPhoneNumber');
                
                //회원가입약관
                if($('#provisionYn:checked').val()=="N"){
                    modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
                    modal.modal('show'); //모달 띄우기
                    
                    provision.removeClass("has-success");
                    provision.addClass("has-error");
                    $('#provisionYn').focus();
                    return false;
                }else{
                    provision.removeClass("has-error");
                    provision.addClass("has-success");
                }
                
                //개인정보취급방침
                if($('#memberInfoYn:checked').val()=="N"){
                    modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    memberInfo.removeClass("has-success");
                    memberInfo.addClass("has-error");
                    $('#memberInfoYn').focus();
                    return false;
                }else{
                    memberInfo.removeClass("has-error");
                    memberInfo.addClass("has-success");
                }
                
                //아이디 검사
                if($('#id').val()==""){
                    modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divId.removeClass("has-success");
                    divId.addClass("has-error");
                    $('#id').focus();
                    return false;
                }else{
                    divId.removeClass("has-error");
                    divId.addClass("has-success");
                }
                
                //패스워드 검사
                if($('#password').val()==""){
                    modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divPassword.removeClass("has-success");
                    divPassword.addClass("has-error");
                    $('#password').focus();
                    return false;
                }else{
                    divPassword.removeClass("has-error");
                    divPassword.addClass("has-success");
                }
                
                //패스워드 확인
                if($('#passwordCheck').val()==""){
                    modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divPasswordCheck.removeClass("has-success");
                    divPasswordCheck.addClass("has-error");
                    $('#passwordCheck').focus();
                    return false;
                }else{
                    divPasswordCheck.removeClass("has-error");
                    divPasswordCheck.addClass("has-success");
                }
                
                //패스워드 비교
                if($('#password').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                    modalContents.text("패스워드가 일치하지 않습니다.");
                    modal.modal('show');
                    
                    divPasswordCheck.removeClass("has-success");
                    divPasswordCheck.addClass("has-error");
                    $('#passwordCheck').focus();
                    return false;
                }else{
                    divPasswordCheck.removeClass("has-error");
                    divPasswordCheck.addClass("has-success");
                }
                
                //이름
                if($('#name').val()==""){
                    modalContents.text("이름을 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divName.removeClass("has-success");
                    divName.addClass("has-error");
                    $('#name').focus();
                    return false;
                }else{
                    divName.removeClass("has-error");
                    divName.addClass("has-success");
                }
                
                //별명
                if($('#nickname').val()==""){
                    modalContents.text("별명을 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divNickname.removeClass("has-success");
                    divNickname.addClass("has-error");
                    $('#nickname').focus();
                    return false;
                }else{
                    divNickname.removeClass("has-error");
                    divNickname.addClass("has-success");
                }
                
                //이메일
                if($('#email').val()==""){
                    modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divEmail.removeClass("has-success");
                    divEmail.addClass("has-error");
                    $('#email').focus();
                    return false;
                }else{
                    divEmail.removeClass("has-error");
                    divEmail.addClass("has-success");
                }
                
                //휴대폰 번호
                if($('#phoneNumber').val()==""){
                    modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                    modal.modal('show');
                    
                    divPhoneNumber.removeClass("has-success");
                    divPhoneNumber.addClass("has-error");
                    $('#phoneNumber').focus();
                    return false;
                }else{
                    divPhoneNumber.removeClass("has-error");
                    divPhoneNumber.addClass("has-success");
                }
                
            	
                var filesToUpload = document.getElementById('cPhoto').files;
                var file = filesToUpload[0];

                // 문서내에 img 객체를 생성합니다
                var img = document.createElement("img");
                // 파일을 읽을 수 있는 File Reader 를 생성합니다
                var reader = new FileReader();

                // 파일이 읽혀지면 아래 함수가 실행됩니다
                reader.onload = function(e) {
                img.src = e.target.result;

                 

                // HTML5 canvas 객체를 생성합니다
                var canvas = document.createElement("canvas");      
                var ctx = canvas.getContext("2d");

	            // 캔버스에 업로드된 이미지를 그려줍니다
                ctx.drawImage(img, 0, 0);

                // 최대폭을 400 으로 정했다고 가정했을때
                // 최대폭을 넘어가는 경우 canvas 크기를 변경해 줍니다.
                        var MAX_WIDTH = 120;
                        var MAX_HEIGHT = 120;
                        var width = img.width;
                        var height = img.height;

                        if (width > height) {
                            if (width > MAX_WIDTH) {
                                height *= MAX_WIDTH / width;
                                width = MAX_WIDTH;
                            }
                        } else {
                            if (height > MAX_HEIGHT) {
                                width *= MAX_HEIGHT / height;
                                height = MAX_HEIGHT;
                            }
                        }
                        canvas.width = width;
                        canvas.height = height;
                        // canvas에 변경된 크기의 이미지를 다시 그려줍니다.
                        var ctx = canvas.getContext("2d");
                        ctx.drawImage(img, 0, 0, width, height);
              			// canvas 에 있는 이미지를 img 태그로 넣어줍니다
                        var dataurl = canvas.toDataURL("image/png");
                        document.getElementById('output').src = dataurl;
                    }
                reader.readAsDataURL(file);

                
            });
            
        });
           
            
            
        </script>
                <!--// 본문 들어가는 부분 -->
            <hr/>
            <!-- 푸터 들어가는 부분 -->
            
            <div>
                <p class="text-center">
                    <small><strong>업체명</strong></small><br>
                    <small>대표 : 홍길동 ㆍ 주소 :  사거리 ㆍ 사업자등록번호:123-12-12345 ㆍ 전화 : 02-123-1234</small><br>
                    <small>Copyrightⓒ test.com All rights reserved.</small>
                </p>
            </div>
            <!--// 푸터 들어가는 부분 -->
        </div>
    </body>
</html>