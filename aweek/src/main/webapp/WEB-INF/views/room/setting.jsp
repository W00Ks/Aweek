<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>


<style type="text/css">

html {
	height: 100vh;	
}
body {
	font-family: 'NanumSquareNeo-Variable';
}
.container {
	display: flex;
	min-height: calc(100vh - 53px);
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
	width: calc(100% - 300px);
	height: calc(100% - 52px);
	background-color: var(--text-color);
}
.container__right .setting-content {
    margin: 50px 10%;
    padding: 0 10%;
    display: flex;
    background-color: var(--text-color);
    flex-direction: column;
    border-radius: 10px;
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 8%);
}
.container__right .setting-content .settingTitle {
	margin: 80px auto;
}
.container__right .setting-content .settingTitle h1 {
    text-align: center;
    font-size: 35px;
    margin: 0 auto;
	padding: 30px;
	border-bottom: 1px solid var(--border-color);
	background-color: var(--text-color);
	box-sizing: border-box;
}
.container__right .setting-content .settingTitle h6 {
    text-align: center;
    font-size: 15px;
    margin-top: 30px;
}
.container__right .setting-content .object {
	display: flex;
    justify-content: space-between;
    margin: 10px 0;
}
.container__right .setting-content .object p {
	width: 15%;
    padding-top: 2px;	
}
.container__right .setting-content .object .input-placeholder{
	padding-left: 5px;
	font-family: 'NanumSquareNeo-Variable';
}
.container__right .setting-content .object input {
	width: 80%;
	border-radius: 2px;
    border: 2px solid var(--accent-color);
    box-sizing: border-box;
    background-color: transparent;
    font-size: 14px;
    height: 35px;
    padding-left: 10px;
}
.container__right .setting-content .object input:focus {
    outline: 2px solid var(--shadow--color);
}
.container__right .setting-content .object textarea {
	width: 80%;
    min-height: 200px;
    max-height: 200px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 2px var(--accent-color);
    border-radius: 2px;
    background-color: transparent;
    font-size: 14px;
    resize: none;
}
.container__right .setting-content .object select {
	width: 80%;
	height: 35px;
	font-size: 14px;
    padding-left: 5px;
}
.container__right .setting-content .object .roomPublic-section {
	width: 80%;
	display: flex;
}
.container__right .setting-content .object .roomPublic-section input {
	width: 20px;
	height: 20px;
}
.container__right .setting-content .object .roomPublic-section .public-content {
	width: 120px;
    display: flex;
    margin-left: 10px;
    padding-top: 4px;
}

.container__right .setting-content .error-msg {
	display: none;
    margin: -2px 0 6px 20%;
    font-size: 12px;
    color: var(--deepPink-color);
}

.container__right .setting-content .btnsection {
	margin: 80px 20%;
}

.btn.wide {
	width: 100%;
    margin: 10px 0;
    padding: 15px 0;
    height: 50px;
    font-size: 16px;
}

@media screen and (max-width: 768px) {
	.container__left {
		display: none;
	}
	
	.container__right {
		width: 100%;
	}
}

</style>

<script type="text/javascript">


function roomOpen(){
 	location.href = "/room/open";
}

function roomList(){
	location.href = "/room/roomList";
}
function back() {
	window.history.back();
}

//?????? ??? ????????? ?????? ??????
function settingCheck() {
	
	let roomName = document.getElementById("roomName"); 
	let roomIntroduce = document.getElementById("roomIntroduce"); 
	let roomMember = document.getElementById("roomMember"); 
	let roomCategoryNo = document.getElementById("roomCategoryNo"); 
	
	
	roomName.addEventListener('blur', function() {
		let eMsg = document.getElementById("roomName-error"); 
		if( roomName.value == "" ) {
			eMsg.style.display = "block"
			return false;
		} else {
			eMsg.style.display = "none"
			return true;
		}
	})
	roomIntroduce.addEventListener('blur', function() {
		let eMsg = document.getElementById("roomIntroduce-error"); 
		if( roomIntroduce.value == "" ) {
			eMsg.style.display = "block"
			return false;
		} else {
			eMsg.style.display = "none"
			return true;
		}
	})
}

