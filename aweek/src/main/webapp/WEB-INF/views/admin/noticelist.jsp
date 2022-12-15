<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		location.href = "/admin/noticewrite"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/admin/noticemodify"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/admin/noticedelete?noticeNo=${ viewNotice.noticeNo }"
	})
	
	$("#btnOld").click(function() {
	
	})

	$("#btnNew").click(function() {

	})
	
	$("#btnTitle").click(function() {
	
	})
})

</script>

<style type="text/css">

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

th {
    border: 1px solid #ccc;
    border-collapse: collapse;
   	text-align: center;
   	width: 200px;
   	background: #43c446;
   	padding: 5px;
   	font-size: 15px;
   	font-weight: 400;
}

.list {
	width: 300px;
    margin: 0 auto;
    border: 1px solid;
    margin-top: 30px;
    border-radius: 2.1em;
    margin-bottom: 50px;
}

.noticeWrite {
    width: 500px;
    margin: 0 auto;
    float: right;
}

</style>

<c:if test="${ not empty adminLogin }">

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">공지사항</h1>
</div>

<div>
	<a class="btnOld" class="totallist">오래된 순</a>
	<a class="btnNew" class="totallist">최신 순</a>
	<a class="btnTitle" class="totallist">제목 순</a>
</div>

<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 200px;">제목</th>
			<th style="width: 100px;">아이디</th>
			<th style="width: 100px;">닉네임</th>
			<th style="width: 200px;">날짜</th>
			<th style="width: 100px;">내용</th>
			<th style="width: 150px;">조회수</th>
			<!-- <th style="width: 150px;">수정 및 삭제</th> -->
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ noticelist }" var="notice">
		<tr>
			<td>${ notice.noticeNo }</td>
			<td><a href="/admin/noticedetail?noticeNo=${ notice.noticeNo }">${ notice.noticeTitle }</a></td>
			<td>${ notice.writerId }</td>
			<td>${ notice.writerNick }</td>
			<td><fmt:formatDate value="${ notice.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td>${ notice.noticeContent }</td>
			<td>${ notice.noticeHit }</td>
			
			<!--
			<td>
				<button id="btnUpdate" class="btnUpdate">수정</button>
				<button id="btnDelete" class="btnDelete">삭제</button>
			</td>
			-->
		</tr>
	</c:forEach>
	</tbody>
</table>

<hr>

<div class="noticeWrite">
	<button id="btnWrite" class="">글쓰기</button>
</div>

<c:import url="/WEB-INF/views/admin/layout/noticepaging.jsp" />

</c:if>