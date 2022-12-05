<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/roomHeader.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
html, body {
	height: 100%;
}
.leftmenu {
	position: fixed;
	border-right: 1px solid #C7D1CA;
	height: 100%;
	width: 250px;
}
.leftbox1 {
	display:flex;
	border-bottom: 1px solid #C7D1CA;
	height: 75px;
	width: 250px;
	justify-content: center;
	align-items: center;
}
.leftbox2 {
	display:flex;
	border-bottom: 1px solid #C7D1CA;
	height: 80px;
	width: 250px;
	justify-content: center;
	align-items: center;
}
.writeDiary {
	display: flex;
	font-weight:600;
	background-color: #f4b0b0;
	color: white;
	height: 45px;
	width: 220px;
	margin: auto;
	border-radius: 3px / 3px;
	justify-content: center; /* 수평 정렬*/
	align-items: center; /* 수직 정렬*/
}
.writeDiary:hover {
	background-color: #DB9E9E;
}
.hide {
	display: none;
}
.menublock1 {
	font-weight: 600;
	margin: 20px;
}
.menublock2 {
	margin: 10px 20px 10px 20px;
	height: 20px;
}
.menublock2:hover {
	background-color: #EFEBF0;
}
.menublock2:hover>a>img:nth-child(1) {
	display: none;
}
.menublock2>a>img:nth-child(2) {
	display: none;
}
.menublock2:hover>a>img:nth-child(2) {
	display: block;
}
.menu>div {
	cursor: pointer;
}
.rightboardy {
	position: relative;
	width: 100px;
	height: 100px;
	background-color: black;
	top: 0px;
	left: 250px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(".menu>div").click(function(){
		$(this).next("ul").toggleClass("hide")
	});
});
</script>

<div class="leftmenu">
	<div class="leftbox1">
			<a href="#">
			<span class="writeDiary">
			글쓰기
			</span>
			</a>
	</div>
	<div class="leftbox2">
		<a href="#">
		<span style="color: black; font-size: 0.8em; width: 55px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
			<span style="font-size: 1.5em; color: #029EE4;">
			0
			</span><br>
			<span>
			공지사항
			</span>
		</span>
		</a>
		<span style="color: black; font-size: 0.8em; width: 55px; height: 45px; display: flex; align-items:flex-end;">
		</span>
		<a href="#">
		<span style="color: black; font-size: 0.8em; width: 55px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
			<span style="font-size: 1.5em; color: #029EE4;">
			<img alt="" src="/resources/diary/mydiary.PNG" style="margin-bottom: -4px;">
			</span><br>
			<span>
			나의글
			</span>
		</span>
		</a>
	</div>
	<div class="leftbox3">
	</div>
	<div class="leftbox4">
		<ul>
			<c:forEach items="${userRoom }" var="data">
				<li class="menu">
					<div class="menublock1">${data.roomName }<img alt="" src="/resources/diary/menu.PNG" style="display: inline; float: right;"></div>
					<ul id="menublock2" class="hide">
						<li><div class="menublock2"><a href="#"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">공지사항</div></a></div></li>
						<li><div class="menublock2"><a href="#"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">최신글</div></a></div></li>
					</ul>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<div class="rightboardy">
	<div>
	</div>
	<div>
	</div>
	<div>
		<div>
		</div>
		<div>
		</div>
	</div>
</div>

</body>
</html>