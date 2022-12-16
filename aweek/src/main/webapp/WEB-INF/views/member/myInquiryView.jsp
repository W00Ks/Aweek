<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

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
    width: 400px;
    margin: 0 auto;
    line-height: 30px;
    border-collapse: collapse;
}

.myInquiry_table tr > th {
	font-size: 16px;
    line-height: 45px;
}

.myInquiry_table tr:nth-child(1) th, .myInquiry_table tr:nth-child(1) td {
	border-bottom : 2px solid black;
}

.myInquiry_table tr:nth-child(3) th, .myInquiry_table tr:nth-child(3) td {
	border-bottom : 2px solid black;
}

.myInquiry_table tr:nth-child(5) th, .myInquiry_table tr:nth-child(5) td {
	border-bottom : 2px solid black;
}

.myInquiry_table tr:nth-child(7) th, .myInquiry_table tr:nth-child(7) td {
	border-bottom : 2px solid black;
}

.middle {
	height: 15px;
}

.myInquiry_table tr:nth-last-child(3) {
    display: inline;
    line-height: 0px;
}

#contentSpan {
	border: 2px solid #ccc;
	border-radius: 10px;
    padding: 15px;
    height: 200px;
	
}

.bottom {
	height: 10px;
}

/* 닫기 버튼 div 영역 */
.btn_area {
	margin-top: 10px;
	margin-bottom: 20px;
	text-align: center;
	position: relative;
}

/* 닫기 버튼 */
#btnCancel {
	width: 100px;
    height: 40px;
    border-radius: 20px;
    font-size: 15px;
    font-weight: 600;
    background-color: #f4b0b0;
    border: 1px solid #f4b0b0;
    color: #ffffff;
    cursor: pointer;
    font-family: 'NanumSquareNeo-Variable';
}

</style>

</head>
<body>

<div class="myInquiryTxt" style="position:relative;">
	<span>나의 1:1 문의 상세</span>
</div>

<table class="myInquiry_table">
<tr>
	<th>글번호</th>
	<td>${viewInquiry.inquiryNo }</td>
</tr>
<tr class="middle"></tr>
<tr>
	<th>작성일</th>
	<td><fmt:formatDate value="${viewInquiry.inquiryDate }" pattern="yyyy-MM-dd"/></td>
</tr>
<tr class="middle"></tr>
<tr>
	<th>작성자</th>
	<td>${member.userId}</td>
</tr>
<tr class="middle"></tr>
<tr>
	<th>제목</th>
	<td>${viewInquiry.inquiryTitle }</td>
</tr>
<tr class="middle"></tr>
<tr>
	<th colspan="2">내용</th>
	<th></th>
</tr>
<tr>
	<td colspan="2"><div id="contentSpan">${viewInquiry.inquiryContent }</div></td>
	<td></td>
</tr>

<tr class="bottom"></tr>
</table>

	<div class="btn_area">
		<button type="button" id="btnCancel" onclick="window.close()">닫기</button>
	</div>

</body>
</html>