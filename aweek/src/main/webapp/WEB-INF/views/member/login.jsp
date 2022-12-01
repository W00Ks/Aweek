<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div id="mainTxt">로그인</div>
	<div id="subTxt">AWEEK에 방문해주셔서 감사드립니다.</div>

<form action="/member/login" method="post">
	<div id="divId">
		<input type="text" id="userId" name="userId" placeholder="아이디" autocomplete="off">
	</div>

	<div id="divPw">
		<input type="password" id="userPw" name="userPw" placeholder="비밀번호" autocomplete="off">
	</div>
	
	<div id = "searchJoin">
		<div id="search">
			<a href="/homett/searchid" class="btn" id="btnSearchId">아이디 비밀번호 찾기</a>
		</div>
		
		<div id="join">
			<a href="/homett/join" class="btn" id="btnJoin">회원가입</a>
		</div>
	</div>
	
	<!-- 로그인 버튼 -->
	<div id="loginDiv">
		<button id="btnLogin">로그인</button>
	</div>
</form>
</div>

</body>
</html>