<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    height: calc(100% - 101px);
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
    background-color: #d2c0e9;
    border-color: #b6abc7;
    margin: 7px 22px 7px 4px;
    box-shadow: 3px 3px 2px 0px rgb(0 0 0 / 30%);
}
.chatReceiveMsg {
    background-color: #eee;
    border-color: #c3c3c3;
    margin: 7px 4px 7px 22px;
    box-shadow: -3px 3px 2px 0px rgb(0 0 0 / 30%);
}
#message-menu {
	width: 80%;
    height: 100px;
    float: left;
    resize: none;
    box-sizing: border-box;
    border: 1px solid #d3c3c3;
}
#btnAddFile {
	float: left;
    border: none;
    position: absolute;
    background: none;
    padding: 0;
    margin: 5px 0 0 5px;
    height: 21px;
}
#btnAddFile span {
	color: #aaa;
}
#btnAddFile:hover span {
	color: #444;
}
#file {
	display: none;
}
#message {
	width: 100%;
    height: 71px;
    resize: none;
    box-sizing: border-box;
    border: none;
    margin-top: 25px;
}
#sendBtn {
	width: 20%;
    height: 100px;
    box-sizing: border-box;
    border: 1px solid #d3c3c3;
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
#chatRoomHeader {
	background-color: #fff;
    height: 80px;
    width: 100%;
    box-shadow: 1px 1px 4px 0px rgb(0 0 0 / 12%);
    position: sticky;
    top: 0px;
    z-index: 1;
    text-align: right;
}
#chatMenu {
	display: inline-block;
    border: 1px solid #ccc;
    width: 120px;
    padding: 10px 0;
    position: relative;
    top: 1px;
    background-color: #fff;
}
#btnExit {
	border: none;
    background: none;
    width: 100%;
    height: 35px;
}
#btnExit:hover {
	background-color: #ddd;
}
.chatDot {
	margin: 30px;
	margin: 20px 30px 30px 1px;
    font-size: 40px;
    cursor: pointer;
}
#left_profile {
	display: inline-block;
    float: left;
    margin: 8px;
    width: 300px;
}
#userinfo {
	float: left;
    text-align: left;
    margin: 13px 0 0 9px;
    line-height: 21px;
    color: #333;
}
#proflieImg {
	display: inline-block;
    float: left;
    color: #777;
    font-size: 63px;
}
.enterMsgDiv {
	display: inline-block;
    padding: 5px 15px;
    border: 1px solid #ddd;
    border-radius: 12px;
    background-color: #fdfdfd;
    box-shadow: 2px 2px 2px 0px rgb(0 0 0 / 30%);
}
.sendImg {
	display: inline-block;
    margin: 10px 22px -17px 0;
    border-radius: 10px;
    max-width: 400px;
}

</style>
</head>
<body>

<div id="msg-wrap">
	<div id="MessageArea">
		<!-- 채팅방 헤더 -->
		<div id="chatRoomHeader">
			<div id="left_profile">
				<span id="proflieImg" class="material-symbols-outlined">account_circle</span>
				<div id="userinfo">
					<span style="font-weight: bold; font-size: 22px;">${member.userId }</span><br>
					<span style="font-size: 15px;">${member.userEmail }</span>
				</div>
			</div>
			<div id="chatMenu" style="display: none;">
				<button id='btnExit' value="">채팅방 나가기</button>
			</div>
			<span class="material-symbols-outlined chatDot">more_horiz</span>
		</div>
		<!-- 채팅 내역 출력 -->
		<c:set var="cnt" value="0"/> 
		<c:forEach items="${chatHistory }" var="ch">
			<c:choose>
			<c:when test="${ch.chatContent eq '입장하셨습니다.' }">
				<div style='text-align: center; margin: 10px 0;'>
					<div class='enterMsgDiv'>${ch.userId }님이 ${ch.chatContent }</div>
				</div>
				<c:set var="cnt" value="0"/>
			</c:when>
			<c:when test="${member.userNo ne ch.userNo and ch.chatContent eq '나가셨습니다.' }">
				<div style='text-align: center; margin: 10px 0;'>
					<div class='enterMsgDiv'>${ch.userId }님이 ${ch.chatContent }</div>
				</div>
				<c:set var="cnt" value="0"/>
			</c:when>
			<c:when test="${member.userNo eq ch.userNo and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' }"> 	  
				<div style='text-align: right;'>
		   	    	<div class='timeDiv'>
		   	    		<p class='chatTime'>${ch.chatTime }</p>
		   	    	</div>
		   	    	<div class='chatSendMsg'>${ch.chatContent }</div>
		   	    </div>
		   	    <c:set var="cnt" value="0"/>
			</c:when>
			<c:when test="${cnt eq 0  and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' }"> 
				<div class='rMsg' style='text-align: left;'> 
	       			<div class='chatUserName'>${ch.userId }</div>
	       			<div class='chatReceiveMsg'>${ch.chatContent }</div>
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       		</div>
	       		<c:set var="cnt" value="1"/>
			</c:when>
	       	<c:when test="${cnt ne 0  and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' }">
				<div class='rMsg' style='text-align: left;'>
	       			<div class='chatReceiveMsg'>${ch.chatContent }</div>
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       		</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '3' and ch.chatContent ne '나가셨습니다.' }">
	       		<div style="text-align: right;">
					<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
					<img class="sendImg" alt="none" src="${pageContext.request.contextPath}/upload/${ch.chatContent }">
					<div style="margin: 35px;"></div>
				</div>
	       	</c:when>
			</c:choose>
		</c:forEach>
	</div>
	<div id="textbarDiv">
		<div id="message-menu">
			<!-- 파일 전송 form -->
			<form id="btnAddFile" enctype="multipart/form-data">
				<label for="file">
					<span class="material-symbols-outlined" style="transform: rotate(45deg);" title="파일전송">attach_file</span>
				</label>
				<input type="file" name="file" id="file" onchange="fileUpload()">
			</form>
			<textarea id="message"></textarea>
		</div>
		<input type="button" id="sendBtn" value="전 송" disabled />
	</div>
