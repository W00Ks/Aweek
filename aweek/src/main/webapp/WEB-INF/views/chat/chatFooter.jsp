<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script type="text/javascript">
	
// 	//메시지 입력 시 전송버튼 활성화
// 	$('#message').keyup(function() {
// 	    if ($('#message').val() == '') {
//  	        $('#sendBtn').attr('disabled', 'disabled');
// 	    } else {
// 	        $('#sendBtn').removeAttr("disabled");
// 	    }
//  	});
	
// 	$('#message').keydown(function(key) {
// 	    if (key.keyCode == 13 && $('#message').val() != '') {
// 	    	sendMessage();
// 	        $("#message").val("")
// 	        $('#sendBtn').attr('disabled', 'disabled');
// 	    }
//  	});
	
//    $("#sendBtn").click(function() {
//        sendMessage();
//        $("#message").val("")
//        $('#sendBtn').attr('disabled', 'disabled');
//    });
   

   var ws = new WebSocket("ws://localhost:8888/replyEcho");
   socket = ws;
   
   ws.onopen = onOpen;
   ws.onmessage = onMessage;
   ws.onclose = onClose;
   
   // 	서버 접속
   function onOpen() {
   		console.log("Info: connection opened.")
   }
   
   // 메시지 전송
   function sendMessage(i) {
	   if(i == 1) {
		   ws.send($("#message").val());
	   } else {
		   ws.send($("#chatRoomName1").val());
	   }
   }
   
   // 서버로부터 메시지를 받았을 때
   function onMessage(msg) {
       var data = msg.data;
       var enter = data.split(" "); 	//입장 메시지인지 확인
       var uid = data.split(":"); 		//유저 아이디 확인
       var roomName = data.split(":");	//방 생성 메시지인지 확인
       
       //입장 메시지일 때 처리
       if(enter[2] == "입장하셨습니다.") {
       		$("#MessageArea").append("<div style='text-align: center; margin: 10px 0;'>" + data + "</div>");
      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
       }
       
       //유저 메시지일 때 처리
       if(uid[0] == "${member.userId }") {
       		$("#MessageArea").append("<div style='text-align: right;'><div class='chatSendMsg'>" + data + "</div></div>");
      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
       } else if(uid[0] != "${member.userId }" && enter[2] != "입장하셨습니다." && roomName[0] != "방 생성 메시지"){
        	$("#MessageArea").append("<div style='text-align: left;'><div class='chatReceiveMsg'>" + data + "</div></div>");
      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
       }
       
     	//방 생성 메시지일 때 처리
      	if(roomName[0] == "방 생성 메시지") {
   	   		$("#chatList").append("<div style='text-align: left;'><div class='chatReceiveMsg'>" + data + "</div></div>");
      	}
       
   }
   
   // 서버와 연결을 끊었을 때
   function onClose(evt) {
       $("#messageArea").append("연결 끊김");

   }
    
</script>