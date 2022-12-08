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
		
		//체크박스 해제
		$("input[name=roomNo]").prop('checked', false); 
		$("#chatRoomName1").val(""); 
		
	}) // End of $("#btnRoomCreat").click()
	
	//채팅방 만들기 박스 닫기 이벤트
	$("#close-box").click(function() {
		var state = $("#createChatRoom").attr("style");
		if(state == "display: none;") {
			$("#createChatRoom").attr("style", "display: block;");
		} else {
			$("#createChatRoom").attr("style", "display: none;");
		}
	}) // End of $("#close-box").click()
	
	//채팅방 만들기 버튼 클릭 이벤트
	$("#btnChatCreate").click(function() {
		
		   if($("#chatRoomName1").val() != "" && $('input[name=roomNo]:checked').val() != undefined) {
			   
			   //채팅방 insert 하기
			   $.ajax({
					
					type: "post"					
					, url: "/chat/create"			
					, data: {						
						chatRoomName: $("#chatRoomName1").val()
						, roomNo: $('input[name=roomNo]:checked').val()
					}
					, dataType: "json"				
					, success: function( res ) {
						console.log("AJAX 성공")
						
						$("#ajaxChatRoomNo").attr("value", res);
						
						//생성된 채팅방 실시간 띄우기
						sendMessage(2);
					}
					, error: function( res ) {
						console.log("AJAX 실패")
					}
					
				})
			   	
				//채팅방 만들면 창 끄기
				var state = $("#createChatRoom").attr("style");
				if(state == "display: none;") {
					$("#createChatRoom").attr("style", "display: block;");
				} else {
					$("#createChatRoom").attr("style", "display: none;");
				}
				
		   }
			
	}); //End of $("#btnChatCreate").click()
	
}) // End of $(document).ready()

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
			
			//입장한 채팅방 버튼 비활성화 시키기 
			$('button[value=' + i + ']').attr("disabled", "");
			$(".chatRoomName2").not($('button[value='+i+']')).removeAttr("disabled");
			
			//입장한 채팅방 버튼 CSS설정하기
			$('button[value=' + i + ']').addClass("disable");
			$(".chatRoomName2").not($('button[value='+i+']')).removeClass("disable");
			
			//메인 배경색 변경
			$("#content-right").css("background-color", "#fff")
			
			//응답 데이터 반영
			$("#content-right").html( res )
			
			$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
			
		}
		, error: function() {
			console.log("AJAX 실패")
		}
		
	})
	
} // End of enter(i)

//채팅방 리스트 접었다 펴기
function fold(roomNo) {
	
	console.log("asd")
	var state = $('.chatRoomList[id=' + roomNo + ']').attr("style");
	if(state == "display: none;") {
		$('.chatRoomList[id=' + roomNo + ']').attr("style", "display: block;");
		$('.expand_more[id=' + roomNo + ']').attr("style", "display: block;");
		$('.chevron_right[id=' + roomNo + ']').attr("style", "display: none;");
	} else {
		$('.chatRoomList[id=' + roomNo + ']').attr("style", "display: none;");
		$('.chevron_right[id=' + roomNo + ']').attr("style", "display: block;");
		$('.expand_more[id=' + roomNo + ']').attr("style", "display: none;");
	}
	
} //End of fold(roomNo)
</script>

<link rel="stylesheet" href="/resources/css/chatMain.css" type="text/css">


<div id="container">

<div id="content-left">
	<div id="leave-event">
		<button id="btnRoomCreat" class="btn btnRoomCreat">메시지방 만들기</button>
			<!-- 방 생성 -->
			<div id="createChatRoom" style="display: none;">
				<div id="close-box-wrap">
					<button id="close-box"><span class="material-symbols-outlined" style="font-size: 21px;">close</span></button>
				</div>
				<h4 class="roomH4"><label for="chatRoomName1">채팅방 이름</label></h4>
				<input type="text" id="chatRoomName1" placeholder="채팅방 이름 입력">
				<div id="roomList">
					<h4 class="roomH4">모임 선택</h4>
					<hr>
					<c:forEach items="${roomList }" var="rl">
						<div class="border-radio">
							<label for="${rl.roomNo }" class="room-n">${rl.roomName }</label>
							<input type="radio" name="roomNo" value="${rl.roomNo }" id="${rl.roomNo }" class="room-check-box"><br>
						</div>
					</c:forEach>
				</div>
				<button id="btnChatCreate" class="btn btnChatCreate">채팅방 만들기</button>
				<!-- ajax로 받아온 chatRoomNo -->
				<input type="hidden" id="ajaxChatRoomNo" value="">
			</div>
	</div>
	<div id="searchWrap">
		<label for="searchBar" id="btnSearch"><span class="material-symbols-outlined">search</span></label>
		<input id="searchBar" type="text" placeholder="메시지방, 메시지 검색"><br>
	</div>
	<div id="chatList">
		<c:forEach items="${roomList }" var="rl">
			<button class="btn_fold" onclick="fold(${rl.roomNo })">
				<span class="material-symbols-outlined expand_more" id="${rl.roomNo }" style="display: none;">expand_more</span>
				<span class="material-symbols-outlined chevron_right"  id="${rl.roomNo }">chevron_right</span>${rl.roomName }
			</button><br>
			<div id="${rl.roomNo }" class="chatRoomList" style="display: none;">
				<c:forEach items="${chatList }" var="cl">
					<c:if test="${rl.roomNo eq cl.roomNo }">
						<button class="chatRoomName2" value="${cl.chatRoomNo }" onclick="enter(${cl.chatRoomNo })">${cl.chatRoomName }</button>
						<c:set var="read_num" value="0"/>
						<div id="read${cl.chatRoomNo }"><c:out value="${read_num }"/></div><br>
					</c:if>
				</c:forEach>
			</div>
		</c:forEach>
	</div>	
</div>

<div id="content-right">
	<jsp:include page="./mainRight.jsp"/>
</div>

</div>

</body>

<jsp:include page="./chatFooter.jsp"/>

</html>