//?????? ?????? ????????? ?????? ?????? ??? alert??? ?????????
function submit() {
	
	let roomName = document.getElementById("roomName"); 
	let roomIntroduce = document.getElementById("roomIntroduce"); 
	
	if( roomName.value == "" ) {
		swal("?????? ????????? ??????????????????","", "warning").then(function(){
        	$("input").eq(1).focus();
       	});
		return;
	}
	if( roomIntroduce.value == "" ) {
		swal("?????? ????????? ??????????????????","", "warning").then(function(){
        	$("input").eq(2).focus();
       	});
		return;
	}
		
	document.getElementById('form').submit()
	
}


</script>


<section class="container">
	<div class="container__left">
		<div class="btn-menu">
			<div class="btn" onclick="roomOpen()">????????????</div>
		<div class="btn" onclick="roomList()">????????????</div>
		</div>
	</div>
   
	<div class="resizer" id="dragMe"></div>
   
	<div class="container__right">
		<form action="./setting" method="post" id="form">
			<div class="setting-content">
				<div class="settingTitle">
					<h1>?????? ??????</h1>
					<h6>????????? ??????, ??????, ?????? ???, ????????????, ??????????????? ?????? ????????????.</h6>
				</div>
		     	<input type="hidden" name="roomNo" class="roomNo" value="${roomInfo.roomNo }">
		     	<input type="hidden" name="userNo" class="userNo" value="${roomInfo.userNo }">
		     	
		     	
		     	<div class="object">
				    <p>?????? ?????? * </p>
				    <input type="text" id="roomName" name="roomName" placeholder="?????? ????????? ???????????????!" value="${roomInfo.roomName }">
			    </div>
			    <span class="error-msg" id="roomName-error">?????? ?????? ???????????????</span>
			    <div class="object">
			    	<p>?????? ?????? * </p>
			    	<textarea cols="30" rows="1" id="roomIntroduce" name="roomIntroduce" 
			    	placeholder="?????? ????????? ???????????????!">${roomInfo.roomIntroduce }</textarea>
			    </div>
			    <span class="error-msg" id="roomIntroduce-error">?????? ?????? ???????????????</span>
			    <div class="object">
			    	<p>?????? ??? * </p>
			     	<select name="roomMember" id="roomMember">
				     	<option disabled selected>?????? ???</option>
				     	<option value="10" ${roomInfo.roomMember eq '10' ? 'selected':''}>10</option>
				     	<option value="100" ${roomInfo.roomMember eq '100' ? 'selected':''}>100</option>
				    </select>
				</div>
			    <div class="object">
			    	<p>???????????? * </p>
			    	<select name="roomCategoryNo" id="roomCategoryNo">
			    		<option disabled selected>????????????</option>
				     	<c:forEach items="${roomCategory }" var="rc" >
		 			     	<option value="${rc.roomCategoryNo }" <c:if test ="${rc.roomCategoryName eq roomCaName}">selected="selected"</c:if>>${rc.roomCategoryName }</option>
				     	</c:forEach>
			    	</select>
				</div>
				<div class="object"> 
			    	<p>???????????? * </p>
			    	<div class="roomPublic-section">
				    	<input type="radio" name="roomPublic" value="1" ${roomInfo.roomPublic eq '1' ? 'checked':''} id="roomPublicY">
				    		<div class="public-content">??????</div>
				    	<input type="radio" name="roomPublic" value="0" ${roomInfo.roomPublic eq '0' ? 'checked':''} id="roomPublicN">
				    		<div class="public-content">?????????</div>
			    	</div>
			    </div>
			    
			    <div class="btnsection">
			    	<a class="btn wide" onclick="submit()">??????</a>
			    	<a class="btn wide" onclick="back()" >??????</a>
				</div>
			</div>
		</form>
	</div>

</section>

</body>
</html>