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
	   if(i == 1) { //채팅 메시지 처리
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
       
       //입장 메시지일 때 처리
       if(enter[2] == "입장하셨습니다." && roomMsg[0] != "Create Room") {
    	   
    	   if(idArr.indexOf(enter[1]) < 0) {
	    	    //입장 메시지 띄우기
	       		$("#MessageArea").append("<div style='text-align: center; margin: 10px 0;'>" + data + "</div>");
	       		
	       		//채팅창 스크롤 최하단으로 내리기
	      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
	       		
	       		//입장 여부 저장
		    	idArr.push(enter[1]);
    	   }
      	 	
       } else if(enter[2] == "나가셨습니다." && roomMsg[0] != "Create Room") {
    	   
    	 	//퇴장 메시지 띄우기
      		$("#MessageArea").append("<div style='text-align: center; margin: 10px 0;'>" + data + "</div>");
      		
      		//채팅창 스크롤 최하단으로 내리기
     	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      		
      		//입장 여부 삭제
      		idArr.splice(idArr.indexOf(enter[1]), 1);
       }
       
       //유저 메시지일 때 처리
       if(uid[0] == "${member.userId }" && roomMsg[0] != "Create Room") {
    	   
    	    //유저 메시지 띄우기
   	    	if(uid[1] == 'id') {
	   	    	$("#MessageArea").append("<div style='text-align: right;'>" 
	   	    								+ "<div class='timeDiv'>" 
	   	    									+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
	   	    								+ "</div>" 
	   	    								+ "<div class='chatSendMsg'>" + uid[2] + "</div>" 
	   	    							+ "</div>");
	    	    
	   	    	insertChat(roomMsg[2], uid[1], dateFormat('time'));
    	   } else {
	   	    	$("#MessageArea").append("<div style='text-align: right;'>" 
	   	    								+ "<div class='timeDiv'>" 
	   	    									+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
	   	    								+ "</div>" 
	   	    								+ "<div class='chatSendMsg'>" + uid[1] + "</div>" 
	   	    							+ "</div>");
	    	    
	   	    	insertChat(roomMsg[2], uid[1], dateFormat('time'));
    	   }
    	    
      	   $("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      	 	
       } else if(uid[0] != "${member.userId }" && enter[2] != "입장하셨습니다." && enter[2] != "나가셨습니다." && roomMsg[0] != "Create Room") {
    	   
    	   //상대방 메시지 띄우기
    	   if(uid[1] == 'id') {
        		$("#MessageArea").append("<div id='a' style='text-align: left;'>" 
        									+ "<div class='chatReceiveMsg'>" + uid[2] + "</div>" 
        									+ "<div class='timeDiv'>" 
        										+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
        									+ "</div>" 
        								+ "</div>");
    	   } else {
        		$("#MessageArea").append("<div id='a' style='text-align: left;'>" 
        									+ "<div class='chatUserName'>" + uid[0] + "</div>" 
        									+ "<div class='chatReceiveMsg'>" + uid[1] + "</div>" 
        									+ "<div class='timeDiv'>" 
        										+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
        									+ "</div>"
        								+ "</div>");
    	   }
    	   
      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      	 	
       }
       
     	//방 생성 메시지일 때 처리
      	if(roomMsg[0] == "Create Room") {
      		
      		//방 생성 적용하기
   	   		$('.chatRoomList[id=' + roomMsg[2] + ']').append("<button class='chatRoomName2' value='" + roomMsg[3] + "' onclick='enter(" + roomMsg[3] + ")'>" + roomMsg[1] + "</button><br>");
   	   	
      	}
     	
   }
   
   // 서버와 연결을 끊었을 때
   function onClose(evt) {
//        $("#MessageArea").append("연결 끊김");

   }
   
   //채팅 시간 구하는 함수 
   function dateFormat(x) {
	    var now = new Date(); 					//Date 객체
		var yyyy = now.getFullYear(); 			//년
  	    var mm = now.getMonth()+1;				//월
  	    mm = mm >= 10 ? mm : '0'+mm;	
  	    var dd = now.getDate();					//일
  	    dd = dd >= 10 ? dd : '0'+dd;
  	    var date = yyyy + '-' + mm + '-' + dd; 	//날짜
  	    
  	 	var hh = now.getHours();				//시
	    var amPm = hh < 12 ? '오전' : '오후';
  	 	
  	 	//12시간 기준으로 변환
  	 	if(hh > 12) {
  	 		hh = hh - 12;
  	 	}
  	 	
	    hh = hh >= 10 ? hh : '0'+hh;
	    var mi = now.getMinutes();				//분
	    mi = mi >= 10 ? mi : '0'+mi;
	    var time = hh + ':' + mi;	//시 : 분
	    
	   if(x == 'date') {
      	   return date;
	   } else if(x == 'time') {
      	   return amPm + ' ' + time;
	   }
  }
   
   //메시지 insert function
   function insertChat(a, b, c) {
	   console.log(a + " : " + b + " : " + c)
 	 	$.ajax({
 			
 			type: "post"					
 			, url: "/chat/insert"			
 			, data: {						
 				chatRoomNo: a
 				, chatContent: b
 				, chatTime: c
 			}
 			, dataType: "json"				
 			, success: function( res ) {
 				console.log("AJAX INSERT 성공")
 			}
 			, error: function() {
 				console.log("AJAX INSERT 실패")
 			}
 			
 		})
   }
   
</script>