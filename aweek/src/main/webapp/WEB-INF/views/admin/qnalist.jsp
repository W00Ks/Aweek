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
		var upd_list = alert ("Q&A를 수정합니다.")
	})
	
	$("#btnDelete").click(function() {
		var del_list = confirm ("Q&A를 삭제하시겠습니까?")
		
		if( del_list == true ) {
			alert("삭제하셨습니다.")
			location.href = "/admin/qnadelete?qnaeNo=${ viewQna.qnaNo }"
		} else if( del_list == false ) {
			return false;
		}
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
}

.container {
	width: 800px;
	margin: 0 auto;
}

</style>

<c:if test="${ not empty adminLogin }">

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">자주 묻는 질문</h1>
	</div>
	
	<div style="margin: 30px;">
		<span>자주 묻는 질문 : ${ paging.totalCount }</span>
	</div>

	<table id="qnatable" style="margin: 0 auto;">
		<thead>
			<tr id="title">
				<th style="width: 50px;">번호</th>
				<th style="width: 250px;">제목</th>
				<th style="width: 100px;">날짜</th>
				<th style="width: 150px;">카테고리</th>
				<th style="width: 100px;">수정</th>
				<th style="width: 100px;">삭제</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${ qnalist }" var="qna">
			<tr>
				<td>${ qna.qnaNo }</td>
				<td><a href="/admin/qnadetail?qnaNo=${ qna.qnaNo }">${ qna.qnaTitle }</a></td>
				<td><fmt:formatDate value="${ qna.qnaDate }" pattern="yyyy-MM-dd" /></td>
				<td>${ qna.qnaCategoryNo }</td>
				<td><a href="/admin/qnamodify?qnaNo=${ qna.qnaNo }"><button id="btnUpdate">수정</button></a></td>
				<td><a href="/admin/qnadelete?qnaNo=${ qna.qnaNo }"><button id="btnDelete">삭제</button></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div class="bottomlist">
	<div class="qnaWrite">
		<button id="btnWrite">글쓰기</button>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/layout/qnapaging.jsp" />

</c:if>