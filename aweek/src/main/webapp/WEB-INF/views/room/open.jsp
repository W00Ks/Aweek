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

/* //대상 Element 선택
const resizer = document.querySelector('#resizer');
const leftSide = resizer.previousElementSibling;
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
resizer.addEventListener('mousedown', mouseDownHandler); */

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
	     <input type="text" id="roomIntroduce" name="roomIntroduce" placeholder="모임 소개를 적어주세요!">
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
		     	<option value="1">회사</option>
		     	<option value="2">취미</option>
		     	<option value="3">동아리</option>
		     </select>
		</div>
		<div class="object"> 
	     <p>공개설정 * </p>
	     <input type="radio" name="roomPublic" value="1"  id="roomPublic">공개
	     <input type="radio" name="roomPublic" value="0" id="roomPublic">비공개
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