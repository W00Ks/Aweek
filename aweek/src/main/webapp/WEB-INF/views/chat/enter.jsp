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

<link rel="stylesheet" type="text/css" href="/resources/css/chatEnter.css">

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
			<c:when test="${ch.chatContent eq '입장하셨습니다.' }"> <!-- 입장이면 띄위기 -->
				<div style='text-align: center; margin: 10px 0;'>
					<div class='enterMsgDiv'>${ch.userId }님이 ${ch.chatContent }</div>
				</div>
				<c:set var="cnt" value="0"/>
			</c:when>
			<c:when test="${member.userNo ne ch.userNo and ch.chatContent eq '나가셨습니다.' }"> <!-- 본인이 아니고, 나가기 -->
				<div style='text-align: center; margin: 10px 0;'>
					<div class='enterMsgDiv'>${ch.userId }님이 ${ch.chatContent }</div>
				</div>
				<c:set var="cnt" value="0"/>
			</c:when>
			<c:when test="${member.userNo eq ch.userNo and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' and ch.chatKind ne '4' and ch.chatKind ne '5'}"> <!-- 본인, 나가기X, 사진X -->	  
				<div style='text-align: right;'>
		   	    	<div class='timeDiv'>
		   	    		<p class='chatTime'>${ch.chatTime }</p>
		   	    	</div>
		   	    	<div class='chatSendMsg'>${ch.chatContent }</div>
		   	    </div>
		   	    <c:set var="cnt" value="0"/>
			</c:when>
			<c:when test="${cnt eq 0  and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' and ch.chatKind ne '4' and ch.chatKind ne '5'}"> <!-- 본인, 나가기X, 사진X -->	
				<div class='rMsg' style='text-align: left;'> 
	       			<div class='chatUserName'>${ch.userId }</div>
	       			<div class='chatReceiveMsg'>${ch.chatContent }</div>
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       		</div>
	       		<c:set var="cnt" value="1"/>
			</c:when>
	       	<c:when test="${cnt ne 0  and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' and ch.chatKind ne '4' and ch.chatKind ne '5'}">
				<div class='rMsg' style='text-align: left;'>
	       			<div class='chatReceiveMsg'>${ch.chatContent }</div>
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       		</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '3' and ch.chatContent ne '나가셨습니다.' and member.userNo eq ch.userNo}"><!-- Img File -->
	       		<div style="text-align: right;">
	       			<a class='imgFile btn-send-download' href='/chat/fileDownload?chatFileNo=${ch.chatFileNo }'>
						<span class="material-symbols-outlined btn-download">download</span>
					</a>
					<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
					<img class="sendImg" alt="none" src="${pageContext.request.contextPath}/upload/${ch.chatContent }">
					<div style="margin: 35px;"></div>
				</div>
				<c:set var="cnt" value="0"/>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '3' and ch.chatContent ne '나가셨습니다.' and member.userNo ne ch.userNo}"><!-- Img File -->
				<div class='rMsg' style='text-align: left;'> 
	       			<div class='chatUserName'>${ch.userId }</div>
	       			<img class="rImg" alt="none" src="${pageContext.request.contextPath}/upload/${ch.chatContent }">
	       			<div class='rtimeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       			<a class='imgFile btn-recv-download' href='/chat/fileDownload?chatFileNo=${ch.chatFileNo }'>
	       				<span class="material-symbols-outlined rbtn-download">download</span>
	       			</a>
					<div style="margin: 35px;"></div>
	       		</div>
	       		<c:set var="cnt" value="0"/>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '5' and ch.chatContent ne '나가셨습니다.' and member.userNo eq ch.userNo }"><!-- Not Img File -->
	       		<div style='text-align: right;'>
				<div class='timeDiv'>
					<p class='chatTime'>${ch.chatTime }</p> 
				</div>
				<div class='chatSendMsg'>
					<a class='notImgFile' href='/chat/fileDownload?chatFileNo=${ch.chatFileNo }'>${ch.chatOriginName }</a> 
				</div>
				</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '5' and ch.chatContent ne '나가셨습니다.' and member.userNo ne ch.userNo }"><!-- Not Img File -->
				<div class='rMsg' style='text-align: left;'>
					<div class='chatUserName'>${ch.userId }</div>
					<div class='chatReceiveMsg'>
						<a class='notImgFile-r' href='/chat/fileDownload?chatFileNo=${ch.chatFileNo }'>${ch.chatOriginName }</a> 
					</div>
					<div class='rtimeDiv'>
					<p class='chatTime'>${ch.chatTime }</p> 
					</div> 
				</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '4' and ch.chatContent ne '나가셨습니다.' and member.userNo eq ch.userNo }"><!-- Emoticon -->
	       		<div style="text-align: right;">
					<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       			<img class="emoticonMsg" src="${ch.chatContent }">
					<div style="margin: 23px;"></div>
				</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '4' and ch.chatContent ne '나가셨습니다.' and member.userNo ne ch.userNo }"><!-- Emoticon -->
				<div class='rMsg' style='text-align: left;'> 
	       			<div class='chatUserName'>${ch.userId }</div>
	       			<img class="remoticonMsg" src="${ch.chatContent }">
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
					<div style="margin: 36px;"></div>
	       		</div>
	       	</c:when>
			</c:choose>
		</c:forEach>
	</div>
	<div id="textbarDiv">
		<!-- 메시지 하단 기능 -->
		<div id="message-menu">
			<!-- 파일 전송 form -->
			<textarea id="message" autofocus placeholder="메시지를 입력해주세요. (Enter: 전송 / Shift + Enter: 줄바꿈)"></textarea>
			<form id="btnAddFile" enctype="multipart/form-data">
				<label for="file">
					<span class="material-symbols-outlined" style="transform: rotate(45deg);" title="파일전송">attach_file</span>
				</label>
				<input type="file" name="file" id="file" onchange="fileUpload()">
			</form>
			<!-- 이모티콘 전송 -->
			<div id="emoticonContainer" style="display: none;" class="area">
				<img class='emoticon' src='/resources/chat/grinning-face_1f600.png'>
				<img class="emoticon" src="/resources/chat/grinning-face-with-big-eyes_1f603.png">
				<img class="emoticon" src="/resources/chat/grinning-face-with-smiling-eyes_1f604.png">
				<img class="emoticon" src="/resources/chat/beaming-face-with-smiling-eyes_1f601.png">
				<img class="emoticon" src="/resources/chat/grinning-squinting-face_1f606.png">
				<img class="emoticon" src="/resources/chat/grinning-face-with-sweat_1f605.png">
				<img class="emoticon" src="/resources/chat/rolling-on-the-floor-laughing_1f923.png">
				<img class="emoticon" src="/resources/chat/face-with-tears-of-joy_1f602.png">
				<img class="emoticon" src="/resources/chat/slightly-smiling-face_1f642.png">
				<img class="emoticon" src="/resources/chat/upside-down-face_1f643.png">
				<img class="emoticon" src="/resources/chat/melting-face_1fae0.png">
				<img class="emoticon" src="/resources/chat/winking-face_1f609.png">
				<img class="emoticon" src="/resources/chat/smiling-face-with-smiling-eyes_1f60a.png">
				<img class="emoticon" src="/resources/chat/smiling-face-with-halo_1f607.png">
				<img class="emoticon" src="/resources/chat/smiling-face-with-hearts_1f970.png">
				<img class="emoticon" src="/resources/chat/smiling-face-with-heart-eyes_1f60d.png">
				<img class="emoticon" src="/resources/chat/star-struck_1f929.png">
				<img class="emoticon" src="/resources/chat/face-blowing-a-kiss_1f618.png">
				<img class="emoticon" src="/resources/chat/kissing-face_1f617.png">
				<img class="emoticon" src="/resources/chat/smiling-face_263a-fe0f.png">
				<img class="emoticon" src="/resources/chat/kissing-face-with-closed-eyes_1f61a.png">
				<img class="emoticon" src="/resources/chat/kissing-face-with-smiling-eyes_1f619.png">
				<img class="emoticon" src="/resources/chat/smiling-face-with-tear_1f972.png">
				<img class="emoticon" src="/resources/chat/face-savoring-food_1f60b.png">
				<img class="emoticon" src="/resources/chat/face-with-tongue_1f61b.png">
				<img class="emoticon" src="/resources/chat/winking-face-with-tongue_1f61c.png">
				<img class="emoticon" src="/resources/chat/zany-face_1f92a.png">
				<img class="emoticon" src="/resources/chat/squinting-face-with-tongue_1f61d.png">
				<img class="emoticon" src="/resources/chat/money-mouth-face_1f911.png">
				<img class="emoticon" src="/resources/chat/hugging-face_1f917.png">
				<img class="emoticon" src="/resources/chat/face-with-hand-over-mouth_1f92d.png">
				<img class="emoticon" src="/resources/chat/face-with-open-eyes-and-hand-over-mouth_1fae2.png">
				<img class="emoticon" src="/resources/chat/face-with-peeking-eye_1fae3.png">
				<img class="emoticon" src="/resources/chat/face-vomiting_1f92e.png">
				<img class="emoticon" src="/resources/chat/face-with-symbols-on-mouth_1f92c.png">
				<img class="emoticon" src="/resources/chat/ghost_1f47b.png">
				<img class="emoticon" src="/resources/chat/alien_1f47d.png">
				<img class="emoticon" src="/resources/chat/angry-face-with-horns_1f47f.png">
				<img class="emoticon" src="/resources/chat/hundred-points_1f4af.png">
				<img class="emoticon" src="/resources/chat/blue-heart_1f499.png">
				<img class="emoticon" src="/resources/chat/green-heart_1f49a.png">
				<img class="emoticon" src="/resources/chat/orange-heart_1f9e1.png">
				<img class="emoticon" src="/resources/chat/purple-heart_1f49c.png">
				<img class="emoticon" src="/resources/chat/red-heart_2764-fe0f.png">
				<img class="emoticon" src="/resources/chat/yellow-heart_1f49b.png">
				<img class="emoticon" src="/resources/chat/pile-of-poo_1f4a9.png">
			</div>
			<span class="material-symbols-outlined btnEmoticon area" title="이모지">sentiment_satisfied</span>
		</div>
		<input type="button" id="sendBtn" value="전 송" disabled />
	</div>
