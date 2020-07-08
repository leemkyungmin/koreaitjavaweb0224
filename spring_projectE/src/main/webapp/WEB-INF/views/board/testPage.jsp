<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function fn_review(){
		 $('#myModal .modal-body').load("reviewWritePage?&dSaup_no=11111111111&cNo="+1);
		 $('#myModal').modal('toggle');
	}
	
</script>

</head>


<body>
	
	<a href="reviewWritePage?&dSaup_no=11111111111&cNo=1" role="button" class="btn" data-toggle="modal">모달 시연 시작</a>
 	<button class="review_writing_button" onclick="fn_review()">
	                    <i class="fas fa-pen fa-3x"></i>
	                    <p class="review_writing_button_text">리뷰쓰기</p>
	</button>
	
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">모달 제목</h3>
  </div>
  <div class="modal-body">
    <p>한 멋진 본문…</p>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
    <button class="btn btn-primary">변경사항 저장</button>
  </div>
</div>
	
</body>
</html>