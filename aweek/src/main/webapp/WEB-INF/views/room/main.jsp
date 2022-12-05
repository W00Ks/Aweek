<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/roomHeader.jsp" />

<style type="text/css">
.container .roomBox {
	width: 200px;
	height: 200px;
	padding: 20px;
	margin: 20px;
	background-color: var(--accent-color);
	border-radius: 20px;
	box-sizing: border-box;
}


</style>

<script defer type="text/javascript">
document.getElementById("roomBox").addEventListener('click', function () {

	document.getElementById("roomBox").innerHTML = "홈짱닷컴 Homzzang.com";

});

</script>


<section class="container">
  <div class="inner">
    <div class="container__left">
      <div class="btn-menu">
		<a href="#" class="btn btn--brown">모임개설</a>
		<a href="#" class="btn btn--brown">모임목록</a>
     </div>
    </div>

    <div class="container__right">
      
		<c:forEach items="${myRoomList  }" var="room">
		
		<div class="roomBox">
			${room.roomName }<br>
			${room.roomIntroduce }<br>
			
			<c:if test="${room.roomPublic eq '1' }"> 
				<p>공개</p>
        	</c:if>
        	<c:if test="${room.roomPublic eq '0' }"> 
				<p>비공개</p>
        	</c:if>
			<a href="#">탈퇴</a>
		</div>
		
		</c:forEach>
    </div>

  </div>
</section>

</body>
</html>