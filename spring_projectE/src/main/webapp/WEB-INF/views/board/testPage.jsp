<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script> -->
<script type="text/javascript">

	function fn_review(){
		 $('#myModal .modal-body').load("reviewWritePage?&dSaup_no=11111111111&cNo="+1);
		 $('#myModal').modal('show');
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
				 	<div class="modal-header" data-backdrop="static">
				    	<button type="button" class="close"  data-dismiss="modal" aria-hidden="true">X</button>
				    	<!-- data-dismiss="modal" -->
				    	<h3 id="myModalLabel" data-backdrop="static">모달 제목</h3>
				  	</div>
				  <div class="modal-body" data-backdrop="static">
				    
				  </div>
				  
				  <div class="modal_layer" data-backdrop="static"></div>
				</div>
	
</body>
</html>