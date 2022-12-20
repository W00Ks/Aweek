<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		var upd_list = confirm ("수정하시겠습니까?")
		
		if( upd_list == true ) {
			alert("수정하셨습니다")
			$("form").submit();
		} else if( upd_list == false ) {
			return false;
		}
	})
	
	$("#btnCancel").click(function() {
		location.href = "/admin/qnalist"
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

<form action="./qnamodify" method="post" enctype="multipart/form-data">
	<input type="hidden" name="qnaNo" value="${ qnA.qnaNo }">
	
	<label for="writerId">작성자</label>
	<div class="form-group">
		<input type="text" id="writerId" name="writerId" class="form-control" value="${ writerId }">
	</div>
	
	<label for="qnaTitle">제목</label>
	<div class="form-group">
		<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${ modifyQnA.qnaTitle }">
	</div>
	
	<label for="noticeContent">본문</label>
	<div class="form-group">
		<textarea rows="10" style="width: 40%;" id="qnaContent" name="qnaContent" class="form-control">${ modifyQnA.qnaContent }</textarea>
	</div>

	<div class="form-group">
		<div id="originFile">
			<a href="/admin/download?fileNo=${ csFile.fileNo }">${ csFile.originName }</a>
			<span id="deleteFile">X</span>
		</div>
	
		<div id="newFile">
			<label for="file">새로운 첨부파일</label>
			<input type="file" id="file" name="file">
		</div>
	</div>

	<div class="text-center">
		<button id="btnUpdate" class="btnUpdate">수정</button>
		<input type="reset" id="btnCancel" class="btnCancel" value="취소">
	</div>
</form>

</div>

</body>
</html>