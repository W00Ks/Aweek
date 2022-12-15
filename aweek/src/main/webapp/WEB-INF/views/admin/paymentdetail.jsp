<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

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
    margin-top: 30px;
    border-radius: 2.1em;
    margin-bottom: 50px;
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
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">결제 상세 정보</h1>
</div>

<table>
	<tr>
		<th>결제일자</th>
		<td>${ payment.paymentDate }</td>
	</tr>
	<tr>
		<th>다음결제일자</th>
		<td>${ payment.nextOrderDate }</td>
	</tr>
	<tr>
		<th>결제 금액</th>
		<td>${ payment.paymentAmount }</td>
	</tr>
	<tr>
		<th>주문명</th>
		<td>${ payment.payType }</td>
	</tr>
	<tr>
		<th>결제 수단</th>
		<td>${ payment.paymentMethod }</td>
	</tr>
	<tr>
		<th>결제 상태</th>
		<td>${ payment.resultstatus }</td>
	</tr>
	<tr>
		<th>결제자 이름</th>
		<td>${ member.memberName }</td>
	</tr>
	<tr>
		<th>결제자 이메일</th>
		<td>${ member.memberEmail }</td>
	</tr>
	<tr>
		<th>결제 전화번호</th>
		<td>${ member.memberPhone }</td>
	</tr>
</table>

<div style="margin-top: 50px; margin-bottom: 50px;">
	<a href="/admin/paymentlist"><button class="paymentlist">결제 목록</button></a>
</div>

</c:if>