<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		
		$(location).attr('href', '/admin/qnalist')
	})
})

</script>

</head>
<body>

<h1>Q&A작성</h1>
<hr>

<div class="container">

<form action="./noticewrite" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="adminId">작성자</label>
		<input type="text" id="adminId" name="adminId" value="${ adminId }" class="form-control">
	</div>
	
	<div class="form-group">
		<label for="qnaTitle">제목</label>
		<input type="text" id="qnaTitle" name="qnaTitle" class="form-control">
	</div>
	
	<div class="form-group">
		<label for="qnaContent">본문</label>
		<textarea rows="10" style="width: 4%;" id="qnaContent" name="qnaContent" class="form-control"></textarea>
	</div>
	
	<div class="form-group">
		<label for="file">첨부파일</label>
		<input type="file" id="file" name="file">
	</div>
	
	<div class="text-center">
		<button id="btnWrite" class="btnWrite">작성</button>
		<input type="reset" id="btnCancel" class="btnCancel" value="취소">
	</div>
</form>

</div><!-- .container end -->

</body>
</html>