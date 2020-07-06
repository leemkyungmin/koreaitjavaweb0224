<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Page</title>
</head>
<body>
	<h1>리뷰 삽입 테스트 파일</h1> <br/>
	${dSaup_no },${cNo }
	<div class="wrap">
		<form action="Simpleinsert" method="post">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="bWriter" autofocus></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="bTitle" ></td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="bContent" rows="10" cols="50"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성하기">
						<input type="reset" value="다시 작성">
						<button type="button" data-dismiss="modal">닫기</button>
					</td>
				</tr>
			</table>
		
		</form>
	</div>

</body>
</html>