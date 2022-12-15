<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문 작성</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		$(location).attr('href', '/admin/qnalist')
	})
})

</script>

</head>
<body>

<h1>자주묻는질문 작성</h1>
<hr>

<div class="container">

<form action="./qnawrite" method="post" enctype="multipart/form-data">
	<label for="writerId">작성자</label>
	<div class="form-group">
		<input type="text" id="writerId" name="writerId" class="form-control" value="${ writerId }">
	</div>

	<label for="writerNick">닉네임</label>
	<div class="form-group">
		<input type="text" id="writerNick" name="writerNick" class="form-control" value="${ writerNick }">
	</div>
	
	<label for="qnaTitle">제목</label>
	<div class="form-group">
		<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${ updateQna.qnaTitle }">
	</div>
	
	<label for="qnaContent">본문</label>
	<div class="form-group">
		<textarea rows="10" style="width: 40%;" id="qnaContent" name="qnaContent" class="form-control">${ updateQna.qnaContent }</textarea>
	</div>
	
	<label for="file">첨부파일</label>
	<div class="form-group">
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