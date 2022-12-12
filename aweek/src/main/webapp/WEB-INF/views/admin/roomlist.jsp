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

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">방 목록</h1>
</div>

<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 200px;">카테고리</th>
			<th style="width: 200px;">이름</th>
			<th style="width: 50px;">인원</th>
			<th style="width: 100px;">공개정보</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ roomlist }" var="room">
		<tr>
			<td>${ room.roomNo }</td>
			<td>${ Room.roomCategoryNo }</td>
			<td>${ Room.roomName }</td>
			<td>${ Room.roomMember }</td>
			<td>${ Room.roomPublic }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/admin/layout/roompaging.jsp" />

</c:if>

<c:import url="./layout/adminfooter.jsp" />