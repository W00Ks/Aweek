<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#MessageArea {
	border: 1px solid #d3c3c3;
    height: calc(100% - 100px);
    overflow: scroll;
    background-color: #f3f3f3;
}
.chatSendMsg, .chatReceiveMsg {
	display: inline-block;
    border: 1px solid #444;
    padding: 10px;
    max-width: 270px;
    border-radius: 7px;
    text-align: left;
}
.chatSendMsg {
    background-color: #dfe9fb;
    border-color: #b4caf1;
    margin: 7px 22px 7px 4px;
}
.chatReceiveMsg {
    background-color: #eee;
    margin: 7px 4px 7px 22px;
}
#message {
	width: 80%;
    height: 100px;
    float: left;
    resize: none;
    box-sizing: border-box;
}
#sendBtn {
	width: 20%;
    height: 100px;
    box-sizing: border-box;
}
#textbarDiv {
    width: calc(100% - 300px);
    display: inline;
}
.chatUserName {
	margin: 0 27px -3px;
    font-size: 14px;
}
.chatTime {
	color: #333;
    display: inline-block;
    font-size: 13px;
}
.timeWrap {
	position: relative;
}
#exitArea {
	background-color: #fff;
    height: 100px;
    width: 100%;
    box-shadow: 1px 1px 4px 0px rgb(0 0 0 / 12%);
    position: sticky;
    top: 0px;
    z-index: 1;
}
</style>
</head>
<body>

<div id="msg-wrap">
	<div id="MessageArea">
		<div id="exitArea">
			<button id='btnExit' value="">채팅방 나가기</button>
		</div>
	</div>
	<div id="textbarDiv">
		<textarea id="message"></textarea>
		<input type="button" id="sendBtn" value="submit" disabled />
	</div>
</div>
<input type="hidden" id="roomNoforChat" value="">
<input type="hidden" id="chatTimeforChat" value="">
</body>

<script type="text/javascript">
	//메시지 입력 시 전송버튼 활성화
	$('#message').keyup(function() {
	    if ($('#message').val() == '') {
		    $('#sendBtn').attr('disabled', 'disabled');
	    } else {
	        $('#sendBtn').removeAttr("disabled");
	    }
	});
	
	//Enter키로 메시지 전송
	$('#message').keyup(function(key) {
		
		//빈칸일 경우
	    if(key.keyCode == 13 && $('#message').val().replace(/\s| /gi, "").length == 0) {
	    	$("#message").val("");
	        $('#sendBtn').attr('disabled', 'disabled');
	    	
	    } else if(key.keyCode == 13) {
	    	
	    	//SHIFT + ENTER 가 아닐 경우
			if(!key.shiftKey) {
				$("#message").val($("#message").val().replace(/(?:\r\n|\r|\n)/g, '<br>'));
		    	sendMessage(1);
		    	$("#message").val("");
		        $('#sendBtn').attr('disabled', 'disabled');
			} else {
	    		var content = $("#message").val();
				$("#message").val(content);
			}
	    	
	    }
		       
	});
	
	//전송버튼 클릭으로 메시지 전송
	$("#sendBtn").click(function() {
	   sendMessage(1);
	   $("#message").val("")
	   $('#sendBtn').attr('disabled', 'disabled');
	});
	
	//채팅방 나가기 버튼 클릭 이벤트
	$("#btnExit").click(function() {
	   sendMessage(3);
	   $('.chatRoomName2').removeAttr("disabled");
	   $('.chatRoomName2').removeClass("disable");
	   
	   $.ajax({
			
			type: "get"					
			, url: "/chat/mainRight"			
			, data: {}
			, dataType: "html"				
			, success: function( res ) {
				console.log("AJAX 성공")
				
				//응답 데이터 반영
				$("#content-right").html( res )
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
			
		})
	   
// 	   location.reload();
	});
	
</script>

<%@ include file="./chatFooter.jsp" %>

</html>