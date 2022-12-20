<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.java.com/jquery-2.2.4.min.js">
$(document).ready(function(){
	
	
})
</script>
</head>
<body>
<h1>일정 수정하기</h1>

<form action="/calendar/update" method="post">

<input type="hidden" name="calNo" value="${viewCal.calNo }">

제목<input type="text" name="calTitle" value="${viewCal.calTitle }"><br>
장소<input type="text" name="calPlace" value="${viewCal.calPlace }"><br>
날짜<input type="text" name="startDate" value="${viewCal.startDate }"><br>

<input type="submit" value="수정">
</form>
</body>
</html>