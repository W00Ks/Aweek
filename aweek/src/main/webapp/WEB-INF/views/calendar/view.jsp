<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.schedule_detail_header{
	position: absolute;
    top: 0;
    left: 0;
    right: 0;
    padding: 23px 70px 15px 23px;
}
.schedule_detail{
	padding: 60px 0 23px;
    background: #fff;
    box-sizing: border-box;
}
.schedule_detail_content{
	padding-top: 10px;
}
.schedule_detail_footer{
	text-align: right;
	padding-right: 18px;
}
h2{
	font-size: 25px;
    line-height: 22px;
    font-weight: bold;
    display: flex;
}
dl{
	position: relative;
}

dt{
	position: absolute;
    font-weight: bold;
    color: #222;
    line-height: 20px;
    padding-left: 23px;
}
dd{
	padding-left: 143px;
    color: #222;
    line-height: 20px;
    padding-bottom: 24px;
}
button{
	font-size: 14px;
    padding: 9px 11px 9px;
    background: #fff;
    border: 1px solid #c5c5c6;
    margin-right: 10px;
    border-radius: 2px;
}
</style>
</head>
<body>
<div class="schedule_detail_header">

<h2>${viewCal.calTitle }</h2>
</div>
<div class="schedule_detail_content">
<dl>
<dt>일시</dt>
<dd><span>${viewCal.startDate }</span></dd>


<dt>시간</dt>
<c:choose>
	<c:when test="${empty viewCal.startTime }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewCal.startTime }">
	<dd><span>${viewCal.startTime }</span></dd>
	</c:when>
</c:choose>
<dt>장소</dt>
<c:choose>
	<c:when test="${empty viewCal.calPlace }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewCal.calPlace }">
	<dd><span>${viewCal.calPlace }</span></dd>
	</c:when>
</c:choose>
<dt>메모</dt>
<c:choose>
	<c:when test="${empty viewCal.calMemo }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewCal.calMemo }">
	<dd><span>${viewCal.calMemo }</span></dd>
	</c:when>
</c:choose>
</dl>
</div>

<div class="schedule_detail_footer">
<button onclick="location.href='/calendar/update?calNo=${viewCal.calNo }'" style="cursor:pointer">수정</button>
<button onclick="location.href='/calendar/delete?calNo=${viewCal.calNo }'" style="cursor:pointer">삭제</button>
</div>
</body>
</html>