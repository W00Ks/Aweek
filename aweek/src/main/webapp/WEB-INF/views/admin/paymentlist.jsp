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
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">결제 목록</h1>
</div>

<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">아이디</th>
			<th style="width: 150px;">결제 금액</th>
			<th style="width: 150px;">결제 수단</th>
			<th style="width: 150px;">날짜</th>
			<th style="width: 100px;">내용</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ paymentlist }" var="payment">
		<tr>
			<td>${ payment.payNo }</td>
			<td><a href="">${ member.userId }</a></td>
			<td>${ payment.paymentAmount }</td>
			<td>${ payment.paymentMethod }</td>
			<td>${ payment.paymnetDate }</td>
			<td>${ payment.reslutstatus }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/admin/layout/paymentpaging.jsp" />

</c:if>

<c:import url="./layout/adminfooter.jsp" />