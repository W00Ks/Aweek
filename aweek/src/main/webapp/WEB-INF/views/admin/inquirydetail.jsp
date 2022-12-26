<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnList").click(function() {
		location.href = "/admin/inquirylist"
	})
})

</script>

<style type="text/css">

p {
	margin: 15px 0;
}

.container {
	width: 800px;
	border: 1px solid green;
	margin-top: 70px;
	border-radius: 1.5em;
}

.firstList {
	border-bottom: 1px solid gray;
}

.secondList {
	border-bottom: 1px solid gray;
}

.second {
	margin: 30px 0px;
}

.third {
	margin: 130px 0px;
}

</style>

</head>
<body>

<h1>1:1 문의 상세보기</h1>
<hr>

<div class="container">
	<div style="display: flex;" class="firstList">
		<p style="width: 30%;">글번호 : ${ viewInquiry.inquiryNo }</p>
		<p style="width: 40%; text-align: left;">작성일 : <fmt:formatDate value="${ viewInquiry.inquiryDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		<p style="width: 30%;">이메일 : ${ viewInquiry.inquiryEmail }</p>
	</div>
	
	<div style="display: flex;" class="secondList">
		<p style="width: 30%" class="second">제목</p>
		<p style="width: 70%; text-align: left;" class="second">${ viewInquiry.inquiryTitle }</p>
	</div>
	
	<div style="display: flex;" class="thirdList">
		<p style="width: 30%" class="third">내용</p>
		<p style="width: 70%; text-align: left;" class="third">${ viewInquiry.inquiryContent }</p>
	</div>
</div>

<div style="margin: 0 auto; margin-top: 70px;">
	<button id="btnList" class="btnList">목록</button>
</div>

</body>
</html>