<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/adminheader.jsp" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,200" />

<style type="text/css">

table {
    display: inline-block;
    text-align: center;
}

tr {
	font-size: 20px;
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

td {
	border: 1px solid #ccc;
	text-align: center;
	width: 70%;
	font-weight: 500;
}

.list {
	width: 300px;
    margin: 0 auto;
    border: 1px solid;
    border-radius: 2.1em;
    margin-top: 50px;
    margin-bottom: 50px;
}

.memberlist {
	border: 1px solid #ccc;
	border-radius: 1.1em;
	color: green;
	background: lawngreen;
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 200,
  'GRAD' 200,
  'opsz' 24
}

</style>

<c:if test="${ not empty adminLogin }">
<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">회원 상세 정보</h1>
</div>

<!--
<h1>회원 검색</h1>
	<div>
		<input type="text" name="userId" id="userId" placeholder="아이디" style="width: 200px;">
		<span class="material-symbols-outlined">search</span>
	</div>
 -->

<table>
	<tr>
		<th>번호</th>
		<td>${ member.userNo }</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>${ member.userId }</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${ member.userName }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${ member.userPhone }</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>${ member.userAddress }</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${ member.userBirth }</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${ member.userEmail }</td>
	</tr>
	<tr>
		<th>가입정보</th>
		<td><fmt:formatDate value="${ member.userJoin }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</table>

<div style="margin-top: 50px; margin-bottom: 50px;">
	<a href="/admin/memberlist"><button class="memberlist">회원 목록</button></a>
</div>

</c:if>

<c:import url="../layout/adminfooter.jsp" />