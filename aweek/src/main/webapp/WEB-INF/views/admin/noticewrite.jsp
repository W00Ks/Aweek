<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		
		$(location).attr('href', '/admin/noticelist')
	})
})

</script>

</head>
<body>

<h1>공지사항 작성</h1>
<hr>

<div class="container">

<form action="./noticewrite" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="writerId">작성자</label>
		<input type="text" id="adminNo" name="adminId" class="form-control" value="${ adminNo }">
	</div>
	
	<div class="form-group">
		<label for="noticeTitle">제목</label>
		<input type="text" id="noticeTitle" name="noticeTitle" class="form-control">
	</div>
	
	<div class="form-group">
		<label for="noticeContent">본문</label>
		<textarea rows="10" style="width: 40%;" id="noticeContent" name="noticeContent" class="form-control"></textarea>
	</div>
	
	<div class="form-group">
		<label for="file">첨부파일</label>
		<input type="file" id="file" name="file">
	</div>
	
	<div class="text-center">
		<button class="btn btn-primary" id="btnWrite">작성</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소">
	</div>
</form>

</div><!-- .container end -->

</body>
</html>