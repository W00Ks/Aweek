<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
// 	$(".chatRoomName").click(function() {
// 		console.log(".chatRoomName 클릭")
// 		$.ajax({
// 			type: "get"					
// 			, url: "/chat/enter"			
// 			, data: {						
// 				chatRoomNo: $(".chatRoomName").val()
// 			}
// 			, dataType: "html"				
// 			, success: function( res ) {
// 				console.log("AJAX 성공")
				
// 				//응답 데이터 반영
// 				$("#content-right").html( res )
// 			}
			
// 		})
		
// 	})
	
})

function enter(i) {
	console.log('현재 들어가려는 번호 ' + i)
	
	$.ajax({
		
		type: "get"					
		, url: "/chat/enter"			
		, data: {						
			chatRoomNo: i
		}
		, dataType: "html"				
		, success: function( res ) {
			console.log("AJAX 성공")
			
			//응답 데이터 반영
			$("#content-right").html( res )
		}
		
	})
}
</script>



<link rel="stylesheet" href="/resources/css/chatMain.css">

</head>
<body>

<div id="container">

<div id="content-left">
	<a href="./create"><button id="btnRoomCreat">메시지방 만들기</button></a><br>
	<div id="searchWrap">
		<button>검색</button>
		<input id="searchBar" type="text" placeholder="메시지방, 메시지 검색"><br>
	</div>
	<div id="chatList">
		<c:forEach items="${chatList }" var="cl">
			<button class="chatRoomName" value="${cl.chatRoomNo }" onclick="enter(${cl.chatRoomNo })">${cl.chatRoomName }</button><br>
		</c:forEach>
	</div>	
</div>

<div id="content-right">
	
</div>

</div>

</body>
</html>