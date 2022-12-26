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
		var upd_list = alert ("공지사항을 수정합니다.")
	})
	
	$("#btnDelete").click(function() {
		var del_list = confirm ("공지사항을 삭제하시겠습니까?")
		
		if( del_list == true ) {
			alert("삭제하셨습니다.")
			location.href = "/admin/noticedelete?noticeNo=${ viewNotice.noticeNo }"
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

.noticeWrite {
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
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">공지사항</h1>
	</div>

	<div style="margin: 30px;">
		<span>공지사항 : ${ paging.totalCount }</span>
	</div>

	<table id="noticetable" style="margin: 0 auto;">
		<thead>
			<tr id="title">
				<th style="width: 50px;">번호</th>
				<th style="width: 250px;">제목</th>
				<th style="width: 100px;">날짜</th>
				<th style="width: 150px;">조회수</th>
				<th style="width: 100px;">수정</th>
				<th style="width: 100px;">삭제</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${ noticelist }" var="notice">
			<tr>
				<td>${ notice.noticeNo }</td>
				<td><a href="/admin/noticedetail?noticeNo=${ notice.noticeNo }">${ notice.noticeTitle }</a></td>
				<td><fmt:formatDate value="${ notice.noticeDate }" pattern="yyyy-MM-dd" /></td>
				<td>${ notice.noticeHit }</td>
				<td><a href="/admin/noticemodify?noticeNo=${ notice.noticeNo }"><button id="btnUpdate">수정</button></a></td>
				<td><a href="/admin/noticedelete?noticeNo=${ notice.noticeNo }"><button id="btnDelete">삭제</button></a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<div class="bottomlist">
	<div class="noticeWrite">
		<button id="btnWrite">글쓰기</button>
	</div>
</div>

<c:import url="/WEB-INF/views/admin/layout/noticepaging.jsp" />

</c:if>