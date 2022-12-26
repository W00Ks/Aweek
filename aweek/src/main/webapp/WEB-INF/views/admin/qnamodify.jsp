<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnUpdate").click(function() {
		var upd_list = confirm ("Q&A를 수정하시겠습니까?")
		
		if( upd_list == true ) {
			alert("수정하셨습니다.")
			$("form").submit();
		} else if( upd_list == false ) {
			return false;
		}
	})
	
	if( ${ empty csFile} ) {
		$("#newFile").show()
	} else {
		$("#originFile").show()
	}
	
	$("#deleteFile").click(function() {
		$("#newFile").toggle()
		$("#originFile").toggleClass("through")
	})
	
	$("#btnCancel").click(function() {
		var can_list = confirm("Q&A 수정을 취소하시겠습니까?")
		
		if( can_list == true) {
			alert("취소하셨습니다.")
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

#originFile, #newFile {
	display: none;
}

.through {
	text-decoration: line-through;
}

#deleteFile {
	font-weight: bold;
	color: red;
	cursor: pointer;
}

.text-center {
	margin-top: 50px;
}

</style>

</head>
<body>

<h1>글수정</h1>
<hr>

<div class="container">
	<form action="./qnamodify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="qnaNo" value="${ qnA.qnaNo }">
		<table>
			<tr>
				<th>아이디</th>
				<td class="form-group">
					<input type="text" id="writerId" name="writerId" class="form-control" value="${ modifyQnA.writerId }">
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td class="form-group">
					<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${ modifyQnA.qnaTitle }">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td class="form-group">
					<textarea rows="10" style="width: 500px;" id="qnaContent" name="qnaContent" class="form-control">${ modifyQnA.qnaContent }</textarea>
				</td>
			</tr>
		</table>
	
		<div class="text-center">
			<button id="btnUpdate" class="btnUpdate">수정</button>
			<input type="reset" id="btnCancel" class="btnCancel" value="취소">
		</div>
	</form>
</div>

</body>
</html>