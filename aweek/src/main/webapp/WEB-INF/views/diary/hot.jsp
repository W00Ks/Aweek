<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>${roomInfo.roomName } 추천수 설정</h1>
<hr>
<h5>추천글로 등록되기 위한 추천 수를 설정할 수 있습니다.</h5>
<h5>최소 5에서 최대 50까지 설정할 수 있습니다.</h5>

<form action="./hot" method="post">
	<input type="number" name="hot" min="5" max="50" value="${diaryHot.diaryHot }" required>
	
	<input style="display: none;" type="text" name="roomNo" value="${roomInfo.roomNo }">

	<button>설정</button>
</form>

</body>
</html>