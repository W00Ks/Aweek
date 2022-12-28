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

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">결제 목록</h1>
	</div>
	
	<div style="margin: 30px;">
		<span>Aweek 결제 인원은 ${ paging.totalCount }명 입니다.</span>
	</div>

	<table style="margin: 0 auto;">
		<thead>
			<tr>
				<th style="width: 100px;">결제 번호</th>
				<th style="width: 150px;">회원 번호</th>
				<th style="width: 150px;">상품 번호</th>
				<th style="width: 150px;">결제 일자</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach items="${ paymentlist }" var="payment">
			<tr>
				<td>${ payment.payNo }</td>
				<td><a href="/admin/paymentdetail?payNo=?"${ payment.payNo }>${ payment.userNo }</a></td>
				<td>${ payment.productNo }</td>
				<td><fmt:formatDate value="${ payment.paymentDate }" pattern="yy-MM-dd"/></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<c:import url="/WEB-INF/views/admin/layout/paymentpaging.jsp" />