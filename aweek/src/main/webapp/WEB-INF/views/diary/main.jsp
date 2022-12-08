<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../layout/roomHeader.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
html, body {
	height: 100%;
}
.fullmenu {
	display: flex;
	height: 100%;
	width: 100%;
}
.leftmenu {
	position: fixed;
	border-right: 1px solid #C7D1CA;
	height: 100%;
	width: 250px;
	background-color: white;
	z-index: 1;
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
.leftbox3 {
	border-bottom: 1px solid #C7D1CA;
	width: 250px;
	min-height: 60px;
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
.rightmenu {
	flex: 1;
	display: flex;
	width: 100%;
	height: 100%;
	padding: 15px;
	justify-content: center; /* 수평 정렬*/
}
.rightbox1 {
	height: 100px;
}
.rightbox2 {
	height: 200px;
}
.rightbox3 {
	height: 200px;
}
.rightbox4 {
	height: 200px;
}
.rightbox5 {
	height: 200px;
}
.sidebox1, .sidebox2 {
	width: 194px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(".menu>div").click(function(){
		$(this).next("ul").toggleClass("hide")
	});
	
	$("#favorite").click(function(){
		$.ajax({
			type: "get"
			, url: "./favorite"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".sidebox1").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
});
</script>

<div class="fullmenu">
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
			<span style="color: black; font-size: 0.8em; width: 70px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
				<span style="font-size: 1.5em; color: #029EE4;">
				0
				</span><br>
				<span>
				공지사항
				</span>
			</span>
			</a>
			<a href="#">
			<span style="color: black; font-size: 0.8em; width: 70px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
				<span style="font-size: 1.5em; color: #029EE4;">
				0
				</span><br>
				<span>
				최신글
				</span>
			</span>
			</a>
			<a href="#">
			<span style="color: black; font-size: 0.8em; width: 70px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
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
			<div style="font-size: 0.8em; font-weight:600; height: 20px; line-height:20px; padding: 20px 20px 0px 20px;">
			즐겨찾기
			<a id="favorite" style="cursor: pointer;"><img alt="" src="/resources/diary/settings_FILL0_wght400_GRAD0_opsz48.png" style="display: inline; float: right; width: 20px; height: 20px;"></a>			
			</div>
		</div>
		<div class="leftbox4">
			<ul>
				<c:forEach items="${userRoom }" var="data">
					<li class="menu">
						<div class="menublock1">${data.roomName }<img alt="" src="/resources/diary/menu.PNG" style="display: inline; float: right;"></div>
						<ul id="menublock2" class="hide">
							<li><div class="menublock2"><a href="#"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">공지사항</div></a></div></li>
							<li><div class="menublock2"><a href="#"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">추천글</div></a></div></li>
							<li><div class="menublock2"><a href="#"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">최신글</div></a></div></li>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div style="width: 250px; height: 100%;">
	</div>
	<div class="rightmenu">
		<div class="sidebox1"></div>
		<div style="width: 1235px; height: 100%;">
			<div class="rightbox1">
			</div>
			<div class="rightbox2">
				<div style="font-size: 1.2em; font-weight:600;">도움말</div>
			</div>
			<div class="rightbox3">
				<div style="font-size: 1.2em; font-weight:600;">공지사항</div>
			</div>
			<div class="rightbox4">
				<div style="font-size: 1.2em; font-weight:600;">추천글</div>
			</div>
			<div class="rightbox5">
				<div style="font-size: 1.2em; font-weight:600;">최신글</div>
			</div>
		</div>
		<div class="sidebox2"></div>
	</div>
</div>
</body>
</html>