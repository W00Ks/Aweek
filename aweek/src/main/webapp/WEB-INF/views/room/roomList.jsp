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
	background-color: var(--text-color);
	flex: 1;
}
.container__right .list-wrap {
	width: 82%;
    min-width: 550px;
    margin: 50px 4%;
    padding: 50px 5%;
    display: flex;
    background-color: var(--text-color);
    flex-direction: column;
    border-radius: 10px;
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 8%);
}

.container__right .list-wrap .list-title {
	margin: 30px auto;
}
.container__right .list-wrap .list-title h1 {
    text-align: center;
    font-size: 35px;
}
.container__right .list-wrap .list-title h6 {
    text-align: center;
    font-size: 15px;
    margin-top: 30px;
}

.container__right .list-wrap .table-menu {
	margin: 40px 0;
	width: 100%;
	border-bottom: 1px solid var(--accent-color);
    padding: 15px 0;
    font-size: 18px;
    text-align: center;
    background-color: var(--light-color);
}
.container__right .list-wrap .table-menu li {
	list-style-type: none;
	float: left;
	white-space: nowrap;
}
.container__right .list-wrap .table-menu li:first-child {
	width: 20%;
}

.container__right .list-wrap .table-menu li:nth-child(2) {
	width: 60%;
}
.container__right .list-wrap .table-menu li:nth-child(3) {
	width: 10%;
}
.container__right .list-wrap .table-menu li:nth-child(4) {
	width: 10%;
}

.container__right .list-wrap .table {
	width: 100%;
}
.container__right .list-wrap .table li {
    list-style-type: none;
    float: left;
    padding: 5px 20px;
    margin: 5px 0px;
    height: 35px;
    border-bottom: 1px solid var(--border-color);
    word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    text-align: center;
    display: inline-block;
    box-sizing: border-box;
}
.container__right .list-wrap .table li:first-child {
	width: 20%;
	cursor: pointer;
}
.container__right .list-wrap .table li:nth-child(2) {
	width: 60%;
	cursor: pointer;
}
.container__right .list-wrap .table li:nth-child(3) {
	width: 10%;
}
.container__right .list-wrap .table li:nth-child(4) {
	width: 10%;
	padding: 3px 0px;
}
.container__right .list-wrap .table.hidden {
	display: none;
}

.container__right .list-wrap .table .join {
	padding: 5px 5px;
    background-color: var(--soft-black);
    color: var(--text-color);
    font-size: 14px;
    border-radius: 10px;
    text-align: center;
    cursor: pointer;
}

@media screen and (max-width: 768px) {
	.container__left {
		display: none;
	}
	
	.container__right {
		width: 100%;
	}
	.container__right .list-wrap .table-menu li:nth-child(2) {
		width: 50%;
	}
	.container__right .list-wrap .table-menu li:nth-child(3) {
		width: 20%;
	}
	.container__right .list-wrap .table li:nth-child(2) {
		width: 50%;
	}
	.container__right .list-wrap .table li:nth-child(3) {
		width: 20%;
	}
		
}

.container .listTb {
	width: 800px;
	margin: 30px 40px;
	border-radius: 20px;
	box-sizing: border-box;
	position: relative;
	z-index: 1;
}


.container .roomBox .moveDropOut {
	z-index: 9;
	position: absolute;
}


</style>

<script defer type="text/javascript">

function roomOpen(){
 	location.href = "/room/open";
}

function roomList(){
	location.href = "/room/roomList";
}

//userNo 중복 검사
function checkUserNo(roomNo) {
	
	console.log(roomNo)
	
    $.ajax({
        type:"post"
        , url: "./joinUserNoChk"
       	, data : {
			roomNo : roomNo
		}
		, dataType : "html"
        , success : function( result ) {
        	console.log("secess roomNo:" + roomNo)
        	console.log(result)
            if (result == 0) {
            	console.log( "seccess" )
				location.href = "/room/join?roomNo=" + roomNo;
			    return true;
			    
            } else if ( result == 1 ) {
            	console.log( "error" )
                alert("이미 가입중인 모임입니다!");
                return false;
            }
        }
    });
}

function goRoomInfo(roomNo) {
	console.log(roomNo)
 	location.href = "/room/roomInfo?roomNo=" + roomNo;
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
    	<div class="list-wrap">
    		<div class="list-title">
				<h1>모임 목록</h1>
				<h6>Aweek의 모임입니다.<br/>
					다양한 사람들과 함께하고 싶으시다면 가입버튼을 눌러 새로운 사람들을 만나보세요.</h6>
			</div>
    		
			<input type="hidden" name="userNo" class="userNo" value="${userNo }">
				<ul class="table-menu">
					<li>모임 이름</li>
					<li>모임 설명</li>
					<li>카테고리</li>
					<li>가입</li>
				</ul>
			<c:forEach items="${roomList  }" var="room">
				<input type="hidden" name="roomNo" class="roomNo" value="${room.roomNo }">
				<c:if test="${room.roomPublic eq '0' }"> 
					<ul class="table hidden"></ul>
				</c:if>
				
				<c:if test="${room.roomPublic eq '1' }"> 
					<ul class="table">
						<li class="roomName" onclick="goRoomInfo(${room.roomNo })">${room.roomName }</li>
						<li class="roomIntroduce" onclick="goRoomInfo(${room.roomNo })">${room.roomIntroduce }</li>
						
						<c:if test="${room.roomCategoryNo eq '1' }"> 
							<li class="roomCategory" id="1">회사</li>
			        	</c:if>
			        	<c:if test="${room.roomCategoryNo eq '2' }"> 
							<li class="roomCategory" id="2">취미</li>
			        	</c:if>
			        	<c:if test="${room.roomCategoryNo eq '3' }"> 
							<li class="roomCategory" id="2">동아리</li>
			        	</c:if>
						
						<li><p class="join" onclick="checkUserNo(${room.roomNo })">가입</p></li>
					</ul>
				</c:if>
			</c:forEach>
		</div>
    </div>

</section>


</body>
</html>