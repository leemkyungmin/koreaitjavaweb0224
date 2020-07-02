<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="resources/assets/styles/style.css">


</head>
<body>
	<table border=1>
	
		<thead>
			<tr>
				<td>번호</td>
				<td>이미지</td>
				<td>작성자</td>
				<td>제목</td>
				<td>내용</td>
				<td>작성일자</td>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="6">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="idto" items="${list }">
					<tr>
						<td>${idto.iNo }</td>
						<td>${idto.iWriter }</td>
						<td><a href="download?iFilename=${idto.iFilename }"><img alt="${idto.iFilename }" src="${pageContext.request.contextPath }/resources/storage/${idto.iFilename }"></a></td>
						<td>${idto.iTitle }</td>
						<td>${idto.iContent }</td>
						<td>${idto.iRegdate }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="6">
					<a href="UploadPage">새글 작성하기</a>
				</td>
			</tr>
		</tfoot>
		
	</table>

</body>
</html>