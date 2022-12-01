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
	border: 1px solid green;
    height: 566px;
    overflow: scroll;
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
	width: 539px;
    height: 64px;
    float: left;
    resize: none;
}
#sendBtn {
	width: 111px;
    height: 70px;
}
</style>
</head>
<body>

<div id="MessageArea"></div>
<!-- <input type="text" id="message" /> -->
<textarea id="message"></textarea>
<input type="button" id="sendBtn" value="submit" disabled />
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
	
	$('#message').keydown(function(key) {
	    if (key.keyCode == 13 && $('#message').val() != '') {
	    	sendMessage();
	        $("#message").val("")
	        $('#sendBtn').attr('disabled', 'disabled');
	    }
	});
	
	$("#sendBtn").click(function() {
	   sendMessage();
	   $("#message").val("")
	   $('#sendBtn').attr('disabled', 'disabled');
	});
</script>

<%@ include file="./chatFooter.jsp" %>

</html>