<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>결제 정보 조회</h1>
<hr>

<table style="border: 1px solid #ccc;">
	<tbody>
		<tr>
			<td>상품 정보 : ${payment.productNo}</td>
			<td>결제 상태 : ${payment.resultstatus}</td>
			<td>결제 금액 : ${payment.paymentAmount}</td>
			<td>결제 수단 : ${payment.paymentMethod}</td>
			<td>결제 일 : <fmt:formatDate value="${payment.paymentDate}" pattern="yy-MM-dd"/></td>
		</tr>
	</tbody>
</table>



</body>
</html>