<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/roomHeader.jsp" flush="true" />

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
	justify-content: center; /* 수직 정렬*/
	align-items: center; /* 수평 정렬*/
}
.writeDiary:hover {
	background-color: #DB9E9E;
}
</style>

<div class="leftmenu">
	<div class="leftbox1">
			<a href="">
			<span class="writeDiary">
			글쓰기
			</span>
			</a>
	</div>
	<div class="leftbox2">
		<a href="">
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
		<a href="">
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
	</div>
</div>
<div class="rightboardy">
</div>

</body>
</html>