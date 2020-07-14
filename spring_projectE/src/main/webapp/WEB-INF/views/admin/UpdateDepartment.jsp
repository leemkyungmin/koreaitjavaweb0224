<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function goBack() {
		window.history.back();
	}
</script>
<style type="text/css">
	table {
		border: 1px solid;
		border-collapse: collapse;	
	}
	tr, td {
		border: 1px solid;
	}
	table {
		margin: 0 auto;
	}	
</style>
</head>
<body>

	<input style="display: block; width:80px; margin: 0 auto;" type="button" class="btn_list" value="리스트 보기" onclick="goBack()"/>
	<br/><br/>
	
	
	<table border="1">
		
		<tr>
			<td>사업자 등록번호</td>
			<td>${dDTO.dSaup_no }</td>
		</tr>
		<tr>
			<td>사업체명</td>
			<td>${dDTO.dName}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${dDTO.dPhone }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${dDTO.dAddress }</td>
		</tr>
		<tr>
			<td>별점</td>
			<td>${dDTO.dRating }</td>
		</tr>
		<tr>
			<td>오픈날짜</td>
			<td>${dDTO.dReg_date }</td>
		</tr>
	</table>
	<br/>
	<input style="display: block; width:100px; margin: 0 auto;" type="button" value="수정완료" onclick="" /> 

</body>
</html>