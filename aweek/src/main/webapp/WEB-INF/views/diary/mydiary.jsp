<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.rightbox1 {
	height: 70px;
}
.rightbox2 {
	height: 600px;
}
.rightbox3 {
	height: 70px;
}
.rightbox4 {
	height: 70px;
}
table {
	width: 100%;
	margin-top:	-10px;
}
th, td {
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
}
td:nth-child(4) {
	text-align: justify;
}
th {
	border-bottom: 1px solid #C7D1CA;
	border-bottom-width: thick;
	font-weight: 600;
}
td {
	border-top: 1px solid #C7D1CA;
}
</style>

<div class="rightbox1">
</div>
<div class="rightbox2">
	<div style="font-size: 1.2em; font-weight:600;">나의글</a></div>
	<br><br>
	<table class="table table-striped table-hover table-condensed">
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 15%;">모임</th>
		<th style="width: 15%;">카테고리</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 15%;">글쓴이</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 5%;">조회수</th>
		<th style="width: 5%;">추천수</th>
	</tr>
	<c:forEach items="${list }" var="data">
	<tr>
		<td>${data.diaryNo }</td>
		<td>${data.roomName }</td>
		<td>${data.diaryCateName }</td>
		<td><a href="./view?diaryNo=${data.diaryNo }">${data.diaryTitle }</a></td>
		<td>${data.userName }</td>
		<td>${data.diaryDate }</td>
		<td>${data.diaryHit }</td>
		<td>${data.diaryRecommend }</td>
	</tr>
	</c:forEach>
	</table>		
</div>
<div class="rightbox3">
</div>

<jsp:include page="./mypaging.jsp" flush="true" />

<jsp:include page="./footer.jsp" flush="true" />