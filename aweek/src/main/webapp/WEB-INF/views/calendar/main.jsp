<%@page import="calendar.dto.CalRoomList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.title{
text-align: center;
    padding-top: 61px;
    margin-left: 26%;
    padding-bottom: 68px;
    font-size: 38px;
    border-bottom: 2px solid #ccc;
    width: 50%;
    height: 10px;
    font-family: 'NanumSquareNeo-Variable';
}
.list-wrap{
	display: flex;
    flex-wrap: wrap;
    margin-left: 26%;
    margin-top: 60px;
    width: 67%;
    height: 100%;
    font-family: 'NanumSquareNeo-Variable';
}
.list{
	width: 11%;
    height: 114px;
    margin-right: 128px;
    margin-bottom: 101px;
    border: 2px solid;
    cursor: pointer;
    border-radius: 15px;
    font-family: 'NanumSquareNeo-Variable';
}
.calIcon{
	text-align: center;
    border-bottom: 2px solid;
    padding-top: 2px;
}
.room-name{
	padding-top: 32px;
    text-align: center;
    font-family: 'NanumSquareNeo-Variable';
}
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#list").click(function(e){
		console.log(e);
		var roomNo= e.target.className;
		console.log(roomNo);
		
		
	})
})

</script>
</head>
<body>
<jsp:include page="../layout/roomHeader.jsp"></jsp:include>
<div>
<div class="title">모임목록</div>
<div class="list-wrap">
	<c:forEach items="${loginUserRoomsInfo }" var="roomInfo">
		<div class="list" onclick="location.href='/calendar/gCal?roomNo=${roomInfo.roomNo}'">
		<div class="calIcon"><p class="material-icons">calendar_month</p></div>
		<div class="room-name"><p>${roomInfo.roomName }</p></div>
		
		</div>
	</c:forEach>
</div>
</div>
</body>
</html>