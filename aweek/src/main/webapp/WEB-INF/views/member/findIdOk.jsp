<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//비밀번호 찾기 버튼 클릭
	$("#btnFindPw").click(function() {
		sessionStorage.clear()	/* 세션 삭제 */
		window.location.href="/member/findPw";
	})
	
	//로그인 버튼 클릭
	$("#btnLogin").click(function() {
		sessionStorage.clear()	/* 세션 삭제 */
		window.location.href="/member/login";
	})
	
})

</script>

<style type="text/css">

/* 아이디 찾기 텍스트 */
.mainTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin: 250px auto 50px;
}

/* 컨테이너 전체 */
.container {
	margin: 0 auto;
	width: 600px;
}

/* 아이디 div 영역 */
.idBox {
	margin: 50px auto;
	border: 1px solid #e5e5e5;
	width: 600px;
	height: 150px;
	position: relative;
}

/* 아이디 안내 텍스트 */
.idBoxWord {
	position: absolute;
	top: 55px;
	width: 100%;
	text-align: center; 
}

/* 아이디 텍스트 */
.idWord {
	font-weight: 600;
	font-size: 23px;
	color: #666;
}

/* 아이디 노출 영역 */
.idArea {
	font-weight: 600;
	font-size: 25px;
	color: black;
}

/* 버튼 영역 */
.btn_area {
	margin: 20px auto;
	width: 450px;
}

/* 로그인 버튼 */
#btnLogin {
	width: 200px;
    height: 50px;
	float: right;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #f4b0b0;
    border: 1px solid #f4b0b0;
    color: #ffffff;
    cursor: pointer;
}

/* 비밀번호 찾기 버튼 */
#btnFindPw {
	width: 200px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #ffffff;
    border: 1px solid #f4b0b0;
    color: #f4b0b0;
	cursor: pointer;
}

</style>

</head>
<body>

<div class="container">
	<div class="mainTxt">아이디 찾기</div>
	<div class="idBox">
		<div class="idBoxWord">
			<span class="idWord">회원님의 아이디는 </span>
			<span class="idArea">${userId}</span>
			<span class="idWord"> 입니다.</span>
		</div>
	</div>
	
	<div class="btn_area">
		<button type="button" id="btnLogin" class="btnType">로그인</button>
		<button type="button" id="btnFindPw" class="btnType">비밀번호 찾기</button>
	</div>
	
</div>


</body>
</html>