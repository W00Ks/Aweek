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

.memberlist {
	border: 1px solid #ccc;
	border-radius: 1.1em;
	color: green;
	background: lawngreen;
}

</style>

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">회원 상세 정보</h1>
	</div>
	<table>
		<tr>
			<th>회원 번호</th>
			<td>${ member.userNo }</td>
		</tr>
		<tr>
			<th>회원 아이디</th>
			<td>${ member.userId }</td>
		</tr>
		<tr>
			<th>회원 이름</th>
			<td>${ member.userName }</td>
		</tr>
		<tr>
			<th>회원 전화번호</th>
			<td>${ member.userPhone }</td>
		</tr>
		<tr>
			<th>회원 주소</th>
			<td>${ member.userAddress }</td>
		</tr>
		<tr>
			<th>회원 생년월일</th>
			<td>${ member.userBirth }</td>
		</tr>
		<tr>
			<th>회원 이메일</th>
			<td>${ member.userEmail }</td>
		</tr>
		<tr>
			<th>회원 가입정보</th>
			<td><fmt:formatDate value="${ member.userJoin }" pattern="yy-MM-dd HH:mm:ss"/></td>
		</tr>
	</table>
</div>

<div style="margin-top: 50px; margin-bottom: 50px;">
	<a href="/admin/memberlist"><button class="memberlist">회원 목록</button></a>
</div>