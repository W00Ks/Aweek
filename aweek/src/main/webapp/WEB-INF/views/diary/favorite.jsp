<%@page import="diary.dto.DiaryFavorite"%>
<%@page import="room.dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<Room> userRoom = (List) request.getAttribute("userRoom"); %>
<% List<DiaryFavorite> diaryFavorite = (List) request.getAttribute("diaryFavorite"); %>    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#favorite2").click(function(){
		$.ajax({
			type: "get"
			, url: "./clear"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".resultfavorite").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
	
	$(".favbutton").click(function(){
		$.ajax({
			type: "get"
			, url: "./clear"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".resulttest").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
	
});
</script>

<div class="resultfavorite" style="padding-right: 10px;">
즐겨찾기 목록
<a id="favorite2" style="cursor: pointer;"><img alt="" src="/resources/diary/close_FILL0_wght400_GRAD0_opsz48.png" style="display: inline; float: right; width: 15px;"></a>
<hr>
<form action="./favorite" method="post">
	<% int count = 0; %>
	<% for(int i=0; i<userRoom.size(); i++) { %>
		<% for(int j=0; j<diaryFavorite.size(); j++) { %>
			<% if(userRoom.get(i).getRoomNo() == diaryFavorite.get(j).getUserFavorite()) count++; %>
		<% } %>
		<% if(count == 0) { %>
			<%=userRoom.get(i).getRoomName() %> <input type="checkbox" class="checkbox" name="roomnos" value="<%=userRoom.get(i).getRoomNo() %>" style="float: right;">
			<hr>
		<% } else { %>
			<%=userRoom.get(i).getRoomName() %> <input type="checkbox" class="checkbox" name="roomnos" value="<%=userRoom.get(i).getRoomNo() %>" style="float: right;" checked="checked">
			<hr>
			<% count = 0; %>
		<% } %>
	<% } %>
	<button class="favbutton" style="float: right;">설정</button>
</form>
</div>