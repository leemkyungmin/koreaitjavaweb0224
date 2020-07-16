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
			
			var x = document.getElementById("dPhoto");
			if ('files' in x) {
				if (x.files.length > 5){
					alert("사진은 최대 5장입니다.");
					document.getElementById("dPhoto").value = "";
					return false;
				}
			}
			
			
			if ($('#dName').val() == '') {
				alert('업체명을 입력하세요.');
				$('#dName').focus();
				return false;
			} else if($('#dAddress').val() == ''){
				alert('주소를 입력하세요.');
				$('#dAddress').focus();
				return false;
			} else if ($('#dSeat').val() == '') {
				alert('음식점 좌석수를 입력하세요.');
				$('#dSeat').focus();
				return false;
			} else if ($('#dPhone').val() == '') {
				alert('전화번호를 입력하세요.');
				$('#dPhone').focus();
				return false;
			} else if ($('#dStart').val() == '') {
				alert('영업 시작시간을 입력하세요.');
				$('#dStart').focus();
				return false;
			} else if ($('#dEnd').val() == '') {
				alert('영업 종료시간을 입력하세요.');
				$('#dEnd').focus();
				return false;
			} else if ($('#dType').val() == '') {
				alert('음식점 종류를 입력하세요.');
				$('#dType').focus();
				return false;
			} else if ($('#dPhoto').val() == ''){
				alert('사진은 최소 '+'한장'+' 최대 다섯장 입니다.');
				return false;
			} else {
				f.action = 'deptUpdate';
				f.submit();
			}
			
			
			
			
		}
		
		function fn_signout(f) {
			
			if ( confirm('정말 탈퇴 하시겠습니까?')){
				f.action = 'deptSignOut';
				f.submit();
			}	
		}
		
	
	</script>

</head>
<body>
        <div class="container"><!-- 좌우측의 공간 확보 -->
            <!-- 헤더 들어가는 부분 -->
            
            <%@ include file="../template/header.jsp" %>
            
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
                <div class="form-group" id="divdName">
                    <label for="inputName" class="col-lg-2 control-label">음식점 이름</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" name="dName" id="dName" data-rule-required="true" value="${dDTO.dName }"  />
                    </div>
                </div>
                <div class="form-group" id="divName">
                    <label for="inputName" class="col-lg-2 control-label">음식점 주소</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" name="dAddress" id="dAddress" data-rule-required="true" value="${dDTO.dAddress}"  />
                    </div>
                </div>
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">음식점 전화번호</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="dPhone" name="dPhone" data-rule-required="true" value="${dDTO.dPhone }" placeholder="숫자만 입력 가능합니다." maxlength="11">
                    </div>
                </div>
                
                <div class="form-group" id="divPhoneNumber">
                    <label for="inputPhoneNumber" class="col-lg-2 control-label">음식점 좌석수</label>
                    <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="dSeat" name="dSeat" data-rule-required="true" value="${dDTO.dSeat }" placeholder="숫자만 입력 가능합니다." maxlength="5">
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
                <br/><br/>
                <div class="form-group" id="divPhoto">
                	<h4>음식점 사진 </h4><h4 style="color:red;">(*최대 5장입니다.)</h4>
                	<div id="photoBox" style="width:50; height:50;">
                		<input type="file" maxlength="5" id="dPhoto" name="dPhoto" onchange="fileCheck(this)" accept="image/jpeg,image/png,image/jpg" multiple="multiple" value="${dDTP.dPhoto }" /> 
                	</div>
                </div>
                <br/><br/>
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
	                    	<input type="button" value="승인 요청하기." class="btn btn-primary" onclick="fn_multiUpload(this.form)"  />
                    	</c:if>
                    	<c:if test="${dDTO.dNo ne null }">
	                    	<input type="button" value="정보 수정하기." class="btn btn-primary" onclick="fn_multiUpload(this.form)" />
                    	</c:if>
                        <input type="button" value="돌아가기" class="btn btn-primary" onclick="index" />
                        <input type="button" value="회원탈퇴" class="btn btn-primary" onclick="fn_signout(this.form)" />
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
            
            
        });
           
            
            
        </script>
                <!--// 본문 들어가는 부분 -->
            <hr/>
        </div>
            <!-- 푸터 들어가는 부분 -->
            <%@ include file="../template/footer.jsp" %>
            <!--// 푸터 들어가는 부분 -->
    </body>
</html>