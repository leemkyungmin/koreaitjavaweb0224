<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	opener.parent.userEmail();

</script>
</head>
<body>
	
	<form action="emailAuth">
	
		서비스 이용을 위해 이메일 인증을 진행합니다.<br/>
		이메일 입력 <input type="text" name="email" id="email" value="${userEmail }" />
		<input type="submit" value="인증요청" />
	
	</form>
	
</body>
</html>