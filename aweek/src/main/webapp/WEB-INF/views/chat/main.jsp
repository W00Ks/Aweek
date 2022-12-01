<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/roomHeader.jsp" %>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//채팅방 만들기 박스 이벤트
	$("#btnRoomCreat").click(function() {
		var state = $("#createChatRoom").attr("style");
		if(state == "display: none;") {
			$("#createChatRoom").attr("style", "display: block;");
		} else {
			$("#createChatRoom").attr("style", "display: none;");
		}
	})
	
	
})

function enter(i) {
	console.log('현재 들어가려는 방번호 ' + i)
	
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

function create() {
	console.log('create() start.');
	
	$.ajax({
		
		type: "post"					
		, url: "/chat/create"			
		, data: {						
			$("input[name=roomNo]")
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

<link rel="stylesheet" href="/resources/css/chatMain.css" type="text/css">


<div id="container">

<div id="content-left">
	<div id="leave-event">
		<button id="btnRoomCreat">메시지방 만들기</button>
		<!-- 방 생성 폼 -->
		<form name="createForm">
			<div id="createChatRoom" style="display: none;">
			
				<h4 class="roomH4">모임 이름</h4>
				<input type="text" name="chatRoomName" id="chatRoomName">
				
				<div id="roomList">
					<h4  class="roomH4">모임 선택</h4>
					<hr>
					<c:forEach items="${roomList }" var="rl">
						<div class="border-radio">
							<label for="${rl.roomNo }" class="room-n">${rl.roomName }</label>
							<input type="radio" name="roomNo" value="${rl.roomNo }" id="${rl.roomNo }" class="room-check-box"><br>
						</div>
					</c:forEach>
				</div>
				
				<button id="btnChatCreate" onclick="create()">채팅방 만들기</button>
				
			</div>
		</form>
	</div>
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

<jsp:include page="./chatFooter.jsp"/>

</html>




