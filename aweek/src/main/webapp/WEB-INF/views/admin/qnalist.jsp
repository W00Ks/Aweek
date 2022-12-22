<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		location.href = "/admin/qnawrite"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "/admin/qnamodify"
	})
	
	$("#btnDelete").click(function() {
		location.href = "/admin/qnadelete?qnaNo=${ qna.qnaNo }"
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

th, td {
	padding: 5px;
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

.qnaWrite {
    margin: 0 auto;
    float: right;
    margin-left: 620px;
}

.pull-right {
    margin: 0 auto;
   	float: left;
}

.maincontent {
	width: 800px;
	margin: 0 auto;
}

</style>

<c:if test="${ not empty adminLogin }">

<div class="maincontent">

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">자주묻는질문</h1>
</div>

<div id="orderlist" style="text-align: right;">
	<button id="oldestList" class="totallist">오래된 순</button>
	<button id="newestList" class="totallist">최신 순</button>
	<button id="titleList" class="totallist">제목 순</button>
</div>

<table id="qnatable" style="margin: 0 auto;">
	<thead>
		<tr id="title">
			<th style="width: 50px;">번호</th>
			<th style="width: 200px;">제목</th>
			<th style="width: 100px;">아이디</th>
			<th style="width: 100px;">닉네임</th>
			<th style="width: 150px;">날짜</th>
			<th style="width: 150px;">내용</th>
			<th style="width: 100px;">카테고리</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ qnalist }" var="qna">
		<tr>
			<td>${ qna.qnaNo }</td>
			<td><a href="/admin/qnadetail?qnaNo=${ qna.qnaNo }">${ qna.qnaTitle }</a></td>
			<td>${ qna.writerId }</td>
			<td>${ qna.writerNick }</td>
			<td><fmt:formatDate value="${ qna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td>${ qna.qnaContent }</td>
			<td>${ qnaCategoryList.qnaCategoryName }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<hr>

<div class="bottomlist">
	<div class="qnaWrite">
		<button id="btnWrite">글쓰기</button>
	</div>

	<div class="pull-right">
		<span>자주 묻는 질문 : ${ paging.totalCount }</span>
	</div>
</div>

</div>

<c:import url="/WEB-INF/views/admin/layout/qnapaging.jsp" />

</c:if>