<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<style type="text/css">

table {
    display: inline-block;
    text-align: center;
}

th {
   	background: #43c446;
    border: 1px solid #ccc;
    border-collapse: collapse;
   	text-align: center;
   	width: 200px;
   	font-size: 14px;
   	font-weight: 400;
}

td {
	border: 1px solid #ccc;
	text-align: center;
	width: 400px;
	font-size: 14px;
   	font-weight: 400;
}

th, td {
	padding: 5px;
}

.list {
	width: 300px;
    margin: 0 auto;
    border: 1px solid;
    border-radius: 2.1em;
    margin-top: 50px;
    margin-bottom: 50px;
}

.roomlist {
	border: 1px solid #ccc;
	border-radius: 1.1em;
	color: green;
	background: lawngreen;
}

</style>

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">방 상세 정보</h1>
	</div>
	
	<table>
		<tr>
			<th>모임 번호</th>
			<td>${ room.roomNo }</td>
		</tr>
		<tr>
			<th>카테고리</th>
			<c:if test="${ room.roomCategoryNo eq '1' }">
				<td>회사</td>
			</c:if>
			<c:if test="${ room.roomCategoryNo eq '2' }">
				<td>취미</td>
			</c:if>
			<c:if test="${ room.roomCategoryNo eq '3' }">
				<td>동아리</td>
			</c:if>
		</tr>
		<tr>
			<th>모임 이름</th>
			<td>${ room.roomName }</td>
		</tr>
		<tr>
			<th>모임 소개</th>
			<td>${ room.roomIntroduce }</td>
		</tr>
		<tr>
			<th>모임 인원</th>
			<td>${ room.roomMember }</td>
		</tr>
		<tr>
			<th>모임 공개여부</th>
			<c:if test="${ room.roomPublic eq '1' }">
				<td>공개</td>
			</c:if>
			<c:if test="${ room.roomPublic eq '0' }">
				<td>비공개</td>
			</c:if>
		</tr>
	</table>
</div>

<div style="margin-top: 50px; margin-bottom: 50px;">
	<a href="/admin/roomlist"><button class="roomlist">방 목록</button></a>
</div>