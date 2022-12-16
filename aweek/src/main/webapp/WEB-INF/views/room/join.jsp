<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

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
	margin: 35px;
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

.container__right .open-content .cont {
	width: 130px;
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
	     <div class="open-content">
	     	<div class="object">
	     	
	     	<input type="hidden" name="roomNo" value="${roomInfo.roomNo }">
		     <p>모임 이름 * </p>
		     <input type="text" id="roomName" name="roomName" placeholder="모임 이름를 적어주세요!" value="${roomInfo.roomName }">
		    </div>
		    <div class="object">
		     <p>모임 소개 * </p>
		     <input type="text" id="roomIntroduce" name="roomIntroduce" placeholder="모임 소개를 적어주세요!" value="${roomInfo.roomIntroduce }">
		    </div>
		    <div class="object">
		     <p>인원 수 * </p>
		     	<select name="roomMember" id="roomMember">
			     	<option disabled selected>인원 수</option>
			     	<option value="10">10</option>
			     	<option value="100">100</option>
			     </select>
			</div>
		    <div class="object">
		     <p>카테고리 * </p>
			     <div class="cont">
			     	<c:if test="${roomInfo.roomCategoryNo eq '1' }"> 
			     		<p id="categoryNo1">회사</p>
			     	</c:if>
			     	<c:if test="${roomInfo.roomCategoryNo eq '2' }"> 
			     		<p id="categoryNo2">취미</p>
			     	</c:if>
			     	<c:if test="${roomInfo.roomCategoryNo eq '3' }"> 
			     		<p id="categoryNo3">동아리</p>
			     	</c:if>
		     	</div>
			</div>
			<div class="object"> 
				<p>공개설정 * </p>
				<div class="cont">
			     	<c:if test="${roomInfo.roomPublic eq '1' }"> 
						<p id="roomPublicY">공개</p>
		        	</c:if>
		        	<c:if test="${roomInfo.roomPublic eq '0' }"> 
						<p id="roomPublicN">비공개</p>
		        	</c:if>
	        	</div>
		    </div>
		    
		    <div class="btnsection">
		    	<a href="#" class="btn wide" onclick="document.getElementById('form').submit();">가입</a>
		    	<a href="#" class="btn wide">취소</a>
		    </div>
	     </div>
		</form>
	</div>
</section>

</body>
</html>