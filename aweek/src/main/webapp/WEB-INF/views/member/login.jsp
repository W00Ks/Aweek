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
	
	//로그인 페이지 접속 시 ID 포커스 주기
	$("#userId").focus();
	
	$("#btnLogin").click(function() {
		var id = $("#userId").val();
	    var pw = $("#userPw").val();
	    var oMsg = $("#loginMsg");
	    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	    var isPW = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,15}$/;
		
		if(id == ""){
			showErrorMsg(oMsg,"아이디를 입력해주세요");
			$("input").eq(0).focus()
			return false;
		} else {
		    if (!isID.test(id)) {
		        showErrorMsg(oMsg,"아이디는 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
		        return false;
		    } else if (isID.test(id)) {
			    return true;
		    }
		}

// 		if(pw == ""){
// 			showErrorMsg(oMsg,"비밀번호를 입력해주세요");
// 			$("input").eq(1).focus()
// 			return false;
// 		} else {
// 			if (!isPW.test(pw)) {
// 			    showErrorMsg(oMsg,"비밀번호는 8~16자의 영문자+숫자+특수문자 조합으로 사용 가능합니다.(사용가능 특수문자: !@#$%^*+=-)");
// 			    return false;
// 			} else if (!isPW.test(pw)) {
// 				return true;
// 			}
// 		}
		
// 	    $.ajax({
// 	        type:"post"
// 	        , url: "./loginChk"
// 	       	, data : {
// 				userId : $("#userId").val(),
// 				userPw : $("#userPw").val()
// 			}
// 			, dataType : "html"
// 	        , success : function( result ) {
// 	            if (result == 0) {
// 	                showErrorMsg(oMsg, "아이디 / 비밀번호를 확인해주세요!");
// 				    return false;
				    
// 	            } else if ( result == 1 ) {
// 	            	$(this).parents("form").submit();
// 	                return true;
// 	            }
// 	        }
// 	    });
	});
});

//에러메시지
function showErrorMsg(obj, msg) {
	obj.attr("class", "error_msg");
	obj.html(msg);
	obj.show();
}

//메시지 숨기기
function hideMsg(obj) {
    obj.hide();
}

</script>

<style type="text/css">

a {
	color: #666666;
	font-size: 12px;
	text-decoration: none;
}

/* 로그인 텍스트 */
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
	width: 411px;
}

/* input box */
.int {
	border: 1px solid #ccc;
	outline: 0;
	width: 392px;
	height: 40px;
	cursor: pointer;
	font-size: 16px;
	padding-left: 15px;
	margin: 10px auto;
}

/* input focus */
input:focus{
	border: 2px solid #f4b0b0;
}

/* 아이디|비밀번호 찾기, 회원가입 div */
.joinDiv {
	position: relative;
	height: 50px;
}

/* 아이디|비밀번호 찾기 버튼 */
#search {
	position: absolute;;
}

/* 아이디|비밀번호 찾기 속성 */
#search > a {
	letter-spacing :-0.5px;
	padding: 0;
	margin-left: 3px;
}

/* 회원가입 버튼 */
#join {
	position: absolute;;
	right: 3px;
}

/* 로그인, 카카오 로그인 사이 */
.join-divide {
	display: flex;
    align-items: center;
    padding: 20px 0;
}

/* 로그인, 카카오 로그인 사이 줄 */
.half-line {
    height: 1px;
    width: 100%;
    display: block;
    background: #dadada;
}

/* 로그인, 카카오 로그인 사이 글자 */
.half-chars {
    color: #707070;
    padding: 0 20px;
    word-break: keep-all;
}

/* 로그인 버튼 */
#btnLogin {
	width: 411px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #f4b0b0;
    border: 1px solid #f4b0b0;
    color: #ffffff;
    cursor: pointer;
}

/* 카카오 로그인 버튼 */
#btnKakaoLogin {
	width: 411px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #FFE812;
    border: 1px solid #FFE812;
    color: black;
    cursor: pointer;
}

/* 카카오 로그인 div */
.KakaoDiv {
	position: relative;
	height: 50px;
	z-index: 1;
}

/* 카카오 아이콘 */
.kakaoIcon {
	position: absolute;
	z-index: 2;
}

/* 카카오 아이콘 이미지 */
.kakaoIcon > img {
	height: 49px;
	padding-left: 3px;
}

/* 로그인 유효성 검사 메시지 */
.error_msg {
	font-size: 12px;
	color: red;
}

</style>

</head>
<body>

<div class="container">
	<div class="mainTxt">로그인</div>

	<form action="/member/login" method="post">
	<div class="divId">
		<input type="text" class="int" id="userId" name="userId" placeholder="아이디" autocomplete="off">
	</div>

	<div class="divPw">
		<input type="password" class="int" id="userPw" name="userPw" placeholder="비밀번호" autocomplete="off">
	</div>
	<span class="error_msg" id="errorMsg">ㅇ</span>
	
	<div class ="joinDiv">
		<div id="search">
			<a href="/member/searchid" class="btn" id="btnSearchIdPw">아이디 | 비밀번호 찾기</a>
		</div>
		<div id="join">
			<a href="/member/join" class="btn" id="btnJoin">회원가입</a>
		</div>
	</div>
	
	<div class="loginDiv">
		<button id="btnLogin">로그인</button>
	</div>
	</form>
	
	<div class="join-divide">
		<div class="half-line"></div>
		<div class="half-chars">또는</div>
		<div class="half-line"></div>
	</div>
	<div class="KakaoDiv">
		<span class="kakaoIcon"><img src="/resources/member/kakaoicon.jpg"></span>
		<button id="btnKakaoLogin">카카오 로그인</button>
	</div>

</div>

</body>
</html>