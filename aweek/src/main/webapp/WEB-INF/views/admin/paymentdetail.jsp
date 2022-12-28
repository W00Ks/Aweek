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

.paymentlist {
	border: 1px solid #ccc;
	border-radius: 1.1em;
	color: green;
	background: lawngreen;
}

</style>

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">결제 상세 정보</h1>
	</div>
	<table>
		<tr>
			<th>결제 번호</th>
			<td>${ payment.payNo }</td>
		</tr>
		<tr>
			<th>회원 번호</th>
			<td>${ payment.userNo }</td>
		</tr>
		<tr>
			<th>상품 번호</th>
			<td>${ payment.productNo }</td>
		</tr>
		<tr>
			<th>결제 유형</th>
			<td>${ payment.payType }</td>
		</tr>
		<tr>
			<th>결제 수단</th>
			<td>${ payment.paymentMethod }</td>
		</tr>
		<tr>
			<th>결제 계좌번호</th>
			<td>${ payment.bankAccount }</td>
		</tr>
		<tr>
			<th>결제 금액</th>
			<td>${ payment.paymentAmount }</td>
		</tr>
		<tr>
			<th>결제 일자</th>
			<td>${ payment.paymentDate }</td>
		</tr>
		<tr>
			<th>사용 만료일</th>
			<td>${ payment.expirationDate }</td>
		</tr>
		<tr>
			<th>사용 기간</th>
			<td>${ payment.duration }</td>
		</tr>
		<tr>
			<th>결제 상태</th>
			<td>${ payment.resultStatus }</td>
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
</div>

<div style="margin-top: 50px; margin-bottom: 50px;">
	<a href="/admin/paymentlist"><button class="paymentlist">결제 목록</button></a>
</div>