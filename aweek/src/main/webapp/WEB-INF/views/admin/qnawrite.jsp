<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		var wri_list = confirm ("자주 묻는 질문을 등록하시겠습니까?")
		
		if( wri_list == true ) {
			$("form").submit();
		} else if( wri_list == false ) {
			return false;
		}
	})
	
	$("#btnCancel").click(function() {
		var can_list = confirm("자주 묻는 질문 작성을 취소하시겠습니까?")
		
		if( can_list == true ) {
			$(location).attr('href', '/admin/qnalist')
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

<h1>자주 묻는 질문 작성</h1>
<hr>

<div class="container">
	<form action="./qnawrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목</td>
				<td class="form-group">
					<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${ updateQna.qnaTitle }">
				</td>
			</tr>	
			<tr>	
				<td>본문</td>
				<td class="form-group">
					<textarea rows="10" id="qnaContent" name="qnaContent" class="form-control" style="width: 500px;">${ updateQna.qnaContent }</textarea>
				</td>
			</tr>	
			<tr>
				<td>카테고리</td>
				<td class="form-group">
					<input type="number" id="qnaCategoryNo" name="qnaCategoryNo" class="form-control" style="width:100px;" value="${ updateQna.qnaCategoryNo }">
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