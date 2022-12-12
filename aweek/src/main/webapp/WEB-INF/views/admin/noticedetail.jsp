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
		location.href = "/admin/noticelist"
	})
		
	$("#btnUpdate").click(function() {
		location.href = "/admin/noticemodify"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/admin/noticedelete?noticeNo=${ viewNotice.noticeNo }"
	})
})

</script>

</head>
<body>

<h1>공지사항 상세보기</h1>
<hr>

<table>
	<tr>
		<td>글번호</td>
		<td>${ viewNotice.noticeNo }</td>
	</tr>
	
	<tr>
		<td>아이디</td>
		<td>${ viewNotice.adminNo }</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td>${ viewNotice.noticeTitle }</td>
	</tr>
	
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate value="${ viewNotice.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	
	<tr>
		<td>본문</td>
		<td>${ viewNotice.noticeContent }</td>
	</tr>
	
	<tr>
		<td>조회수</td>
		<td>${ viewNotice.noticeHit }</td>
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