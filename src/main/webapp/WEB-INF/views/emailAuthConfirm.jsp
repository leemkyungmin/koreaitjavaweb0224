<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<script type="text/javascript">

	function fn_emailAuthConfirm(f){
		//인증 코드는 ${authkey}
		//사용자 인증값 f.authkey.value
		var authkey='${authkey}';
		if(authkey!=f.authkey.value){
			alert('잘못된 인증코드입니다.');
			return;
		}else{
			alert('인증되었습니다. 서비스페이지로 이동합니다.');			
			location.href='imageBoardListPage';
		}
		
		
	}

</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form >
		
		여기에 인증 코드를 입력하세요 
		<input type="text" name="authkey">
		<input type="button" value="인증하기" onclick="fn_emailAuthConfirm(this.form)">
		
	</form>

</body>
</html>