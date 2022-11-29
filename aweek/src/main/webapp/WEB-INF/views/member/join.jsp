<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원가입</h1>
<hr>

<form action="./join" method="post">

<label>아이디 <input type="text" name="userId" id="userId"></label><br>
<label>비밀번호 <input type="text" name="userPw" id="userPw"></label><br>
<label>이메일 <input type="text" name="userEmail" id="userEmail"></label><br>
<label>휴대폰번호 <input type="text" name="userPhone" id="userPhone"></label><br><br>

<button id="btnJoin">가입</button>
<a href="./main"><button type="button">가입 취소</button></a>
</form>

</body>
</html>