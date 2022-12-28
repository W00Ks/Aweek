<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		var wri_list = confirm ("공지사항을 등록하시겠습니까?")
		
		if( wri_list == true ) {
			$("form").submit();
		} else if( wri_list == false ) {
			return false;
		}
	})
	
	$("#btnCancel").click(function() {
		var can_list = confirm("공지사항 작성을 취소하시겠습니까?")
		
		if( can_list == true ) {
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

.text-center {
	margin-top: 50px;
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
				<td>제목</td>
				<td class="form-group">
					<input type="text" id="noticeTitle" name="noticeTitle" class="form-control" value="${ updateNotice.noticeTitle }">
				</td>
			</tr>
			<tr>
				<td>본문</td>
				<td class="form-group">
					<textarea rows="10" style="width: 500px;" id="noticeContent" name="noticeContent" class="form-control">${ updateNotice.noticeContent }</textarea>
				</td>
			</tr>
		</table>
	
		<div class="text-center">
			<button id="btnWrite" class="btnWrite">작성</button>
			<button id="btnCancel" class="btnCancel">취소</button>
		</div>
	</form>
</div>

</body>
</html>