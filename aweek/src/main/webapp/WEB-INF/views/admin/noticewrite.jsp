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
	
	$("#btnCancel").click(function() {
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
	<label for="writerId">아이디</label>
	<div class="form-group">
		<input type="text" id="writerId" name="writerId" class="form-control" value="${ writerId }">
	</div>

	<label for="writerNick">닉네임</label>
	<div class="form-group">
		<input type="text" id="writerNick" name="writerNick" class="form-control" value="${ writerNick }">
	</div>
	
	<label for="noticeTitle">제목</label>
	<div class="form-group">
		<input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${ updateNotice.noticeTitle }">
	</div>
	
	<label for="noticeContent">본문</label>
	<div class="form-group">
		<textarea rows="10" style="width: 40%;" id="noticeContent" name="noticeContent" class="form-control">${ updateNotice.noticeContent }</textarea>
	</div>
	
	<label for="file">첨부파일</label>
	<div class="form-group">
		<input type="file" id="file" name="file">
	</div>
	
	<div class="text-center">
		<button class="btnWrite" id="btnWrite">작성</button>
		<input type="reset" id="btnCancel" class="btn" value="취소">
	</div>
</form>

</div><!-- .container end -->

</body>
</html>