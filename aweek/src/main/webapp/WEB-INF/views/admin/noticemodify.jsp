<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		
		$("form").submit();
	})
	
	$("#btnCancel").click(function() {
		
		location.href = "/admin/noticelist"
	})
})

</script>

<style type="text/css">

</style>

</head>
<body>

<h1>글수정</h1>
<hr>

<div class="container">

<form action="./noticemodify" method="post" enctype="multipart/form-data">
	<%-- <input type="hidden" id="noticeNo" name="noticeNo" value="${ Notice.noticeNo }"> --%>
	
	<input type="hidden" name="noticeNo" value="${ notice.noticeNo }">
	
	<label for="adminNo">작성자</label>
	<div class="form-group">
		<input type="text" id="adminNo" name="adminNo" class="form-control" value="${ adminNo }">
	</div>
	
	<label for="noticeTitle">제목</label>
	<div class="form-group">
		<input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${ notice.noticeTitle }">
	</div>
	
	<label for="noticeContent">본문</label>
	<div class="form-group">
		<textarea rows="10" style="width: 40%;" id="noticeContent" name="noticeContent" class="form-control">${ notice.noticeContent }</textarea>
	</div>

	<div class="text-center">
		<button id="btnUpdate" class="btnUpdate">수정</button>
		<input type="reset" id="btnCancel" class="btnCancel" value="취소">
	</div>
</form>

</div><!-- .container end -->

</body>
</html>