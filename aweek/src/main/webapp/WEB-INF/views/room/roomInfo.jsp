<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

<style type="text/css">

form {
	width: 100%;
}

.btn {
  width: 100px;
  padding: 10px;
  border: 1px solid var(--border-color);
  border-radius: 4px;
  background-color: var(--text-color);
  color: var(--accent-color);
  font-size: 12px;
  font-weight: 700;
  text-align: center;
  cursor: pointer;
  box-sizing: border-box;
  display: block;
  transition: .4s;
}
.btn:hover {
  background-color: var(--accent-color);
  color: var(--text-color);
}
.btn.btn--reverse {
  background-color: var(--text-color);
  color: var(--accent-color);
}
.btn.btn--reverse:hover {
  background-color: transparent;
  color: var(--text-color);
}
.btn.btn--brown {
  background-color: var(--accent-color);
  color: var(--text-color);
  border-color: var(--border-color);
}
.btn.btn--brown:hover {
  color: var(--accent-color);
  background-color: var(--text-color);
}
.btn.wide {
	width: 100%;
	margin-top: 10px;
}


.container {
	display: flex;
}
.container__left {
	width: 300px;
	height: 700px;
	background-color: var(--text-color);
	border-right: 1px solid var(--border-color);
}
.container__left .btn-menu {
	display: flex;
	align-content: center;
	margin: 50px auto;
	padding: 0 50px;
}
.container__right {
	width: calc(100% - 300px);
	height: 700px;
	background-color: var(--light-color);
}
.container__right h1 {
	margin: 0 auto;
	padding: 30px;
	border-bottom: 1px solid var(--border-color);
	background-color: var(--text-color);
	box-sizing: border-box;
	font-size: 13px;
}
.container__right .open-content {
	margin: 50px auto;
	width: 70%;
	display: flex;
	flex-direction: column;
}
.container__right .open-content .object {
	display: flex;
	margin: 10px 0;
}
.container__right .open-content .object p {
	width: 130px;
}
.container__right .open-content .object input {
	width: 80%;
	border-style: none;
	border-bottom: 2px solid var(--accent-color);
	background-color: transparent;
}
.container__right .open-content .object:nth-child(2) input {
	line-height: 200px;
	border: 2px solid var(--accent-color);
	border-radius: 5px;
	background-color: transparent;
}
.container__right .open-content .object:nth-child(5) input {
	width: 5%;
}


.material-symbols-outlined.userIcon {
	font-size: 100px;
	width: 60px;
}

.container__right .open-content .btnsection {
	margin: 20px 10%;
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

<script defer type="text/javascript">
function setting(){
	let roomNo = document.querySelector("#roomNo").value
	let userNo = document.querySelector("#userNo").value;
	location.href = "/room/setting?userNo=" + userNo +"&roomNo=" + roomNo;
}

function dropOut(){
	let roomNo = document.querySelector("#roomNo").value
	let userNo = document.querySelector("#userNo").value
	location.href = "/room/setting?userNo=" + userNo +"&roomNo=" + roomNo;
}

function dropOut(){
	let roomName = document.querySelector("#roomName").innerText
	console.log(roomName)
	
	let userNo = $("#userNo").val();
	let roomNo = $("#roomNo").val();
	
	console.log(userNo)
	console.log(roomNo)
	
 	let conf = confirm( "'" + roomName + "' 모임을 탈퇴하시겠습니까?");
	
	if(conf){
	   
		$.ajax({
	        type:"post"
	        , url: "./dropOut"
	       	, data : {
				userno : $("#userNo").val(),
				roomNo : $("#roomNo").val()
			}
			, dataType : "html"
	        , success : function( result ) {
	        	console.log("secess userNo:" + userNo)
	        	console.log("secess roomNo:" + roomNo)
                alert("탈퇴가 완료 되었습니다");
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
		<a href="#" class="btn btn--brown">모임개설</a>
		<a href="#" class="btn btn--brown">모임목록</a>
     </div>
   </div>
   
   <div class="container__right" id="form">
     <h1>모임 정보</h1>
     
     <div class="open-content">
     	<div class="object">
     	
     	<input type="hidden" name="roomNo" id="roomNo" value="${roomInfo.roomNo }">
     	<input type="hidden" name="userNo" id="userNo" value="${roomInfo.userNo }">
	    	<p>모임 이름 * </p>
	    	<p id="roomName">${roomInfo.roomName }</p>
	    </div>
	    <div class="object">
	    	<p>모임 소개 * </p>
	    	<p id="roomIntroduce">${roomInfo.roomIntroduce }</p>
	    </div>
	    <div class="object">
	    	<p>인원 수 * </p>
	    	<p>${roomInfo.roomMember } 명</p>
		</div>
	    <div class="object">
	    	<p>카테고리 * </p>
			<p id="roomCategoryName">${roomCaName }</p>
		</div>
		<div class="object"> 
	    	<p>공개설정 * </p>
			<c:if test="${roomInfo.roomPublic eq '1' }"> 
				<p id="1">공개</p>
       		</c:if>
        	<c:if test="${roomInfo.roomPublic eq '0' }"> 
				<p id="2">비공개</p>
        	</c:if>
	    </div>
	    
	    <div class="object">
	    	<c:forEach items="${userNoList }" var="userList" >
	    		<p><span class="material-symbols-outlined userIcon">account_circle</span></p>
	    		<input type="hidden" id="" value="${userList.userNo }">
	    	</c:forEach>
	    </div>
	    
	    <div class="btnsection">
	    	<a class="btn btn--brown wide" onclick="setting()">모임 설정</a>
	    	<a class="btn btn--brown wide" onclick="dropOut()">모임 탈퇴</a>
	    	<a class="btn btn--brown wide">취소</a>
	    </div>
     </div>
   </div>

</section>

</body>
</html>