</div>
<input type="hidden" id="roomNoforChat" value="">
<input type="hidden" id="chatTimeforChat" value="">
</body>

<script type="text/javascript">

$("#message").focus();

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
	console.log($("#message").html());
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

setTimeout(function() {
	console.log("채팅방 접속! 스크롤 내리기")
	$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
}, 50);

let target = document.querySelector("#MessageArea");

// 감시자 인스턴스 만들기
let observer = new MutationObserver((mutations) => {
    
    // 노드가 변경 됐을 때의 작업
    setTimeout(function() {
		console.log("동적 감지! 스크롤 내리기")
		$("#MessageArea").scrollTop($("#MessageArea")[0].scrollHeight);
	}, 10);
    
})

// 감시자의 설정
let option = {
    attributes: true,
    childList: true,
    characterData: true
};

// 대상 노드에 감시자 전달
observer.observe(target, option)

//File Upload Method
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
			console.log(res.chatOriginName)
			
			var type = res.chatOriginName.split(".");
			console.log("file type : " + type[1]);
			
			if(type[1] == 'jpg' || type[1] == 'png' || type[1] == 'gif') {

				$("#MessageArea").append("<div style='text-align: right; display: none;'>"
											+ "<img name='wsFile' id='" + res.chatFileNo + "' class='sendImg' alt='none' src='${pageContext.request.contextPath}/upload/" + res.chatStoredName + "'>" 
										+ "</div>");
				
				//ws send
				sendMessage(4, 0);
			} else {

				$("#MessageArea").append("<div style='text-align: right; display: none;'>"
											+ "<input name='wsFile' id='" + res.chatFileNo + "' value='" + res.chatOriginName + "'>" 
										+ "</div>");
				
				//ws send
				sendMessage(4, 1);
			}
			
		}
		, error: function( res ) {
			console.log("AJAX 실패")
		}
		
	})
	
}
	
//이모티콘 보내기
$(".btnEmoticon").click(function() {
	
	var state = $('#emoticonContainer').attr("style");
	if(state == "display: none;") {
		$('#emoticonContainer').attr("style", "display: block;");
	} else {
		$('#emoticonContainer').attr("style", "display: none;");
	}
	
})

$(".emoticon").click(function() {
	
	sendMessage(5, $(this).attr("src"));
	$('#emoticonContainer').attr("style", "display: none;");
	
})

$('html').click(function(e) {   
	if(!$(e.target).hasClass("area")) {
		$('#emoticonContainer').attr("style", "display: none;");
	}
}); 

</script>

<%@ include file="./chatFooter.jsp" %>

</html>