</div>
<input type="hidden" id="roomNoforChat" value="">
<input type="hidden" id="chatTimeforChat" value="">
</body>

<script type="text/javascript">
	
function fileUpload() {
	var file = $("#file")[0];
	console.log("file: ", file.files)
	
	var formData = new FormData();
	formData.append("file", file.files[0]);
	
	
	$.ajax({
		
		type: "post"					
		, url: "/chat/fileUpload"
		, processData: false
		, contentType: false
		, data: formData
		, success: function( res ) {
			console.log("AJAX 성공")
			
			console.log(res)
			console.log(res.chatStoredName)
			console.log(${pageContext.request.contextPath})
			
			$("#MessageArea").append("<div class='sendImg' style='text-align: right;'>"
										+ "<p class='chatTime'></p>" 
										+ "</div>" 
										+ "<img class='sendImg' alt='none' src='${pageContext.request.contextPath}/upload/" + res.chatStoredName + "'>" 
										+ "<div style='margin: 35px;'></div>"
									+ "</div>");
			
			//생성된 채팅방 실시간 띄우기
// 			sendMessage(2);
		}
		, error: function( res ) {
			console.log("AJAX 실패")
		}
		
	})
	
}

	//메시지 입력 시 전송버튼 활성화
	$('#message').keyup(function() {
	    if ($('#message').val() == '') {
		    $('#sendBtn').attr('disabled', 'disabled');
		    $('#sendBtn').css("background-color", "#dfdfdf");
		    $('#sendBtn').css("color", "#898888b8");
	    } else {
	        $('#sendBtn').removeAttr("disabled");
	        $('#sendBtn').css("background-color", "#e78787");
	        $('#sendBtn').css("color", "#fff");
	    }
	}); // End of $('#message').keyup()
	
	//Enter키로 메시지 전송
	$('#message').keyup(function(key) {
		
		//빈칸일 경우
	    if(key.keyCode == 13 && $('#message').val().replace(/\s| /gi, "").length == 0) {
	    	$("#message").val("");
	        $('#sendBtn').attr('disabled', 'disabled');
	        $('#sendBtn').css("background-color", "#dfdfdf");
	        $('#sendBtn').css("color", "#898888b8");
	    	
	    } else if(key.keyCode == 13) {
	    	
	    	//SHIFT + ENTER 가 아닐 경우
			if(!key.shiftKey) {
				$("#message").val($("#message").val().replace(/(?:\r\n|\r|\n)/g, '<br>'));
		    	sendMessage(1);
		    	$("#message").val("");
		        $('#sendBtn').attr('disabled', 'disabled');
		        $('#sendBtn').css("background-color", "#dfdfdf");
		        $('#sendBtn').css("color", "#898888b8");
			} else {
	    		var content = $("#message").val();
				$("#message").val(content);
			}
	    	
	    } // End of $('#message').keyup()
		       
	});
	
	//전송버튼 클릭으로 메시지 전송
	$("#sendBtn").click(function() {
	   sendMessage(1);
	   $("#message").val("")
	   $('#sendBtn').attr('disabled', 'disabled');
	   $('#sendBtn').css("background-color", "#dfdfdf");
       $('#sendBtn').css("color", "#898888b8");
	}); // End of $("#sendBtn").click()
	
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
				
				//메인 배경색 변경
				$("#content-right").css("background-color", "#f4b0b042")
				
				//응답 데이터 반영
				$("#content-right").html( res )
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
			
		})
	   
	}); // End of $("#btnExit").click()
	
	$(".chatDot").click(function() {
		var state = $("#chatMenu").attr("style");
		if(state == "display: none;") {
			$("#chatMenu").attr("style", "display: inline-block;");
		} else {
			$("#chatMenu").attr("style", "display: none;");
		}
	}) // End of $(".chatDot").click()
	
	
</script>

<%@ include file="./chatFooter.jsp" %>

</html>