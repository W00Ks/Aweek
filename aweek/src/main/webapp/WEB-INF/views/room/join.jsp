<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

<style type="text/css">


html {
	height: 100vh;	
}
body {
	font-family: 'NanumSquareNeo-Variable';
}
.container {
	display: flex;
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
.container__right .info-wrap {
	margin: 50px auto;
	width: 70%;
	display: flex;
	flex-direction: column;
    padding: 30px 50px;
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 5%);
}
.container__right .info-wrap h2 {
    margin: 15px 40%;
    padding: 30px 0;
    background-color: var(--text-color);
    box-sizing: border-box;
    font-size: 33px;
    text-align: center;
    border-bottom: 2px solid var(--border-color);
    white-space: nowrap;
}
.container__right .info-wrap .object {
	display: flex;
	margin-top: 30px;
	flex-direction: column;
}
.container__right .info-wrap .object p {
/* 	white-space: break-spaces; */
	margin: 10px 0;
}
.container__right .info-wrap .object .roomName {
	font-weight: 600;
    font-size: 24px;
    text-align: center;    
}
.container__right .info-wrap .object .roomIntroduce {
    line-height: 2.2em;
    font-size: 18px;
	margin: 20px 0 80px 0;
    text-align: center;
    white-space: break-spaces;
}
.container__right .info-wrap .object .info-box {
	display: flex;
	justify-content: space-between;
}
.container__right .info-wrap .object .info-box .info-box__title {
	padding: 50px;
	width: 18%;
    border: 1px solid var(--border-color);
    text-align: center;

}
.container__right .info-wrap .object .info-box .info-box__title span {
	border-bottom: 3px solid var(--border-color);
    display: inline-block;
    padding: 10px 0;
	font-size: 15px;
	font-weight: 400;

}
.container__right .info-wrap .object .info-box .info-box__title p {
	color: var(--background-color);
	padding: 15px 10px;
	font-size: 20px;
}
.container__right .info-wrap .object .userList {
	margin: 20px 0;
    padding: 10px 30px;
    display: flex;
    justify-content: flex-start;    
}
.container__right .info-wrap .object .userList span {
	font-size: 180px;
	width: 180px;

.container__right .info-wrap .btnsection {
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

<script type="text/javascript">

function roomOpen(){
 	location.href = "/room/open";
}

function roomList(){
	location.href = "/room/roomList";
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
     	<form action="./join" method="post" id="form">
			<input type="hidden" name="roomNo" class="roomNo" value="${roomInfo.roomNo }">
			<div class="info-wrap">
				<div class="info-title">
					<h2>모임 정보</h2>
				</div>
				<div class="object">
					<p class="roomName">${roomInfo.roomName }</p>
					<p class="roomIntroduce">${roomInfo.roomIntroduce }</p>
					<div class="info-box">
						<div class="info-box__title">
							<span>최대 인원수</span>
							<p class="roomMember">${roomInfo.roomMember } 명</p>
						</div>
						<div class="info-box__title">
							<span>카테고리</span>
							<p class="roomCategoryName">${roomCaName }</p>
						</div>
						
						<div class="info-box__title">
							<span>공개여부</span>
							<c:if test="${roomInfo.roomPublic eq '1' }"> 
								<p class="roomPublic" id="1">공개</p>
					   		</c:if>
							<c:if test="${roomInfo.roomPublic eq '0' }"> 
								<p class="roomPublic" id="2">비공개</p>
					    	</c:if>
						</div>
					</div>
			    	
				</div>
	
				<div class="btnsection">
			    	<a class="btn wide" onclick="document.getElementById('form').submit();">가입</a>
			    	<a class="btn wide" onclick="back()" >취소</a>
			    </div>
			</div>
		</form>
	</div>
</section>

</body>
</html>