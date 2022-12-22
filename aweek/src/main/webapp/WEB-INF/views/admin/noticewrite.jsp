<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		var del_list = confirm ("공지사항을 등록하시겠습니까?")
		
		if( del_list == true ) {
			alert("등록하셨습니다.")
			$("form").submit();
		} else if( del_list == false ) {
			return false;
		}
	})
	
	$("#btnCancel").click(function() {
		var can_list = confirm("공지사항 작성을 취소하시겠습니까?")
		
		if( can_list == true ) {
			alert("취소하셨습니다.")
			$(location).attr('href', '/admin/noticelist')
		} else if( can_list == false ) {
			return;			
		}
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

<h1>공지사항 작성</h1>
<hr>

<div class="container">

<form action="./noticewrite" method="post" enctype="multipart/form-data">

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
			<input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${ updateNotice.noticeTitle }">
		</td>
	</tr>
	
	<tr>
		<td>본문</td>
		<td>
			<textarea rows="10" style="width: 500px;" id="noticeContent" name="noticeContent" class="form-control">${ updateNotice.noticeContent }</textarea>
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
		<button class="btnWrite" id="btnWrite">작성</button>
		<input type="reset" id="btnCancel" class="btnCancel" value="취소">
	</div>

</form>

</div>

</body>
</html>