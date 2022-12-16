<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

body {
	font-family: 'NanumSquareNeo-Variable';
}

.myInquiryTxt {
    text-align: center;
    color: #555555;
    font-size: 30px;
    font-weight: bold;
    margin: 20px auto 40px;
    cursor: default;
}

.myInquiry_table {
	text-align: center;
    width: 1000px;
    margin: 0 auto;
    line-height: 30px;
}

.myInquiry_thead {
	height: 40px;
    font-size: 18px;
    font-weight: 600;
    border-bottom: 1px solid #ccc;
    cursor: default;
}

.middle {
	height: 10px;
}

.myInquiry_tbody, .myInquiry_tbody a {
	font-size: 16px;
	color: #555555;
    line-height: 40px;
    cursor: default;
}

.myInquiry_tbody tr:first-child {
	margin-top: 10px;
}

.myInquiry_tbody tr:last-child {
	border-bottom: 1px solid #ccc;
}

.myInquiry_tbody tr:hover, .myInquiry_tbody tr:hover a {
	font-size: 19px;
    background-color: #594B4B;
    color: white;
}

.myInquiry_tbody tr:hover a {
	color: #ffd877;
	cursor: pointer;
}

.bottom {
	height: 10px;
}

</style>

<c:import url="../layout/mainHeader.jsp" />

<c:import url="../layout/mypageTop.jsp" />

<div class="myInquiryTxt" style="position:relative;">
	<span>나의 1:1 문의</span>
</div>

<table class="myInquiry_table">
<thead class="myInquiry_thead">
<tr>
	<th style="width: 10%;">글번호</th>
	<th style="width: 20%;">제목</th>
	<th style="width: 40%;">내용</th>
	<th style="width: 15%;">작성일</th>
</tr>
</thead>

<tr class="middle"></tr>

<tbody class="myInquiry_tbody">
<c:forEach items="${list }" var="myInquiry">
<tr>
	<td>${myInquiry.inquiryNo }</td>
	<c:choose>
		<c:when test="${fn:length(myInquiry.inquiryTitle) > 11 }">
			<td>${fn:substring(myInquiry.inquiryTitle, 0, 10)}...</td>
		</c:when>
		<c:otherwise>
			<td>${myInquiry.inquiryTitle }</td>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${fn:length(myInquiry.inquiryContent) > 21 }">
			<td><a onclick="window.open('./myInquiryView?inquiryNo=${myInquiry.inquiryNo}', 'window_name', 'width=600, height=700, top=200, left=1000, location=no, status=no, scrollbars=yes');">
					${fn:substring(myInquiry.inquiryContent, 0, 20) }...</a></td>
		</c:when>
		<c:otherwise>
			<td><a onclick="window.open('./myInquiryView?inquiryNo=${myInquiry.inquiryNo}', 'window_name', 'width=700, height=700, top=200, left=1000, location=no, status=no, scrollbars=yes');">
					${myInquiry.inquiryContent }</a></td>
		</c:otherwise>
	</c:choose>
	<td><fmt:formatDate value="${myInquiry.inquiryDate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>
<tr class="bottom"></tr>
</tbody>
</table>

<c:import url="../layout/myInquiryPaging.jsp" />


</body>
</html>