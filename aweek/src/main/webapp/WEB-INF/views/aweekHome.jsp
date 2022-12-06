<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="./layout/roomHeader.jsp" />

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


</script>


<section class="container">
  <div class="inner">
    <div class="container__left">
      안녕하ㅔ요
    </div>

    <div class="container__right">
      
		<c:forEach items="${roomList  }" var="room">
		
		<div class="roomBox">
			${room.roomName }<br>
			${room.roomIntroduce }<br>
			<p>공개</p>
			<a href="#">탈퇴</a>
		</div>
		
		</c:forEach>
    </div>

  </div>
</section>

</body>
</html>