<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		var upd_list = confirm ("Q&A를 수정하시겠습니까?")
		
		if( upd_list == true ) {
			$("form").submit();
		} else if( upd_list == false ) {
			return false;
		}
	})

	$("#btnCancel").click(function() {
		var can_list = confirm("Q&A 수정을 취소하시겠습니까?")
		
		if( can_list == true) {
			location.href = "/admin/qnalist"
		} else if( can_list == false ) {
			return false;
		}
	})
})

</script>

<style type="text/css">

table {
	margin: 0 auto;
}

th, td {
	padding: 10px;
}

th {
	text-align: center;
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

<h1>자주 묻는 질문 수정</h1>
<hr>

<div class="container">
	<form action="./qnamodify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qnaNo" value="${ qnA.qnaNo }">
		<table>
			<tr>
				<th>제목</th>
				<td class="form-group">
					<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${ modifyQnA.qnaTitle }">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="form-group">
					<textarea rows="10" id="qnaContent" name="qnaContent" class="form-control" style="width: 500px;">${ modifyQnA.qnaContent }</textarea>
				</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td class="form-group">
					<input type="number" id="qnaCategoryNo" name="qnaCategoryNo" class="form-control" style="width:100px;" value="${ modifyQnA.qnaCategoryNo }">
				</td>
			</tr>
		</table>
	
		<div class="text-center">
			<button id="btnUpdate" class="btnUpdate">수정</button>
			<button id="btnCancel" class="btnCancel">취소</button>
		</div>
	</form>
</div>

</body>
</html>