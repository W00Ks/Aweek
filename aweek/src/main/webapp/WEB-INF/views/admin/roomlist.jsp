<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

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

</style>

<c:if test="${ not empty adminLogin }">

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">방 목록</h1>
	</div>
	
	<div style="margin: 30px;">
		<span>Aweek의 개설된 방은 ${ paging.totalCount }개 입니다.</span>
	</div>
	
	<table style="margin: 0 auto;">
		<thead>
			<tr>
				<th style="width: 100px;">모임 번호</th>
				<th style="width: 300px;">모임 이름</th>
				<th style="width: 150px;">모임 상세정보</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${ roomlist }" var="room">
			<tr>
				<td>${ room.roomNo }</td>
				<td><a href="/admin/roomdetail?roomNo=${ room.roomNo }">${ room.roomName }</a></td>
				<c:if test="${ room.roomPublic eq '1' }">
					<td>공개</td>
				</c:if>
				<c:if test="${ room.roomPublic eq '0' }">
					<td>비공개</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<c:import url="/WEB-INF/views/admin/layout/roompaging.jsp" />

</c:if>