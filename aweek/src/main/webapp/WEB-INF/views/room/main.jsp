<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/roomHeader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

html {
	height: 100vh;	
}
body {
	height: calc(100% - 53px);
	 -ms-overflow-style: none;
 }
body::-webkit-scrollbar {
  display: none;
}
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
	font-family: 'NanumSquareNeo-Variable';
}
.container {
	display: flex;
	min-height: 100%;
}
.container__left {
	width: 300px;
	min-height: 100%;
	background-color: var(--text-color);
	border-right: 1px solid var(--border-color);
}
.container__left .btn-menu {
	display: flex;
	align-content: center;
	margin: 50px auto;
	padding: 0 50px;
}
.resizer {
  background-color: var(--border-color);
  cursor: ew-resize;
  min-height: 100%;
  width: 2px;
}
.container__right {
	width: 80%;
	min-height: calc(100% - 52px);
	background-color: var(--light-color);
	flex: 1;
}
.container__right .main-wrap {
	margin: 35px;
}
.container__right .main-wrap .main-title {
	padding: 40px 20px;
    margin: 0 10%;
    border-bottom: 2px solid var(--border-color);
}
.container__right .main-wrap .main-title h1 {
	text-align: center;
    font-size: 35px;
}


.container__right .main-wrap .roomBox-wrap {
	margin: 50px 10%;
    display: flex;
    flex-wrap: wrap;
    gap: 30px 2%;
    justify-content: space-between;
    

}
.container .roomBox-wrap .roomBox {
	width: 30%;
    height: 270px;
    padding: 20px;
	background-color: var(--text-color);
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 20%);
    border-radius: 20px;
    box-sizing: border-box;
    cursor: pointer;

    z-index: 1;
}

.container .roomBox-wrap .roomBox .roomName {
	padding: 10px 0 20px;
    border-bottom: 3px solid var(--light-color);
    text-align: center;
    font-size: 18px;
    word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
    width: 100%;
    white-space: nowrap;
}
.container .roomBox-wrap .roomBox .roomIntroduce{
	margin-top: 20px;
    height: 135px;
    font-size: 15px;
    word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: break-word;
    display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 9;
}

.container .roomBox-wrap .roomBox .bottom-wrap {
	display: flex;
	justify-content: space-between;
	position: relative;
	margin-top: 10px;
}
.container .roomBox-wrap .roomBox .roomPublic{
	font-size: 15px;
	color: var(--background-color--);
}
.container .roomBox-wrap .roomBox .dropOut {
	font-size: 15px;
	z-index: 9;	
	position: absolute;
	right: 0;
}

@media screen and (max-width: 768px) {
	.container__left {
		display: none;
	}
	
	.container__right {
		width: 100%;
	}
	
	.container__right .main-wrap .roomBox-wrap {
    margin: 50px 0%;
	}
	.container .roomBox-wrap .roomBox {
	    width: 48%;
	}
}




</style>

<script defer type="text/javascript">
function moveSetting(i){
	location.href = "/room/roomInfo?roomNo=" + i;
}

function roomOpen(){
	let userNo = document.querySelector(".userNo").value
 	location.href = "/room/open?userNo=" + userNo;
}

function roomList(){
	let userNo = document.querySelector(".userNo").value
	location.href = "/room/roomList?userNo=" + userNo;
}

function roomDelete(roomName,roomNo){
	
	let userNo = $(".userNo").val();
	
	console.log(roomName)
	console.log(userNo)
	console.log(roomNo)
	
 	let conf = confirm( roomName + " 모임을 삭제 하시겠습니까?");
	
	if(conf){
	   
		$.ajax({
	        type:"post"
	        , url: "./delete"
	       	, data : {
				roomNo : roomNo
			}
			, dataType : "html"
	        , success : function( result ) {
	        	console.log("secess userNo:" + userNo)
	        	console.log("secess roomNo:" + roomNo)
                alert("삭제가 완료 되었습니다");
	        	location.href="/room/main";
	        }
			, error : function() {
				console.log("error")
                alert("삭제에 실패했습니다");
				return false;
			}
	    });
	}
	
}
function dropOut(roomName,roomNo){
	
	let userNo = $(".userNo").val();
	
	console.log(roomName)
	console.log(userNo)
	console.log(roomNo)
	
 	let conf = confirm( roomName + " 모임을 탈퇴 하시겠습니까?");
	
	if(conf){
	   
		$.ajax({
	        type:"post"
	        , url: "./dropOut"
	       	, data : {
				roomNo : roomNo
			}
			, dataType : "html"
	        , success : function( result ) {
	        	console.log("secess userNo:" + userNo)
	        	console.log("secess roomNo:" + roomNo)
                alert("탈퇴가 완료 되었습니다");
	        	location.href="/room/main";
	        }
			, error : function() {
				console.log("error")
                alert("탈퇴에 실패했습니다");
				return false;
			}
	    });
	}
	
}



