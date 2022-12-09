<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

<style type="text/css">

html {
	height: 100%;	
}
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
  background-color: #9884e0;
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
	height: calc(100% - 52px);
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

.container__right .open-content .object textarea {
	width: 80%;
	min-height: 200px;
	max-height: 200px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 2px var(--accent-color);
	border-radius: 5px;
	font-size: 16px;
	resize: none;
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

</style>

<script defer type="text/javascript">


</script>


<section class="container">
	<div class="container__left">
    	<div class="btn-menu">
			<a href="#" class="btn btn--brown">모임개설</a>
			<a href="#" class="btn btn--brown">모임목록</a>
     	</div>
	</div>
   
	<form action="./open" method="post" class="container__right" id="form">
		<h1>모임 개설</h1>
     
		<div class="open-content">
			<div class="object">
		    	<p>모임 이름 * </p>
		    	<input type="text" id="roomName" name="roomName" placeholder="모임 이름를 적어주세요!">
		    </div>
		    <div class="object">
		    	<p>모임 소개 * </p>
		    	<textarea cols="30" rows="1" id="roomIntroduce" name="roomIntroduce" 
		    	oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
		     	placeholder="모임 소개를 적어주세요!"></textarea>
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
			    	<select name="roomCategoryNo" id="roomCategoryNo">
			     		<option disabled selected>카테고리</option>
			     	<c:forEach items="${roomCategory }" var="rc" >
	 			     	<option value="${rc.roomCategoryNo }">${rc.roomCategoryName }</option>
			     	</c:forEach>
			    </select>
			</div>
			<div class="object"> 
		    	<p>공개설정 * </p>
		    	<input type="radio" name="roomPublic" value="1"  id="roomPublicY" checked>공개
		    	<input type="radio" name="roomPublic" value="0" id="roomPublicN">비공개
		    </div>
		    
		    <div class="btnsection">
		    	<a href="#" class="btn btn--brown wide" onclick="document.getElementById('form').submit();">모임 개설</a>
		    	<a href="#" class="btn btn--brown wide">취소</a>
		    </div>
		</div>
	</form>

</section>

</body>
</html>