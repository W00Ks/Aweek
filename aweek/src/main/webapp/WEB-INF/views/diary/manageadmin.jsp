<%@page import="room.dto.Room"%>
<%@page import="diary.dto.DiaryAdmin"%>
<%@page import="diary.dto.DiaryRoomList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<% List<DiaryRoomList> roomUserList = (List) request.getAttribute("roomUserList"); %>
<% List<DiaryAdmin> roomAdminList = (List) request.getAttribute("roomAdminList"); %>
<% Room roomInfo = (Room) request.getAttribute("roomInfo"); %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

th {
	text-align: center;
	border-bottom: 1px solid #C7D1CA;
	 border-bottom-width: thick;
}

td {
	text-align: center;
	border-bottom: 1px solid #C7D1CA;
}
#adminbutton {
	position: relative;
	left: 454px;
	width: 50px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#adminbutton").click(function(){
		$("#adminform").submit();
		
		alert("설정이 완료되었습니다.");
		
	});
});
</script>
</head>
<body>

<h1>${roomInfo.roomName } 관리자</h1>

<hr>
<h5 style="margin-bottom: 0px;">공지사항 작성 및 게시글 삭제 권한을 부여할 수 있습니다.</h5>

<form action="./manageadmin" method="post" target="iframe1" id="adminform">
<input type="button" value="설정" id="adminbutton">
	<table>
	<thead>
		<tr>
			<th style="width: 23%;">사용자 번호</th>
			<th style="width: 60%;">사용자 ID</th>
			<th style="width: 20%;">관리자 권한</th>
		</tr>
	</thead>
	<tbody>
	<%int count = 0; %>
	<%for(int i=0; i<roomUserList.size(); i++) { count = 0; %>
		<tr>
			<td><%=roomUserList.get(i).getUserNo() %></td>
			<td><%=roomUserList.get(i).getUserId() %></td>
			<td>
				<%if(roomUserList.get(i).getUserNo() == roomInfo.getUserNo()) { %>
					<input type="checkbox" checked="checked" disabled="disabled" name="checkAdmin" value="<%=roomInfo.getUserNo() %>"> <!-- 사용자번호가 모임 생성자번호와 일치하면 -->
					<input type="checkbox" checked="checked" name="checkAdmin" value="<%=roomInfo.getUserNo() %>" style="display: none;">
				<%count++; } %>
				<%for(int j=0; j<roomAdminList.size(); j++) { %>
						<%if(roomUserList.get(i).getUserNo() == roomAdminList.get(j).getUserNo() && roomUserList.get(i).getUserNo() != roomInfo.getUserNo()) { %>
							<input type="checkbox" checked="checked" name="checkAdmin" value="<%=roomUserList.get(i).getUserNo() %>"> <!-- 사용자번호가 모임 생성자 번호와 일치하지 않고 관리자테이블 안에 있으면 -->
						<%count++; } %>
				<%} %>
				<%if(count == 0) { %>
					<input type="checkbox" name="checkAdmin" value="<%=roomUserList.get(i).getUserNo() %>"> <!-- 두 경우 다 해당하지 않으면 -->
				<%} %>
			</td>
		</tr>
	<%} %>
	</tbody>
	</table>
	<br>
<iframe id="iframe1" name="iframe1" style="display:none"></iframe>
<input type="text" value="${roomInfo.roomNo }" name="roomNo" style="display: none;">
</form>

</body>
</html>