function roomBox() {
	
/* 	var arr = new Array();
	
	<c:forEach items="${myRoomList  }" var="room">
		arr.push({
			roomName : "${room.roomName }"
			, roomIntroduce : "${room.roomIntroduce }"
		});
	</c:forEach>
	
	for(var i=0; i < arr.length; i++) {
		
		console.log(arr[i].roomName)
		console.log(arr[i].roomIntroduce)
		
	} */
	
/* 	let roomName = [];
	
	<c:forEach items="${myRoomList  }" var="room">
		roomName.push("${room.roomName }");
	</c:forEach>
	
	let cutName = [];
	let cut
	
	for(var i=0; i < roomName.length; i++) {
		
		cutName = roomName[i]
		
		if( cutName.length >= 10 ){
			
			cut = cutName.subString(10, -1);
			
			console.log(cut)
		}
		
		console.log("cutName : " + cutName)
	}
	
	console.log(roomName)
	 */
	
		
}

//대상 Element 선택
/* const resizer = document.querySelector('.resizer');
console.log(resizer)
const leftSide = resizer.previousElementSibling;
console.log(leftSide)
const rightSide = resizer.nextElementSibling;

// 마우스의 위치값 저장을 위해 선언
let x = 0;
let y = 0;

// 크기 조절시 왼쪽 Element를 기준으로 삼기 위해 선언
let leftWidth = 0;

// resizer에 마우스 이벤트가 발생하면 실행하는 Handler
const mouseDownHandler = function (e) {
    // 마우스 위치값을 가져와 x, y에 할당
    x = e.clientX;
    y = e.clientY;
    // left Element에 Viewport 상 width 값을 가져와 넣음
    leftWidth = leftSide.getBoundingClientRect().width;

    // 마우스 이동과 해제 이벤트를 등록
    document.addEventListener('mousemove', mouseMoveHandler);
    document.addEventListener('mouseup', mouseUpHandler);
};

const mouseMoveHandler = function (e) {
    // 마우스가 움직이면 기존 초기 마우스 위치에서 현재 위치값과의 차이를 계산
    const dx = e.clientX - x;
    const dy = e.clientY - y;

  	// 크기 조절 중 마우스 커서를 변경함
    // class="resizer"에 적용하면 위치가 변경되면서 커서가 해제되기 때문에 body에 적용
    document.body.style.cursor = 'col-resize';
    
    // 이동 중 양쪽 영역(왼쪽, 오른쪽)에서 마우스 이벤트와 텍스트 선택을 방지하기 위해 추가
    leftSide.style.userSelect = 'none';
    leftSide.style.pointerEvents = 'none';
    
    rightSide.style.userSelect = 'none';
    rightSide.style.pointerEvents = 'none';
    
    // 초기 width 값과 마우스 드래그 거리를 더한 뒤 상위요소(container)의 너비를 이용해 퍼센티지를 구함
    // 계산된 퍼센티지는 새롭게 left의 width로 적용
    const newLeftWidth = ((leftWidth + dx) * 100) / resizer.parentNode.getBoundingClientRect().width;
    leftSide.style.width = `${newLeftWidth}%`;
};

const mouseUpHandler = function () {
    // 모든 커서 관련 사항은 마우스 이동이 끝나면 제거됨
    resizer.style.removeProperty('cursor');
    document.body.style.removeProperty('cursor');

    leftSide.style.removeProperty('user-select');
    leftSide.style.removeProperty('pointer-events');

    rightSide.style.removeProperty('user-select');
    rightSide.style.removeProperty('pointer-events');

    // 등록한 마우스 이벤트를 제거
    document.removeEventListener('mousemove', mouseMoveHandler);
    document.removeEventListener('mouseup', mouseUpHandler);
};

// 마우스 down 이벤트를 등록
resizer.addEventListener('mousedown', mouseDownHandler);
 */
</script>


<section class="container">
    <div class="container__left">
      <div class="btn-menu">
		<div class="btn btn--brown" onclick="roomOpen()">모임개설</div>
		<div class="btn btn--brown" onclick="roomList()">모임목록</div>
     </div>
    </div>

    <div class="resizer" id="dragMe"></div>
    <div class="container__right">
    	<div class="main-wrap">
    		<div class="main-title">
				<h1>내 모임 목록</h1>
			</div>
			<div class="roomBox-wrap">
		    	<input type="hidden" name="userNo" class="userNo" value="${userno }">
				<c:forEach items="${myRoomList  }" var="room">
					<div class="roomBox" onclick="moveSetting(${room.roomNo })">
				    	<input type="hidden" name="userNo" class="roomNo" value="${room.roomNo }">
						<p class="roomName">${room.roomName }</p>
						<p class="roomIntroduce">${room.roomIntroduce }<br></p>
						
						<div class="bottom-wrap">
							<c:if test="${room.roomPublic eq '1' }"> 
								<p class="roomPublic" id="1">공개</p>
				        	</c:if>
				        	<c:if test="${room.roomPublic eq '0' }"> 
								<p class="roomPublic" id="2">비공개</p>
				        	</c:if>
				        	
				        	<c:if test ="${room.userNo eq userno}">
								<p class="dropOut" onclick="roomDelete('${room.roomName }',${room.roomNo })">삭제</p>
							</c:if>
							<c:if test ="${room.userNo ne userno}">
								<p class="dropOut" onclick="dropOut('${room.roomName }',${room.roomNo })">탈퇴</p>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
    </div>

</section>


</body>
</html>