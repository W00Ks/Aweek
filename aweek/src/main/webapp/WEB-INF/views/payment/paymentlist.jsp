<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/mainHeader.jsp" flush="true" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Noto Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style type="text/css">
body {
  padding:1.5em;
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 80%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
  margin: auto;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}

#nameContainer {
	margin: 3%;
    font-weight: bold;
    font-size: larger;
    text-align: center;
    color: #594B4B;
}

#homeBtn {
	background-color: #edc7c7;
    width: 75px;
    height: 35px;
    font-size: medium;
    border: 1px solid #594B4B;
    border-radius: 6px;
}

#homeBtn:hover {
	background-color: #edc7c7;
    width: 78px;
    height: 38px;
    font-weight: bold;
    font-size: medium;
    color: #594B4B;
    transition-duration: 1s;
    border: 1px solid #edc7c7;
    border-radius: 6px;
}
  
 @media all and (max-width: 768px) {
    
table, thead, tbody, th, td, tr {
    display: block;
}
  
th {
    text-align: right;
}
  
table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
}
  
thead {
    float: left;
    white-space: nowrap;
}
  
tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
}
  
tr {
    display: inline-block;
    vertical-align: top;
}
  
th {
    border-bottom: 1px solid #a39485;
}
  
td {
    border-bottom: 1px solid #e5e5e5;
}
  
  
}
</style>


</head>
<body>

<div id="nameContainer">
<h1>${member.userId}님 결제정보</h1>
</div>
<hr>

<table style="border: 1px solid #ccc;">
	<thead>
		<tr>
			<th>회원아이디</th>
			<th>상품 정보</th>
			<th>결제 상태</th>
			<th>결제 금액</th>
			<th>결제 수단</th>
			<th style="text-align: center;">결제일</th>
			<th style="text-align: center;">결제 만료일</th>
			<th style="text-align: center;">남은 기간</th>
		</tr>
	</thead>

	<tbody>
	<c:if test="${empty paymentList }">
		<td colspan="8" style="text-align: center; font-weight: bold; font-size: large;">결제 내역이 없습니다!</td>
	</c:if>
	<c:forEach items="${paymentList }" var="payment">
		<tr>
			<td>${member.userId}</td>
		
			<c:choose>
			    <c:when test="${payment.productNo eq 1}">
			        <td>PREMIUM 1개월</td>
			    </c:when>
			    <c:when test="${payment.productNo eq 2}">
			        <td>PREMIUM 12개월</td>
			    </c:when>
			</c:choose>
			
			<c:choose>
			    <c:when test="${payment.resultStatus eq 'Y'}">
			        <td>결제 완료 ✅</td>
			    </c:when>
			    <c:when test="${payment.resultStatus eq 'y'}">
			        <td>결제 완료 ✅</td>
			    </c:when>
			    <c:when test="${payment.resultStatus eq NULL}">
			        <td>결제 완료 ⛔</td>
			    </c:when>
			    <c:when test="${payment.resultStatus eq 'N'}">
			        <td>결제 완료 ⛔</td>
			    </c:when>
			</c:choose>
			
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${payment.paymentAmount}"/> 원</td>
			
			<c:choose>
			    <c:when test="${payment.paymentMethod eq 'point'}">
			        <td>카카오페이</td>
			    </c:when>
			    <c:when test="${payment.paymentMethod eq 'card'}">
			        <td>신용카드</td>
			    </c:when>
			</c:choose>

			<td style="text-align: center;"><fmt:formatDate value="${payment.paymentDate}" pattern="yyyy년MM월dd일 hh시mm분"/></td>
			
			<td style="text-align: center;"><fmt:formatDate value="${payment.expirationDate}" pattern="yyyy년MM월dd일"/></td>
			
			<c:choose>
			    <c:when test="${payment.duration > 0}">
			        <td style="text-align: center;">${durationSet }일</td>
			    </c:when>
			    <c:when test="${payment.duration < 0}">
			        <td style="text-align: center;">기간 종료</td>
			    </c:when>
			    <c:when test="${payment.duration == 0}">
			        <td style="text-align: center;">기간 종료</td>
			    </c:when>
			</c:choose>			
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

<div id="nameContainer" style="margin-top: -60px;">
<a href="/aweekHome"><button id="homeBtn">확인</button></a>
</div>


</body>
</html>