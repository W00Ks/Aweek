<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/roomHeader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

html {
	height: 100vh;	
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
	background-color: var(--text-color);
	flex: 1;
}
.container__right .main-wrap {
	margin: 35px 10%;
}
.container__right .main-wrap .main-title {
	padding: 40px 20px;
    width: 100%;
    border-bottom: 2px solid var(--border-color);
	box-sizing: border-box;
}
.container__right .main-wrap .main-title h1 {
	text-align: center;
    font-size: 35px;
}



.container__right .main-wrap .room-nonexistent {
	margin: 50px;
}
.container__right .main-wrap .room-nonexistent h3 {
	font-size: 25px;
}
.container__right .main-wrap .room-nonexistent .open-room-wrap {
	display: flex;
	margin: 20px 0;
}
.container__right .main-wrap .room-nonexistent .open-room-wrap span {
	display: inline-block;
    /* width: 40px; */
    font-size: 50px;
    margin: 0 10px;
    cursor: pointer;
}
.container__right .main-wrap .room-nonexistent .open-room-wrap p {
	display: flex;
    align-items: center;
    font-size: 20px;
    cursor: pointer;
}

.container__right .main-wrap .roomBox-wrap {
	margin: 50px 0;
    display: flex;
    flex-wrap: wrap;
    gap: 30px 5%;
    justify-content: flex-start;
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
.container .roomBox-wrap .roomBox:hover {
	transform: translate( 0, -1% );
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
	color: var(--deep-gray);
	font-size: 15px;
	z-index: 9;	
	position: absolute;
	right: 0;
}
.container .roomBox-wrap .roomBox .dropOut:hover {
	color: var(--soft-black);
}

@media screen and (max-width: 768px) {
	.container__left {
		display: none;
	}
	
	.container__right {
		width: 100%;
	}
	
	.container__right .main-wrap .roomBox-wrap {
    	gap: 30px 3%;
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


</script>


<section class="container">
    <div class="container__left">
      <div class="btn-menu">
		<div class="btn" onclick="roomOpen()">모임개설</div>
		<div class="btn" onclick="roomList()">모임목록</div>
     </div>
    </div>

    <div class="resizer" id="dragMe"></div>
    <div class="container__right">
    	<div class="main-wrap">
    		
    		<div class="main-title">
				<h1>내 모임 목록</h1>
			</div>
			
    		<c:if test="${empty myRoomList }">
				<div class="room-nonexistent">
					<h3>가입중인 모임이 없습니다</h3>
					<div class="open-room-wrap">
						<span class="material-symbols-outlined" onclick="roomOpen()">add_circle</span>
						<p onclick="roomOpen()">모임 개설하기</p>			
					</div>
				</div>
    		</c:if>
			
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
						</div><!-- .bottom-wrap end -->
					</div><!-- .roomBox end -->
				</c:forEach>
			</div><!-- .roomBox-wrap end -->
		</div>
    </div>

</section>


</body>
</html>