<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function fn_singleUpload(f){
		f.action='singleUpload';
		f.submit();
	}
	function fn_multiUpload(f){
		f.action='multiUpload';
		f.submit();
	}

</script>


</head>
<body>
	
	<!-- 
		파일 업로드를 하려면 반드시 아래와 같이 한다.
		<form method="post" enctype="multipart/fom-data">
	 -->

	<form method="post" enctype="multipart/form-data"><br/>
		작성자:<input type="text" name="iWriter"><br/>
		제목:<input type="text" name="iTitle"><br/>
		<textarea name="iContent" rows="5" cols="50" placeholder="내용"></textarea><br/>
		첨부파일 <input type="file" name="files" multiple="multiple"><br/>
		
		<br/>
		
		<input type="button" value="업로드" onclick="fn_singleUpload(this.form)">
		<input type="button" value="다중 업로드" onclick="fn_multiUpload(this.form)">
	</form>
</body> 
</html>