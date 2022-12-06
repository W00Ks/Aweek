<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/admin/qnawrite"
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

td:nth-child(2) {
	text-align: left;
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
    width: 500px;
    margin: 0 auto;
    float: right;
}

</style>

<c:if test="${ not empty adminLogin }">
<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">Q&A</h1>
</div>

<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 200px;">제목</th>
			<th style="width: 200px;">날짜</th>
			<th style="width: 150px;">수정 및 삭제</th>
	</thead>
	
	<tbody>
	<c:forEach items="${ qnalist }" var="qna">
		<tr>
			<td>${ member.userNo }</td>
			<td><a href="">${ member.userId }</a></td>
			<td>${ member.userName }</td>
			<td>${ member.userName }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<hr>

<div class="qnaWrite">
	<button id="btnWrite" class="">글쓰기</button>
</div>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/admin/qnapaging.jsp" />

</c:if>

<c:import url="../layout/adminfooter.jsp" />