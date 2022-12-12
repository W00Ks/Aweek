<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	
   var ws = new WebSocket("ws://localhost:8888/replyEcho");
   socket = ws;
   
   ws.onopen = onOpen;
   ws.onmessage = onMessage;
   ws.onclose = onClose;

   // 서버 접속
   function onOpen() {
   	   console.log("Info: connection opened.")
   }
   
   // 메시지 전송
   function sendMessage(i, j) {
	   
	   //이모티콘일 때 동작
	   if(i == 5) var msg = j.split(".");
	   
	   if(i == 1) { 	   //채팅 메시지 처리
		   ws.send($("#message").val());
	   } else if(i == 2) { //방 생성 메시지 처리
		   ws.send($("#chatRoomName1").val() + ":" + $('input[name=roomNo]:checked').val() + ":" + $("#ajaxChatRoomNo").val());
	   } else if(i == 3) { //나가기 메시지 처리
		   ws.send("exit:채팅방 나가기");
	   } else if(i == 4) { //첨부파일 메시지 처리
		   //이미지 파일 형식
		   if(j == 0) {
			   ws.send($("img[name=wsFile]").attr("src") + ":4:" + $("img[name=wsFile]").attr("id"));
			   $("img[name=wsFile]").attr("name", "");
		   } else { //나머지 파일 형식
			   console.log("푸터에서 확인  - " + $("input[name=wsFile]").attr("id") + ":" + $("input[name=wsFile]").val() + ":4")
			   ws.send($("input[name=wsFile]").attr("id") + ":" + $("input[name=wsFile]").val() + ":4");
			   $("input[name=wsFile]").attr("name", "");
		   }
	   } else if(msg[1] == 'png') { //이모티콘 메시지 처리
		   ws.send(j);
	   }
   }
   
   //중복입장 여부 체크용 배열
   var idArr = [];
   
   // 서버로부터 메시지를 받았을 때
   function onMessage(msg) {
       console.log("+ + + onMessage + + +");
       var data = msg.data;
       
       var enter = data.split(" "); 	//입장 메시지인지 확인
       var uid = data.split(":"); 		//유저 아이디 확인
       var roomMsg = data.split(":");	//방 생성 메시지인지 확인
       var emoMsg = data.split(":");
       //--- 입장/퇴장 메시지 처리 ---
       if(enter[1] == "입장하셨습니다." && roomMsg[0] != "Create Room") {
    	   console.log("+ + + 입장 메시지 + + +");
    	   
    	   if(idArr.indexOf(enter[0]) < 0) {
	    	    //입장 메시지 띄우기
	       		$("#MessageArea").append("<div style='text-align: center; margin: 10px 0;'><div class='enterMsgDiv'>" + enter[0] + " " + enter[1] + "</div></div>");
	       		
	       		//채팅창 스크롤 최하단으로 내리기
	      	 	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
	      		
	       		//본인 메시지만 INSERT
				if('${member.userId }님이' == enter[0]) {
					//Insert Chat to DB (1포함)
		   	    	insertChat(enter[2], enter[1], dateFormat('time'), 1);
				}
				
		    	//입장 여부 저장
		    	idArr.push(enter[0]);
    	   }
      	 	
       } else if(enter[1] == "나가셨습니다." && roomMsg[0] != "Create Room") {
    	   console.log("+ + + 퇴장 메시지 + + +");
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
       if(uid[0] == "${member.userId }" && roomMsg[0] != "Create Room" && enter[1] != "입장하셨습니다." && enter[1] != "나가셨습니다."&& emoMsg[2] != 'emoticon') {
    	   console.log("+ + + Sender 메시지 + + +");
    	   
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
    	    } else {
	   	    	$("#MessageArea").append("<div style='text-align: right;'>" 
	   	    								+ "<div class='timeDiv'>" 
	   	    									+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
	   	    								+ "</div>" 
	   	    								+ "<div class='chatSendMsg'>" + uid[1] + "</div>" 
	   	    							+ "</div>");
	   	   		//Insert Chat to DB
	   	    	insertChat(roomMsg[2], uid[1], dateFormat('time'), 0);
    	    }
    	    
      	    $("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
    	   
       } else if(uid[0] != "${member.userId }" && enter[1] != "입장하셨습니다." && enter[1] != "나가셨습니다." && roomMsg[0] != "Create Room"&& emoMsg[2] != 'emoticon') {
    	    console.log("+ + + Receiver 메시지 + + +");
    	   
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
      	if(roomMsg[0] == "Create Room" && roomMsg[2] != '4' && roomMsg[3] != '4') {
      		console.log("+ + + Room Create 메시지 + + +");
      		
      		//Apply Room Creation
   	   		$('.chatRoomList[id=' + roomMsg[2] + ']').append("<button class='chatRoomName2' value='" + roomMsg[3] + "' onclick='enter(" + roomMsg[3] + ")'>" + roomMsg[1] + "</button><br>");
      		
      		//생성과 동시에 입장 시키기
      		if(roomMsg[4] == roomMsg[5]) {
	      		$('.chatRoomName2[value=' + roomMsg[3] + ']').click();
      		}
      		
      	//File Upload 메시지 처리
      	} else if(roomMsg[2] == '4' && enter[1] != "입장하셨습니다." && enter[1] != "나가셨습니다." && roomMsg[3] != '4') {
      		console.log("+ + + file upload 메시지(1) + + +");
      		console.log("+ + + " + data);
      		
      		if(roomMsg[4] == "${member.userId }") {
      			
	      		$("#MessageArea").append("<div style='text-align: right;'>"
											+ "<a class='imgFile btn-send-download' href='/chat/fileDownload?chatFileNo=" + roomMsg[3] + "'>" 
												+ "<span class='material-symbols-outlined btn-download'>download</span>"
											+ "</a>"
											+ "<div class='timeDiv'>"
												+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
											+ "</div>"
											+ "<img class='sendImg' alt='none' src='${pageContext.request.contextPath}" + roomMsg[1] + "'>" 
											+ "<div style='margin: 35px;'></div>"
										+ "</div>");
	      		
	      		$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
	      		
      		} else {
      			
      			$("#MessageArea").append("<div class='rMsg' style='text-align: left;'>"
											+ "<div class='chatUserName'>" + roomMsg[4] + "</div>"
					      					+ "<img class='rImg' alt='none' src='${pageContext.request.contextPath}" + roomMsg[1] + "'>" 
					      					+ "<div class='rtimeDiv'>"
												+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
											+ "</div>" 
											+ "<a class='imgFile btn-recv-download' href='/chat/fileDownload?chatFileNo=" + roomMsg[3] + "'>"
						      					+ "<span class='material-symbols-outlined rbtn-download'>download</span>"
					      					+ "</a>"
											+ "<div style='margin: 35px;'></div>"
										+ "</div>");
      			
      			$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      		}
      		
      	} else if(roomMsg[3] == '4' && enter[1] != "입장하셨습니다." && enter[1] != "나가셨습니다.") {
      		console.log("+ + + file upload 메시지(2) + + +");
      		console.log("+ + + " + data);
      		
			if(roomMsg[4] == "${member.userId }") {
      			
	      		$("#MessageArea").append("<div style='text-align: right;'>"
											+ "<div class='timeDiv'>"
												+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
											+ "</div>" 
											+ "<div class='chatSendMsg'>"
												+ "<a class='notImgFile' href='/chat/fileDownload?chatFileNo=" + roomMsg[1] + "'>" + roomMsg[2] + "</a>" 
											+ "</div>"
										+ "</div>");
	      		
	      		$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
	      		
      		} else {
      			
      			$("#MessageArea").append("<div class='rMsg' style='text-align: left;'>"
											+ "<div class='chatUserName'>" + roomMsg[4] + "</div>"
											+ "<div class='chatReceiveMsg'>"
												+ "<a class='notImgFile-r' href='/chat/fileDownload?chatFileNo=" + roomMsg[1] + "'>" + roomMsg[2] + "</a>" 
											+ "</div>"
											+ "<div class='rtimeDiv'>"
												+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
											+ "</div>" 
										+ "</div>");
      			
      			$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
      		}
      		
      	}
      	
     	//이모티콘 띄우기 부분
        if(emoMsg[2] == 'emoticon') {
        	console.log("+ + + emoticon 메시지 + + +");
        	//내가 보낸 이모티콘
        	if(emoMsg[0] == "${member.userId }") {
        		$("#MessageArea").append("<div style='text-align: right;'>" 
        									+ "<div class='timeDiv'>" 
        										+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
        									+ "</div>" 
        									+ "<img class='emoticonMsg' src='" + emoMsg[1] + "'>" 
        									+ "<div style='margin: 23px;'></div>"
        									+ "</div>");
        		
	    	  	//Insert Chat to DB
	   	    	insertChat(roomMsg[3], emoMsg[1], dateFormat('time'), 4);
	     	    return false;
	     	    
        	} else {
        		$("#MessageArea").append("<div class='rMsg' style='text-align: left;'>" 
        				+ "<div class='chatUserName'>" + emoMsg[0] + "</div>"
						+ "<img class='remoticonMsg' src='" + emoMsg[1] + "'>" 
						+ "<div class='timeDiv'>" 
							+ "<p class='chatTime'>" + dateFormat('time') + "</p>" 
						+ "</div>" 
						+ "<div style='margin: 36px;'></div>"
						+ "</div>");
        	}
        	
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
  	 	
  	 	if(hh == 0) {
  	 		hh = 12;
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