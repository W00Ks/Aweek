<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/roomHeader.jsp" %>

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//채팅방 클릭으로 열고 닫기 이벤트
	$("#btnRoomCreat").click(function() {
		
		var state = $("#createChatRoom").attr("style");
		if(state == "display: none;") {
			$("#createChatRoom").attr("style", "display: block;");
		} else {
			$("#createChatRoom").attr("style", "display: none;");
		}
		
		//열고 닫을 때 설정 초기화
		$("input[name=roomNo]").prop('checked', false); 
		$("input[name=userId]").prop('checked', false); 
		$("#chatRoomName1").val(""); 
		$('.member-radio').attr('style', 'display: none;');
		$('.room-n').attr('style', 'font-weight: normal;')
	}) // End of $("#btnRoomCreat").click()
	
	//채팅 상대 선택 박스 열고 닫기
	$('input[name=roomNo]').click(function() {
		
		//체크한 모임의 roomNo
		var roomNo = $('input[name=roomNo]:checked').val();
		
		//radio setting func
		radioSetProc(roomNo);
		
	}) // End of $('input[name=roomNo]').click()
	
	
	//채팅방 만들기 (x)버튼으로 닫기
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
		
		console.log("초대 받은 userNo -- " + $('input[name=userId]:checked').attr('id'));
		
		//초대 받은 회원의 회원번호 (없을 때 = 0)
		var invite;
		if($('input[name=userId]:checked').attr('id') == undefined) {
			invite = 0;
		} else {
			invite = $('input[name=userId]:checked').attr('id');
		}
		
		
	   if($("#chatRoomName1").val() != "" && $('input[name=roomNo]:checked').val() != undefined) {
		   
		   //채팅방 insert 하기
		   $.ajax({
				
				type: "post"					
				, url: "/chat/create"			
				, data: {						
					chatRoomName: $("#chatRoomName1").val()
					, roomNo: $('input[name=roomNo]:checked').val()
					, inviteUserNo: invite
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
	
	//채팅 카테고리별 변화주는 이벤트
	$(".nomal_chat").click(function() {
		
		$(this).siblings('.hover1').attr('style', 'display: block')
		$(this).siblings('.hover2').attr('style', 'display: none')
		
		$(this).addClass('chat_cate')
		$(this).siblings(".group_chat").removeClass('chat_cate')

	}) //End of $(".nomal_chat").click()
	$(".group_chat").click(function() {
		
		$(this).siblings('.hover2').attr('style', 'display: block')
		$(this).siblings('.hover1').attr('style', 'display: none')
		
		$(this).addClass('chat_cate')
		$(this).siblings(".nomal_chat").removeClass('chat_cate')

	}) //End of $(".group_chat").click()
	
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
			
		}
		, error: function() {
			console.log("AJAX 실패")
		}
		
	})
	
} // End of enter(i)

//채팅방 리스트 접었다 펴기
function fold(roomNo) {
	
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

//채팅방 만들기 박스 관련 함수
function radioSetProc( roomNo ) {
	
	//해당 roomNo를 id로 가진 member-radio를 보이게 하기
	var state = $('.member-radio[id=' + roomNo + ']').attr('style')
	
	if(state == "display: none;") {
		$('.member-radio[id=' + roomNo + ']').attr('style', 'display: block;');
		$('.member-radio').not('.member-radio[id=' + roomNo + ']').attr('style', 'display: none;');
		$('input:radio[name=userId]').prop('checked', false);
		$('label[for=' + roomNo + ']').attr('style', 'font-weight: bold;')
		$('.room-n').not('label[for=' + roomNo + ']').attr('style', 'font-weight: normal;')
	} else if(state == "display: block;") {
		$('.member-radio[id=' + roomNo + ']').attr('style', 'display: none;');
		$('input[name=roomNo]:checked').prop('checked', false);
		$('label[for=' + roomNo + ']').attr('style', 'font-weight: normal;')
	} else if(state == undefined) {
		swal.fire('채팅 멤버가 없습니다.', '현재 모임에 가입된 멤버가 없습니다.', 'info');
		$('input[name=roomNo]:checked').prop('checked', false);
		$('.member-radio').not('.member-radio[id=' + roomNo + ']').attr('style', 'display: none;');
		$('.room-n').not('label[for=' + roomNo + ']').attr('style', 'font-weight: normal;')
	}
	
}

</script>

<link rel="stylesheet" href="/resources/css/chatMain.css" type="text/css">


<div id="container">

<div id="content-left">
	<div id="leave-event">
		<button id="btnRoomCreat" class="btn btnRoomCreat">채팅방 만들기</button>
			<!-- 채팅방 타입 선택 -->
			<div id="chatRoomType">
				<div id="one"></div>
				<div id="group"></div>
			</div>
			<!-- 방 생성 -->
			<div id="createChatRoom" style="display: none;">
				<div id="close-box-wrap">
					<button id="close-box"><span class="material-symbols-outlined" style="font-size: 21px; font-weight: bold;">close</span></button>
				</div>
				<h4 class="roomH4"><label for="chatRoomName1">채팅방 이름</label></h4>
				<input type="text" id="chatRoomName1" placeholder="채팅방 이름 입력">
				<div id="roomList">
					<h4 class="roomH4">모임 / 채팅 상대 선택</h4>
					<hr style="margin: 0;">
					<c:forEach items="${roomList }" var="rl">
						<div class="border-radio">
							<label for="${rl.roomNo }" class="room-n">${rl.roomName }</label>
							<input type="radio" name="roomNo" value="${rl.roomNo }" id="${rl.roomNo }" class="room-check-box"><br>
						</div>
						<div class="roomMemberList" id="${rl.roomNo }">
							<c:forEach items="${roomJoinMemberList }" var="rjml">
								<c:if test="${rl.roomNo eq rjml.roomNo }">
									<div class="member-radio border-radio" id="${rl.roomNo }" style="display: none;">
										<label for="${rl.roomNo }${rjml.userNo }" class="room-n">${rjml.userId }</label>	
										<input type="radio" name="userId" value="${rjml.userId }" id="${rl.roomNo }${rjml.userNo }" class="room-check-box"><br>
									</div>
								</c:if>
							</c:forEach>
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
				<div class="nomal_chat chat_cate">개인 채팅</div>
				<div class="group_chat">그룹 채팅</div>
				<div class="cl_hover hover1" style="">
					<c:forEach items="${chatList }" var="cl">
						<c:if test="${rl.roomNo eq cl.roomNo and cl.inviteUserNo > 0}">
							<button class="chatRoomName2" value="${cl.chatRoomNo }" onclick="enter(${cl.chatRoomNo })">${cl.chatRoomName }</button>
						</c:if>
					</c:forEach>
				</div>
				<div class="cl_hover hover2" style="display: none;">
					<c:forEach items="${chatList }" var="cl">
						<c:if test="${rl.roomNo eq cl.roomNo and cl.inviteUserNo eq 0}">
							<button class="chatRoomName2" value="${cl.chatRoomNo }" onclick="enter(${cl.chatRoomNo })">${cl.chatRoomName }</button>
						</c:if>
					</c:forEach>
				</div>
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




