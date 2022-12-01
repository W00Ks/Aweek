<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
		history.go(-1);
	})
	
	$("#userId").focus()
})
</script>

</head>
<body>

<h1>로그인</h1>

<form action="./login" method="post">

아이디<input type="text" name="userId" id="userId"><br>
패스워드<input type="password" name="userPw" value="1234"><br>

<button>로그인</button>

</form>

</body>
</html>