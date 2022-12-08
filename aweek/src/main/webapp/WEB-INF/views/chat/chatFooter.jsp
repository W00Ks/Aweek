<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	
   var ws = new WebSocket("ws://localhost:8888/replyEcho");
   socket = ws;
   
   ws.onopen = onOpen;
   ws.onmessage = onMessage;
   ws.onclose = onClose;
   
   // 	서버 접속
   function onOpen() {
   	   console.log("Info: connection opened.")
   }
   
   // 메시지 전송 ( i : 1 = 채팅 / i : 2 = 방 생성)
   function sendMessage(i) {
	   if(i == 1) { 	   //채팅 메시지 처리
		   ws.send($("#message").val());
	   } else if(i == 2) { //방 생성 메시지 처리
		   ws.send($("#chatRoomName1").val() + ":" + $('input[name=roomNo]:checked').val() + ":" + $("#ajaxChatRoomNo").val());
	   } else if(i == 3) { //나가기 메시지 처리
		   ws.send("exit:채팅방 나가기");
	   }
   }
   
   //중복입장 여부 체크용 배열
   var idArr = [];
   
   // 서버로부터 메시지를 받았을 때
   function onMessage(msg) {
       var data = msg.data;
       
       var enter = data.split(" "); 	//입장 메시지인지 확인
       var uid = data.split(":"); 		//유저 아이디 확인
       var roomMsg = data.split(":");	//방 생성 메시지인지 확인
       
       //--- 입장/퇴장 메시지 처리 ---
       if(enter[1] == "입장하셨습니다." && roomMsg[0] != "Create Room") {
    	   
    	   if(idArr.indexOf(enter[0]) < 0) {
	    	    //입장 메시지 띄우기
	       		$("#MessageArea").append("<div style='text-align: center; margin: 10px 0;'><div class='enterMsgDiv'>" + enter[0] + " " + enter[1] + "</div></div>");
	       		
	       		//채팅창 스크롤 최하단으로 내리기
	      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
	      		
	       		//본인 퇴장 메시지만 INSERT
				if('${member.userId }님이' == enter[0]) {
					//Insert Chat to DB (1포함)
		   	    	insertChat(enter[2], enter[1], dateFormat('time'), 1);
				}
				
		    	//입장 여부 저장
		    	idArr.push(enter[0]);
    	   }
      	 	
       } else if(enter[1] == "나가셨습니다." && roomMsg[0] != "Create Room") {
    	   
    	 	//퇴장 메시지 띄우기
      		$("#MessageArea").append("<div style='text-align: center; margin: 10px 0;'><div class='enterMsgDiv'>" + enter[0] + " " + enter[1] + "</div></div>");
      		
      		//나간 유저 제외 채팅창 스크롤 최하단으로 내리기
    	 	if(enter[0] != "${member.userId }님이") {
    	 	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
    	 	}
      		
      		//본인 퇴장 메시지만 INSERT
      		if('${member.userId }님이' == enter[0]) {
				//Insert Chat to DB (1포함)
      			insertChat(enter[2], enter[1], dateFormat('time'), 1);
			}

      		//입장 여부 삭제 - 퇴장 처리
      		idArr.splice(idArr.indexOf(enter[0]), 1);
       }
       
       //--- Sender/Receiver 메시지 처리 ---
       if(uid[0] == "${member.userId }" && roomMsg[0] != "Create Room" && enter[1] != "입장하셨습니다." && enter[1] != "나가셨습니다.") {
    	   
    	    // + Sender Message Process + 
   	    	if(uid[1] == 'id') {
	   	    	$("#MessageArea").append("<div style='text-align: right;'>" 
	   	    								+ "<div class='timeDiv'>" 
	   	    									+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
	   	    								+ "</div>" 
	   	    								+ "<div class='chatSendMsg'>" + uid[2] + "</div>" 
	   	    							+ "</div>");
	   	    	//Insert Chat to DB
	   	    	insertChat(roomMsg[3], uid[2], dateFormat('time'), 0);
// 	   	    	<c:set var="count" value="${count + 1}"/>
	   	    	
// 	   	    	$("#read"+uid[2]).text(+1);
    	    } else {
	   	    	$("#MessageArea").append("<div style='text-align: right;'>" 
	   	    								+ "<div class='timeDiv'>" 
	   	    									+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
	   	    								+ "</div>" 
	   	    								+ "<div class='chatSendMsg'>" + uid[1] + "</div>" 
	   	    							+ "</div>");
	   	   		//Insert Chat to DB
	   	    	insertChat(roomMsg[2], uid[1], dateFormat('time'), 0);
// 	   	    	$("#read"+uid[2]).text(+2);
    	    }
    	    
      	    $("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      	 	
       } else if(uid[0] != "${member.userId }" && enter[1] != "입장하셨습니다." && enter[1] != "나가셨습니다." && roomMsg[0] != "Create Room") {
    	   
    	    // + Receiver 메시지 처리 +
    	    if(uid[1] == 'id') { //Repeated Message Processing
        		$("#MessageArea").append("<div style='text-align: left;'>" 
        									+ "<div class='chatReceiveMsg'>" + uid[2] + "</div>" 
        									+ "<div class='timeDiv'>" 
        										+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
        									+ "</div>" 
        								+ "</div>");
    	    } else { //First Message Processing
        		$("#MessageArea").append("<div style='text-align: left;'>" 
        									+ "<div class='chatUserName'>" + uid[0] + "</div>" 
        									+ "<div class='chatReceiveMsg'>" + uid[1] + "</div>" 
        									+ "<div class='timeDiv'>" 
        										+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
        									+ "</div>"
        								+ "</div>");
    	    }

    	    $("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      	 	
       }
       
     	//Room Create 메시지 처리
      	if(roomMsg[0] == "Create Room") {
      		//Apply Room Creation
   	   		$('.chatRoomList[id=' + roomMsg[2] + ']').append("<button class='chatRoomName2' value='" + roomMsg[3] + "' onclick='enter(" + roomMsg[3] + ")'>" + roomMsg[1] + "</button><br>");
      	}
     	
   }
   
   // 서버와 연결을 끊었을 때
   function onClose(evt) {
   }
   
   //채팅 시간 구하는 함수 
   function dateFormat(x) {
	    var now = new Date(); 					//Date 객체
  	    
  	 	var hh = now.getHours();				//시
	    var amPm = hh < 12 ? '오전' : '오후';
  	 	
  	 	//12시간 기준으로 변환
  	 	if(hh > 12) {
  	 		hh = hh - 12;
  	 	}
  	 	
	    hh = hh >= 10 ? hh : '0'+hh;
	    var mi = now.getMinutes();				//분
	    mi = mi >= 10 ? mi : '0'+mi;
	    var time = hh + ':' + mi;				//시 : 분
	    
	   if(x == 'date') {
      	   return date;
	   } else if(x == 'time') {
      	   return amPm + ' ' + time;
	   }
  } // End of dateFormat(x)
   
   //메시지 insert function
   function insertChat(roomNo, content, time, kind) {
	   console.log(roomNo + " : " + content + " : " + time + " : " + kind)
 	 	$.ajax({
 			
 			type: "post"					
 			, url: "/chat/insert"			
 			, data: {						
 				chatRoomNo: roomNo
 				, chatContent: content
 				, chatTime: time
 				, chatKind: kind
 			}
 			, dataType: "json"				
 			, success: function( res ) {
 				console.log("AJAX INSERT 성공")
 			}
 			, error: function() {
 				console.log("AJAX INSERT 실패")
 			}
 			
 		})
   } // End of insertChat(a, b, c)
   
</script>