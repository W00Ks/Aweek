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
    padding: 6px 18px;
    max-width: 270px;
    margin: 10px;
    border-radius: 7px;
}
.chatSendMsg {
    background-color: #ffcaca;
}
.chatReceiveMsg {
    background-color: #eee;
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
</style>
</head>
<body>

<div id="msg-wrap">
	<div id="MessageArea"></div>
	<div id="textbarDiv">
		<textarea id="message"></textarea>
		<input type="button" id="sendBtn" value="submit" disabled />
	</div>
</div>

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
	    if(key.keyCode == 13 && $('#message').val().replace(/\s| /gi, "").length == 0) {
	    	$("#message").val("");
	        $('#sendBtn').attr('disabled', 'disabled');
	    	
	    } else if(key.keyCode == 13) {
	    	var content = $("#message").val();
	    	
			if(!key.shiftKey) {
				$("#message").val().replace(/\n|\r\n/gi, '<br>');
		    	sendMessage(1);
		    	$("#message").val("");
		        $('#sendBtn').attr('disabled', 'disabled');
				
			} else {
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
	
	//Shift + Enter키로 개행하기
// 	$('#message').keydown(function(key) {
// 	    if(key.keyCode == 13 && $('#message').val().replace(/\s| /gi, "").length == 0) {
	    	
// 	    	$("#message").val("");
// 	        $('#sendBtn').attr('disabled', 'disabled');
	    	
// 	    } else if(key.keyCode == 13) {
	    	
// 	    	sendMessage(1);
// 	    	$("#message").val("");
// 	        $('#sendBtn').attr('disabled', 'disabled');
	    	
// 	    }
// 	});
	
</script>

<%@ include file="./chatFooter.jsp" %>

</html>