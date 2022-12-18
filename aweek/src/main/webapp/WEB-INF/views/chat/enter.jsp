<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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
				<c:choose>
					<c:when test="${chatProfile.chatProfileStoredName eq null || chatProfile.chatProfileStoredName == null}">
						<img id="setProflieImg" class="${chatProfile.chatProfileStoredName }defaultProfImg" alt="prof" src="/resources/chat/account_circle.png">
						<!-- ws 전달용 프로필 정보 -->
						<input type="hidden" id="profileStoredName" class="${chatProfile.chatProfileStoredName }defaultProfImg">
					</c:when>
					<c:otherwise>
						<img id="setProflieImg" class="${chatProfile.chatProfileStoredName } imgs" alt="prof" src="${pageContext.request.contextPath}/upload/${chatProfile.chatProfileStoredName }">
						<!-- ws 전달용 프로필 정보 -->
						<input type="hidden" id="profileStoredName" class="${chatProfile.chatProfileStoredName }">
					</c:otherwise>
				</c:choose>
				<div id="userinfo">
					<span style="font-weight: bold; font-size: 22px;">${member.userId }</span><br>
					<span style="font-size: 15px;">${member.userEmail }</span>
				</div>
			</div>
			<div id="chatMenu" style="display: none;" class="area">
				<button id="btnExit" class='btnCM' value="">채팅방 나가기</button>
				<button id="btnProU" class='btnCM' value="">프로필 바꾸기</button>
				<input type="file" name="file" id="btnProfUp" onchange="profileUp()" style="display: none;">
			</div>
			<span class="material-symbols-outlined chatDot">more_horiz</span>
		</div>
		<div class="bigPictureWrap">
			<div class="bigPicture">
			</div>
		</div>
		<!-- 채팅 내역 출력 -->
		<c:set var="cnt" value="0"/>
		<c:set var="u_id" value="${member.userId }"/>
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
		   	    <c:set var="u_id" value="${ch.userId }"/>
			</c:when>
			<c:when test="${u_id ne ch.userId and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' and ch.chatKind ne '4' and ch.chatKind ne '5'}"> <!-- 본인, 나가기X, 사진X -->	
				<div class='rMsg' style='text-align: left;'>
					<c:choose>
						<c:when test="${ch.chatProfileStoredName eq null}">
							<img class='setProflieImgWS defaultProf' alt='prof' src='/resources/chat/account_circle.png'>
						</c:when>
						<c:otherwise>
							<img class='setProflieImgWS imgs' alt='prof' src='${pageContext.request.contextPath}/upload/${ch.chatProfileStoredName }'>
						</c:otherwise>
					</c:choose>
	       			<div class='chatUserName'>${ch.userId }</div>
	       			<div class='chatReceiveMsg'>${ch.chatContent }</div>
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       		</div>
	       		<c:set var="cnt" value="1"/>
	       		<c:set var="u_id" value="${ch.userId }"/>
			</c:when>
	       	<c:when test="${u_id eq ch.userId and ch.chatContent ne '나가셨습니다.' and ch.chatKind ne '3' and ch.chatKind ne '4' and ch.chatKind ne '5'}">
				<div class='rMsg' style='text-align: left;'>
					<c:choose>
						<c:when test="${ch.chatProfileStoredName eq null}">
							<img class='setProflieImgWS defaultProf' alt='prof' src='/resources/chat/account_circle.png'>
						</c:when>
						<c:otherwise>
							<img class='setProflieImgWS imgs' alt='prof' src='${pageContext.request.contextPath}/upload/${ch.chatProfileStoredName }'>
						</c:otherwise>
					</c:choose>
	       			<div class='chatReceiveMsg'>${ch.chatContent }</div>
	       			<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       		</div>
	       		<c:set var="cnt" value="0"/>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '3' and ch.chatContent ne '나가셨습니다.' and member.userNo eq ch.userNo}"><!-- Img File -->
	       		<div style="text-align: right;">
	       			<a class='imgFile btn-send-download' href='/chat/fileDownload?chatFileNo=${ch.chatFileNo }'>
						<span class="material-symbols-outlined btn-download">download</span>
					</a>
					<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div> 
					<img class="sendImg imgs" alt="none" src="${pageContext.request.contextPath}/upload/${ch.chatContent }">
					<div style="margin: 35px;"></div>
				</div>
				<c:set var="cnt" value="0"/>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '3' and ch.chatContent ne '나가셨습니다.' and member.userNo ne ch.userNo}"><!-- Img File -->
				<div class='rMsg' style='text-align: left;'>
					<c:choose>
						<c:when test="${ch.chatProfileStoredName eq null}">
							<img class='setProflieImgWS defaultProf' alt='prof' src='/resources/chat/account_circle.png'>
						</c:when>
						<c:otherwise>
							<img class='setProflieImgWS imgs' alt='prof' src='${pageContext.request.contextPath}/upload/${ch.chatProfileStoredName }'>
						</c:otherwise>
					</c:choose>
	       			<div class='chatUserName'>${ch.userId }</div>
	       			<img class="rImg imgs" alt="none" src="${pageContext.request.contextPath}/upload/${ch.chatContent }">
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
					<c:choose>
						<c:when test="${ch.chatProfileStoredName eq null}">
							<img class='setProflieImgWS defaultProf' alt='prof' src='/resources/chat/account_circle.png'>
						</c:when>
						<c:otherwise>
							<img class='setProflieImgWS imgs' alt='prof' src='${pageContext.request.contextPath}/upload/${ch.chatProfileStoredName }'>
						</c:otherwise>
					</c:choose>
					<div class='chatUserName'>${ch.userId }</div>
					<div class='chatReceiveMsg'>
						<a class='notImgFile-r' href='/chat/fileDownload?chatFileNo=${ch.chatFileNo }'>${ch.chatOriginName }</a> 
					</div>
					<div class='rtimeDiv'>
					<p class='chatTime'>${ch.chatTime }</p> 
					</div> 
				</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '4' and ch.chatContent ne '나가셨습니다.' and member.userNo eq ch.userNo }"><!-- emoticon -->
	       		<div style="text-align: right;">
					<div class='timeDiv'>
	       				<p class='chatTime'>${ch.chatTime }</p>
	       			</div>
	       			<img class="emoticonMsg" src="${ch.chatContent }">
					<div style="margin: 23px;"></div>
				</div>
	       	</c:when>
	       	<c:when test="${ch.chatKind eq '4' and ch.chatContent ne '나가셨습니다.' and member.userNo ne ch.userNo }"><!-- emoticon -->
				<div class='rMsg' style='text-align: left;'>
					<c:choose>
						<c:when test="${ch.chatProfileStoredName eq null}">
							<img class='setProflieImgWS defaultProf' alt='prof' src='/resources/chat/account_circle.png'>
						</c:when>
						<c:otherwise>
							<img class='setProflieImgWS imgs' alt='prof' src='${pageContext.request.contextPath}/upload/${ch.chatProfileStoredName }'>
						</c:otherwise>
					</c:choose>
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
			<textarea id="message" autofocus placeholder="메시지를 입력해주세요. (Enter: 전송 / Shift + Enter: 줄바꿈)"></textarea>
			<div id="emoSave" style="display: none;"></div>
			<!-- 파일 전송 form -->
			<form id="btnAddFile" enctype="multipart/form-data">
				<label for="file">
					<span class="material-symbols-outlined" style="transform: rotate(45deg);" title="파일전송">attach_file</span>
				</label>
				<input type="file" name="file" id="file" onchange="fileUpload()">
			</form>
			<!-- 이모티콘 전송 -->
			<div id="emoticonContainer" style="display: none;" class="area">
				<div id="sticker" class="area">스티커</div>
				<div id="emoticon" class="area btn_style">이모티콘</div>
				<div id="emo-content" class="area">
					<div id="sticker-box" style="display: none;" class="area">
						<img class='sticker area' src='/resources/chat/minions01.png'>
						<img class='sticker area' src='/resources/chat/minions02.png'>
						<img class='sticker area' src='/resources/chat/minions03.png'>
						<img class='sticker area' src='/resources/chat/minions04.png'>
						<img class='sticker area' src='/resources/chat/rabbit01.png'>
						<img class='sticker area' src='/resources/chat/rabbit02.png'>
						<img class='sticker area' src='/resources/chat/rabbit03.png'>
						<img class='sticker area' src='/resources/chat/rabbit04.png'>
						<img class='sticker area' src='/resources/chat/rabbit05.png'>
						<img class='sticker area' src='/resources/chat/rabbit06.png'>
						<img class='sticker area' src='/resources/chat/rabbit07.png'>
						<img class='sticker area' src='/resources/chat/grinning-face_1f600.png'>
						<img class="sticker area" src="/resources/chat/grinning-face-with-big-eyes_1f603.png">
						<img class="sticker area" src="/resources/chat/grinning-face-with-smiling-eyes_1f604.png">
						<img class="sticker area" src="/resources/chat/beaming-face-with-smiling-eyes_1f601.png">
						<img class="sticker area" src="/resources/chat/grinning-squinting-face_1f606.png">
						<img class="sticker area" src="/resources/chat/grinning-face-with-sweat_1f605.png">
						<img class="sticker area" src="/resources/chat/rolling-on-the-floor-laughing_1f923.png">
						<img class="sticker area" src="/resources/chat/slightly-smiling-face_1f642.png">
						<img class="sticker area" src="/resources/chat/upside-down-face_1f643.png">
						<img class="sticker area" src="/resources/chat/star-struck_1f929.png">
						<img class="sticker area" src="/resources/chat/squinting-face-with-tongue_1f61d.png">
						<img class="sticker area" src="/resources/chat/money-mouth-face_1f911.png">
						<img class="sticker area" src="/resources/chat/hugging-face_1f917.png">
						<img class="sticker area" src="/resources/chat/ghost_1f47b.png">
						<img class="sticker area" src="/resources/chat/alien_1f47d.png">
						<img class="sticker area" src="/resources/chat/angry-face-with-horns_1f47f.png">
						<img class="sticker area" src="/resources/chat/hundred-points_1f4af.png">
						<img class="sticker area" src="/resources/chat/blue-heart_1f499.png">
						<img class="sticker area" src="/resources/chat/green-heart_1f49a.png">
						<img class="sticker area" src="/resources/chat/orange-heart_1f9e1.png">
						<img class="sticker area" src="/resources/chat/purple-heart_1f49c.png">
						<img class="sticker area" src="/resources/chat/red-heart_2764-fe0f.png">
						<img class="sticker area" src="/resources/chat/yellow-heart_1f49b.png">
						<img class="sticker area" src="/resources/chat/pile-of-poo_1f4a9.png">
					</div>
					<div id="emoticon-box" class="area">
						<div class="emoticon area" id="&#128512;">&#128512;</div>
						<div class="emoticon area" id="&#128513;">&#128513;</div>
						<div class="emoticon area" id="&#128514;">&#128514;</div>
						<div class="emoticon area" id="&#128515;">&#128515;</div>
						<div class="emoticon area" id="&#128516;">&#128516;</div>
						<div class="emoticon area" id="&#128517;">&#128517;</div>
						<div class="emoticon area" id="&#128518;">&#128518;</div>
						<div class="emoticon area" id="&#128519;">&#128519;</div>
						<div class="emoticon area" id="&#128520;">&#128520;</div>
						<div class="emoticon area" id="&#128521;">&#128521;</div>
						<div class="emoticon area" id="&#128522;">&#128522;</div>
						<div class="emoticon area" id="&#128523;">&#128523;</div>
						<div class="emoticon area" id="&#128524;">&#128524;</div>
						<div class="emoticon area" id="&#128525;">&#128525;</div>
						<div class="emoticon area" id="&#128526;">&#128526;</div>
						<div class="emoticon area" id="&#128527;">&#128527;</div>
						<div class="emoticon area" id="&#128528;">&#128528;</div>
						<div class="emoticon area" id="&#128529;">&#128529;</div>
						<div class="emoticon area" id="&#128530;">&#128530;</div>
						<div class="emoticon area" id="&#128531;">&#128531;</div>
						<div class="emoticon area" id="&#128532;">&#128532;</div>
						<div class="emoticon area" id="&#128533;">&#128533;</div>
						<div class="emoticon area" id="&#128534;">&#128534;</div>
						<div class="emoticon area" id="&#128535;">&#128535;</div>
						<div class="emoticon area" id="&#128536;">&#128536;</div>
						<div class="emoticon area" id="&#128537;">&#128537;</div>
						<div class="emoticon area" id="&#128538;">&#128538;</div>
						<div class="emoticon area" id="&#128539;">&#128539;</div>
						<div class="emoticon area" id="&#128540;">&#128540;</div>
						<div class="emoticon area" id="&#128541;">&#128541;</div>
						<div class="emoticon area" id="&#128542;">&#128542;</div>
						<div class="emoticon area" id="&#128543;">&#128543;</div>
						<div class="emoticon area" id="&#128544;">&#128544;</div>
						<div class="emoticon area" id="&#128545;">&#128545;</div>
						<div class="emoticon area" id="&#128546;">&#128546;</div>
						<div class="emoticon area" id="&#128547;">&#128547;</div>
						<div class="emoticon area" id="&#128548;">&#128548;</div>
						<div class="emoticon area" id="&#128549;">&#128549;</div>
						<div class="emoticon area" id="&#128550;">&#128550;</div>
						<div class="emoticon area" id="&#128551;">&#128551;</div>
						<div class="emoticon area" id="&#128000;">&#128000;</div>
						<div class="emoticon area" id="&#128001;">&#128001;</div>
						<div class="emoticon area" id="&#128002;">&#128002;</div>
						<div class="emoticon area" id="&#128003;">&#128003;</div>
						<div class="emoticon area" id="&#128004;">&#128004;</div>
						<div class="emoticon area" id="&#128005;">&#128005;</div>
						<div class="emoticon area" id="&#128006;">&#128006;</div>
						<div class="emoticon area" id="&#128007;">&#128007;</div>
						<div class="emoticon area" id="&#128008;">&#128008;</div>
						<div class="emoticon area" id="&#128009;">&#128009;</div>
						<div class="emoticon area" id="&#128010;">&#128010;</div>
						<div class="emoticon area" id="&#128011;">&#128011;</div>
						<div class="emoticon area" id="&#128012;">&#128012;</div>
						<div class="emoticon area" id="&#128013;">&#128013;</div>
						<div class="emoticon area" id="&#128014;">&#128014;</div>
						<div class="emoticon area" id="&#128015;">&#128015;</div>
						<div class="emoticon area" id="&#128016;">&#128016;</div>
						<div class="emoticon area" id="&#128017;">&#128017;</div>
						<div class="emoticon area" id="&#128018;">&#128018;</div>
						<div class="emoticon area" id="&#128019;">&#128019;</div>
					</div>
				</div>
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

