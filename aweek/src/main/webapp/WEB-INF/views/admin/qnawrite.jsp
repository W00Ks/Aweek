<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="./layout/adminheader.jsp" />

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

<style type="text/css">

table {
	margin: 0 auto;
}


td {
	padding: 5px;
}

textarea {
	resize: none;
}

</style>

</head>
<body>

<h1>자주묻는질문 작성</h1>
<hr>

<div class="container">

<form action="./qnawrite" method="post" enctype="multipart/form-data">

<table>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" id="writerId" name="writerId" class="form-control" value="${ writerId }">
		</td>
	</tr>
	
	<tr>
		<td>닉네임</td>
		<td>
			<input type="text" id="writerNick" name="writerNick" class="form-control" value="${ writerNick }">
		</td>
	</tr>

	<tr>
		<td>제목</td>
		<td>
			<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${ updateQna.qnaTitle }">
		</td>
	</tr>	

	<tr>	
		<td>본문</td>
		<td>
			<textarea rows="10" style="width: 500px;" id="qnaContent" name="qnaContent" class="form-control">${ updateQna.qnaContent }</textarea>
		</td>
	</tr>	

	<tr>
		<td>첨부파일</td>
		<td>
			<input type="file" id="file" name="file">
		</td>
	</tr>
</table>

	<div class="text-center" style="padding: 50px;">
		<button id="btnWrite" class="btnWrite">작성</button>
		<input type="reset" id="btnCancel" class="btnCancel" value="취소">
	</div>

</form>

</div>

</body>
</html>