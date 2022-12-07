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
}
.container {
	display: flex;
	min-height: 100%;
}
.container__left {
	width: 20%;
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

.container .roomBox {
	width: 200px;
	height: 200px;
	padding: 20px;
	margin: 20px;
	background-color: var(--border-color);
	border-radius: 20px;
	box-sizing: border-box;
	cursor: pointer;
	position: relative;
	z-index: 1;
}


.container .roomBox .moveDropOut {
	z-index: 9;
	position: absolute;
}


</style>

<script defer type="text/javascript">
$(document).ready(function() {
	$('.join').click(function() {
		console.log("click")
		checkUserNo();
	})
});
	
//userNo 중복 검사
function checkUserNo() {
	
	let userNo = $("#userNo").val();
	let roomNo = $("#roomNo").val();
	
	console.log(userNo)
	console.log(roomNo)
	
    $.ajax({
        type:"post"
        , url: "./joinUserNoChk"
       	, data : {
			userno : $("#userNo").val()
		}
		, dataType : "html"
        , success : function( result ) {
        	console.log("secess userNo:" + userNo)
        	console.log("secess roomNo:" + roomNo)
        	console.log(result)
            if (result == 0) {
            	console.log( "seccess" )
				location.href = "/room/join?userNo=" + userNo + "&roomNo=" + roomNo;
			    return true;
			    
            } else if ( result == 1 ) {
            	console.log( "error" )
                alert("이미 가입중인 모임입니다!");
                return false;
            }
        }
    });
}

</script>


<section class="container">
    <div class="container__left">
      <div class="btn-menu">
		<a href="#" class="btn btn--brown">모임개설</a>
		<a href="#" class="btn btn--brown">모임목록</a>
     </div>
    </div>

    <div class="resizer" id="dragMe"></div>
    <div class="container__right">
    
		<input type="hidden" name="userNo" id="userNo" value="${userNo }">
		<c:forEach items="${roomList  }" var="room">
			<form name="form" action="/room/setting" method="get">
				<input type="hidden" name="roomNo" id="roomNo" value="${room.roomNo }">
				<p id="roomName">${room.roomName }<br></p>
				<p id="roomIntroduce">${room.roomIntroduce }<br></p>
				
				<c:if test="${room.roomPublic eq '1' }"> 
					<p id="1">공개</p>
	        	</c:if>
	        	<c:if test="${room.roomPublic eq '0' }"> 
					<p id="2">비공개</p>
	        	</c:if>
				<button type="button" class="join">가입</button>
			</form>
		
		</c:forEach>
    </div>

</section>


</body>
</html>