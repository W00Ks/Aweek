<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnList").click(function() {
		location.href = "/admin/qnalist"
	})
		
	$("#btnUpdate").click(function() {
		location.href = "/admin/qnamodify?qnaNo=${ viewQna.qnaNo }"
	})
	
	$("#btnDelete").click(function() {
		var del_list = confirm ("삭제하시겠습니까?")
		
		if( del_list == true ) {
			alert("삭제하셨습니다")
			location.href = "/admin/qnadelete?qnaNo=${ viewQna.qnaNo }"
		} else if( del_list == false ) {
			return;
		}
	})
})

</script>

</head>
<body>

<h1>자주묻는질문 상세보기</h1>
<hr>

<table>
	<tr>
		<td>글번호</td>
		<td>${ viewQna.qnaNo }</td>
	</tr>
	
	<tr>
		<td>아이디</td>
		<td>${ viewQna.writerId }</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td>${ viewQna.qnaTitle }</td>
	</tr>
	
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate value="${ viewQna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	
	<tr>
		<td>본문</td>
		<td>${ viewQna.qnaContent }</td>
	</tr>
	
	<tr>
		<td>
			<button id="btnUpdate" class="btnUpdate">수정</button>
			<button id="btnDelete" class="btnDelete">삭제</button>
			<button id="btnList" class="btnList">목록</button>
		</td>
	</tr>
</table>

</body>
</html>