<%@page import="room.dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<% List<Room> adminList = (List) request.getAttribute("adminList"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".menu>div").click(function(){
		$(this).next("ul").toggleClass("hide")
	});
	
	<%	for(int i=0; i<adminList.size(); i++) { %>
	$(".hot<%=i %>").click(function(){
		$.ajax({
			type: "get"
			, url: "./hot"
			, data: {
				n1 : $(".roomNo<%=i %>").val()	
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".rightbox").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
	<% } %>
	
	<%	for(int i=0; i<adminList.size(); i++) { %>
	$(".managecate<%=i %>").click(function(){
		$.ajax({
			type: "get"
			, url: "./managecate"
			, data: {
				n1 : $(".roomNo<%=i %>").val()	
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".rightbox").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
	<% } %>
	
 	<%	for(int i=0; i<adminList.size(); i++) { %>
	$(".manageadmin<%=i %>").click(function(){
		
		$.ajax({
			type: "get"
			, url: "./manageadmin"
			, data: {
				n1 : $(".roomNo<%=i %>").val()	
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".rightbox").html( res )
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
		
		
	})
	<% } %> 
	
});
</script>

<style type="text/css">
a {
	text-decoration: none;
}
.leftbox {
	display: inline-block;
	overflow: scroll;
	overflow-x: hidden;
	position: fixed;
	width : 250px;
	height: 100%;
	border-right: 1px solid #C7D1CA;
	background-color: white;
}
.leftboxback {
	display: inline-block;
	width : 350px;
	height: 100%;
}
.rightbox {
	width: 100%;
	height: 100%;
	padding-left: 25px;
}
html, body {
	height: 100%;
	margin: 0px auto;
}
ul {
	list-style: none;
	padding-left: 0px;
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
</style>
</head>
<body>
<%int cnt = 0; %>
<div style="display: flex; width: 100%; height: 100%;">
	<div class="leftboxback"></div>
	<div class="leftbox">
	<ul>
		<c:forEach items="${adminList }" var="data">
			<li class="menu">
				<div class="menublock1">${data.roomName }<img alt="" src="/resources/diary/menu.PNG" style="display: inline; float: right;"></div>
				<ul id="menublock2" class="hide">
					<li><div class="menublock2"><a class="managecate<%=cnt %>" style="cursor: pointer;"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">게시판 관리</div></a></div></li>
					<li><div class="menublock2"><a class="manageadmin<%=cnt %>" style="cursor: pointer;"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">관리자 관리</div></a></div></li>
					<li><div class="menublock2"><a class="hot<%=cnt %>" style="cursor: pointer;"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">추천수 설정</div></a></div></li>
					<input type="text" class="roomNo<%=cnt++ %>" name="roomNo" value="${data.roomNo }" style="display: none;">
				</ul>
			</li>
		</c:forEach>
	</ul>
	</div>
	<div class="rightbox">
	</div>
</div>

</body>
</html>