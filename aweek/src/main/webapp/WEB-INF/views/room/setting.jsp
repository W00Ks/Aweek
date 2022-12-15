<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

<style type="text/css">

form {
	width: 100%;
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
  background-color: #cbd5e0;
  cursor: ew-resize;
  height: 100%;
  width: 2px;
}
.container__right {
	width: calc(100% - 300px);
	height: calc(100% - 52px);
	background-color: var(--light-color);
}
.container__right .setting-content {
    margin: 50px 10%;
    padding: 0 10%;
    display: flex;
    background-color: var(--text-color);
    flex-direction: column;
    border-radius: 10px;
    box-shadow: 1px 1px 10px 0px rgb(0 0 0 / 5%);
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
}
.container__right .setting-content .object .input-placeholder{
	padding-left: 5px;
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
}

.container__right .setting-content .object .roomPublic-section .public-content {
	width: 120px;
    display: flex;
    align-items: center;
    margin-left: 10px;
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
		<form action="./setting" method="post" id="form">
			<div class="setting-content">
				<div class="settingTitle">
					<h1>모임 설정</h1>
					<h6>모임의 이름, 소개, 인원 수, 카테고리, 공개설정을 수정 해보세요.</h6>
				</div>
		     	<input type="hidden" name="roomNo" class="roomNo" value="${roomInfo.roomNo }">
		     	<input type="hidden" name="userNo" class="userNo" value="${roomInfo.userNo }">
		     	
		     	
		     	<div class="object">
				    <p>모임 이름 * </p>
				    <input type="text" id="roomName" name="roomName" placeholder="모임 이름를 적어주세요!" value="${roomInfo.roomName }">
			    </div>
			    <div class="object">
			    	<p>모임 소개 * </p>
			    	<textarea cols="30" rows="1" id="roomIntroduce" name="roomIntroduce" 
			    	placeholder="모임 소개를 적어주세요!">${roomInfo.roomIntroduce }</textarea>
			    </div>
			    <div class="object">
			    	<p>인원 수 * </p>
			     	<select name="roomMember" id="roomMember">
				     	<option disabled selected>인원 수</option>
				     	<option value="10" ${roomInfo.roomMember eq '10' ? 'selected':''}>10</option>
				     	<option value="100" ${roomInfo.roomMember eq '100' ? 'selected':''}>100</option>
				    </select>
				</div>
			    <div class="object">
			    	<p>카테고리 * </p>
			    	<select name="roomCategoryNo" id="roomCategoryNo">
			    		<option disabled selected>카테고리</option>
				     	<c:forEach items="${roomCategory }" var="rc" >
		 			     	<option value="${rc.roomCategoryNo }" <c:if test ="${rc.roomCategoryName eq roomCaName}">selected="selected"</c:if>>${rc.roomCategoryName }</option>
				     	</c:forEach>
			    	</select>
				</div>
				<div class="object"> 
			    	<p>공개설정 * </p>
			    	<div class="roomPublic-section">
				    	<input type="radio" name="roomPublic" value="1" ${roomInfo.roomPublic eq '1' ? 'checked':''} id="roomPublicY">
				    		<div class="public-content">공개</div>
				    	<input type="radio" name="roomPublic" value="0" ${roomInfo.roomPublic eq '0' ? 'checked':''} id="roomPublicN">
				    		<div class="public-content">비공개</div>
			    	</div>
			    </div>
			    
			    <div class="btnsection">
			    	<a href="#" class="btn btn--brown wide" onclick="document.getElementById('form').submit();">설정</a>
			    	<a href="#" class="btn btn--brown wide">취소</a>
				</div>
			</div>
		</form>
	</div>

</section>

</body>
</html>