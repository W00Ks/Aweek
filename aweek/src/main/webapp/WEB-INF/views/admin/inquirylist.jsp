<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

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

.inquiryWrite {
    width: 500px;
    margin: 0 auto;
    float: right;
}

</style>

<c:if test="${ not empty adminLogin }">

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">1:1 문의</h1>
</div>

<div id="orderlist" style="text-align: right; width: 870px;">
	<button id="oldestList" class="totallist">오래된 순</button>
	<button id="newestList" class="totallist">최신 순</button>
	<button id="titleList" class="totallist">제목 순</button>
</div>

<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 200px;">제목</th>
			<th style="width: 100px;">아이디</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">문의날짜</th>
			<!-- <th style="width: 150px;">답변 날짜</th>
			<th style="width: 100px;">처리 상태</th> -->
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ inquirylist }" var="inquiry">
		<tr>
			<td>${ inquiry.inquiryNo }</td>
			<td>${ inquiry.inquiryTitle }</td>
			<td>${ inquiry.inquiryEmail }</td>
			<td>${ inquiry.inquiryContent }</td>
			<td><fmt:formatDate value="${ inquiry.inquiryDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<div class="" style="margin-top: 50px; margin-left: 230px; float:left;">
	<span>1:1 문의 : ${ paging.totalCount }</span>
</div>

<c:import url="/WEB-INF/views/admin/layout/inquirypaging.jsp" />

</c:if>