//채팅방 입장 시 메시지 입력창에 자동 포커스
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
    
    //입력한 내용이 있을 경우
    } else if(key.keyCode == 13) {
    	
    	//SHIFT + ENTER 가 아닐 경우
		if(!key.shiftKey) {
			console.log("엔터 눌러서 일로옴")
			$("#message").val($("#message").val().replace(/(?:\r\n|\r|\n)/g, '<br>'));
	    	sendMessage(1);
	    	$("#message").val("");
	    	$('#emoSave').empty();
	        $('#sendBtn').attr('disabled', 'disabled');
	        $('#sendBtn').css("background-color", "#dfdfdf");
	        $('#sendBtn').css("color", "#898888b8");
	        
	    //SHIFT + ENTER 일 경우
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
   $("#message").val("");
   $('#emoSave').empty();
   $('#sendBtn').attr('disabled', 'disabled');
   $('#sendBtn').css("background-color", "#dfdfdf");
   $('#sendBtn').css("color", "#898888b8");
}); // End of $("#sendBtn").click()

//채팅방 나가기 버튼 클릭 이벤트
$("#btnExit").click(function() {
	
	Swal.fire({
	   title: '채팅방을 나가시겠습니까?',
	   text: '채팅방에서 나가기를 하면 대화 내용이 모두 삭제됩니다.',
	   icon: 'question',
	   
	   showCancelButton: true,
	   confirmButtonColor: '#3085d6',
	   cancelButtonColor: '#d33',
	   confirmButtonText: '나가기',
	   cancelButtonText: '취소',
	   
// 	   reverseButtons: true, //버튼 반대로 설정
	   
	}).then(result => {
	   if (result.isConfirmed) { 
		   console.log('채팅방 나가기 선택함')
		   
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
		   
	   }
	});
   
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

//Profile Upload Method
$('#btnProU').click(function() {
	$('#btnProfUp').click()
})

function profileUp() {
	//파일 형식 검사
	var fileType = $('#btnProfUp').val().split('.')
	console.log("fileType: " + fileType[1])
	
	if(fileType[1] == 'jpg' || fileType[1] == 'png') {
		
		var file = $("#btnProfUp")[0];
		
		var formData = new FormData();
		formData.append("file", file.files[0]);
		
		$.ajax({
			
			type: "post"					
			, url: "/chat/profileUpload"
			, processData: false
			, contentType: false
			, data: formData
			, success: function( res ) {
				console.log("AJAX 성공")
				
				console.log(res)
				console.log($('#setProflieImg').attr('src'))
				
				$('#setProflieImg').attr('src', '${pageContext.request.contextPath}/upload/' + res.chatProfileStoredName);
				$('#profileStoredName').attr('class', res.chatProfileStoredName);$
				//메뉴 닫기
				$("#chatMenu").attr("style", "display: none;");
			}
			, error: function( res ) {
				console.log("AJAX 실패")
			}
			
		})
		
	} else {
		swal.fire('잘못된 형식의 파일입니다.', '.jpg 또는 .png 형식만 가능합니다.', 'error');
	}
	
	
	
} //End of profileUp()

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
	
} //End of fileUpload()
	
//이모티콘, 스티커 보내기
$(".btnEmoticon").click(function() {

	var state = $('#emoticonContainer').attr("style");
	if(state == "display: none;") {
		$('#emoticonContainer').attr("style", "display: block;");
	} else {
		$('#emoticonContainer').attr("style", "display: none;");
	}
	
})

$(".sticker").click(function() {
	sendMessage(5, $(this).attr("src") + ".emo");
})

//이모티콘 추가 부분
$(".emoticon").click(function() {
	
	if ($('#message').val() != '') {
        $('#sendBtn').removeAttr("disabled");
        $('#sendBtn').css("background-color", "#e78787");
        $('#sendBtn').css("color", "#fff");
    }
	
	$("#message").val($("#message").val() + $(this).attr('id'));
// 	$('#emoSave').append($(this).attr('id'));
// 	$("#message").val($("#message").val() + $('#emoSave').html());
})

$("#emoticon").click(function() {
	$('#emoticon-box').attr('style', 'display: block;');
	$('#sticker-box').attr('style', 'display: none;');
	
	$('#emoticon').addClass('btn_style');
	$('#sticker').removeClass('btn_style');
})

$("#sticker").click(function() {
	$('#sticker-box').attr('style', 'display: block;');
	$('#emoticon-box').attr('style', 'display: none;');
	
	$('#sticker').addClass('btn_style');
	$('#emoticon').removeClass('btn_style');
})

$('html').click(function(e) {   
	if(!$(e.target).hasClass("area")) {
		$('#emoticonContainer').attr("style", "display: none;");
	}
}); 

//사진 상세보기
$(document).on("click",".imgs",function(){
	var path = $(this).attr('src');
	console.log('path - ' + path)
	showImage(path);
});

function showImage(fileCallPath){
	$(".bigPictureWrap").css("display","flex").show();
	
	$(".bigPicture").html("<img src='${pageContext.request.contextPath}"+fileCallPath+"' >");
}
  
$(".bigPictureWrap").on("click", function(e){
	$('.bigPictureWrap').hide();
}); //End of showImage()

</script>

<%@ include file="./chatFooter.jsp" %>

</html>










