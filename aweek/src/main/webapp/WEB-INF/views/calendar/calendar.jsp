<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.calendar{
	width: 80%;
	margin-left: 320px;
}
.calendar_body{
	width: 100%;
	border: 1px solid white;
	border-collapse: collapse;
	
}


.calendar_body th{
	background-color:#f4b0b0;
	width:80px;
	border: 1px solid white;
	font-weight: bold;
}
.calendar_body td{
	background-color:#EFEFEF;
	width: 80px;
	height: 120px;
	border: 1px solid white;
	text-align: left;
	vertical-align: top;
	font-weight: bold;	
}
.side-bar{
	position: relative;
	height: 100%;
	display: flex;
	flex-direction: column;
}
.write-button{
	display: inline-block;
	padding: 16px 12px 14px;
}

.write-button a{
	display: block;
	font-weight:bold;
    background-color: #f4b0b0;
    height: 75px;
    text-align: center;
    width: 244px;
    margin-top: 23px;
    line-height: 4;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
}

.saturday{
	color: blue;
}

.sunday{
	color: red;
}
</style>
</head>
<body>

<jsp:include page="../layout/roomHeader.jsp"></jsp:include>
<div class="container">
<div class="side-bar">
	<div class="write-button">
	<a href="./writeForm" ><span>일정쓰기</span></a>
	</div>
</div>

<div class="calendar">
<table class="calendar_body">
	<caption>
		<a href="./myCal?year=${calMap.year-1 }&month=${calMap.month}">◁</a>
		<a href="./myCal?year=${calMap.year }&month=${calMap.month-1}">◀</a>
			<span>${calMap.year }</span>년
			<span>${calMap.month+1 }</span>월	
		<a href="./myCal?year=${calMap.year }&month=${calMap.month+1}">▶</a>
		<a href="./myCal?year=${calMap.year+1 }&month=${calMap.month}">▷</a>
	</caption>
	<tr>
		<th class="sunday">일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th class="saturday">토</th>
	</tr>
	
	<tr>
		<c:forEach   begin="1" step="1" end="${calMap.dayOfWeek-1 }">
			<td>&nbsp;</td>
		</c:forEach>
		
		
		
		<c:forEach begin="1" end="${calMap.lastDay }" step="1" var="i">
			
			<c:choose>
				<%-- 평일 --%>
				<c:when test="${(calMap.dayOfWeek-1+i)%7!=0 and (calMap.dayOfWeek-1+i)%7!=1 }">
					<td class="normal-day">${i }</td>
				</c:when>
				
				<%-- 토요일 --%>
				<c:when test="${(calMap.dayOfWeek-1+i)%7==0 }">
					<td class="saturday">${i }</td>
					<tr></tr>
				</c:when>
				
				<%-- 일요일 --%>
				<c:when test="${(calMap.dayOfWeek-1+i)%7==1}">
					<td class="sunday">${i }</td>
				</c:when>
				
				
				
			</c:choose>
			
			
		</c:forEach>
	</tr>
	


</table>
</div><!-- calendar END -->
</div><!-- container END -->
</body>
</html>