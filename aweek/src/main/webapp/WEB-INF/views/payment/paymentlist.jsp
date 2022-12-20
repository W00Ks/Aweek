<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>결제 정보 조회</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 15%;">주문명</th>
		<th style="width: 15%;">주문 상태</th>
		<th style="width: 15%;">결제 금액</th>
		<th style="width: 15%;">결제 수단</th>
		<th style="width: 20%;">결제자 이름</th>
		<th style="width: 20%;">결제일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="paymnet">
	<tr>
		<td>${board.boardNo }</td>
		<td><a href="/board/view?boardNo=${board.boardNo }">${board.title }</a></td>
		<td>${board.writerNick }</td>
		<td>${board.hit }</td>
		<td><fmt:formatDate value="${board.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td><fmt:formatDate value="${board.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>



</body>
</html>