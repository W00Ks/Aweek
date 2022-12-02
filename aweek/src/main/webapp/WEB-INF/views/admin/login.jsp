<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	// 아이디 입력창에 포커스주기
	$("input").eq(0).focus()
	
	// 패스워드 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnLogin").click();
		}
	})
})

// 아이디 비밀번호 입력 안 한 경우
function loginCheck() {
	let loginForm = document.loginForm;
	let owner_id = document.getElementById('adminId').value;
	let owner_pw = document.getElementById('adminPw').value;
	
	if(owner_id == "") {
		alert("아이디를 입력해주세요.");
	} else if(owner_pw == "") {
		alert("비밀번호를 입력해주세요.");
	} else {
		loginForm.submit();
	}
}

</script>

<style type="text/css">

h1 {
	text-align: center;
	margin-top: 30px;
}

button {
	cursor: pointer;
}

#container {
	width: 800px;
	heigth: auto;
	margin: 0 auto;
	margin-top: 120px;
	margin-bottom: 80px;
	text-align: center;
	border: 1px solid #43ff00;
	border-radius: 1.1em;
}

#content {
	width: 500px;
	margin: 0 auto;
	margin-bottom: 50px;
}

.msg {
	display: block;
	font-size: 11px;
	color: red;
}

.btn-primary {
	border-radius: 0.8em;
	border-color: #43FE00;
    color: #fff;
    background-color: #43FE00;
    width: 50%;
}

.form-control {
	width: 50%;
	border-color: #43FE00;
	border-radius: 0.8em;
}

.login_btn_wrap {
	text-alian: center;
}

.login_wrap {
	text-align: center;
}

.login_row {
	margin-top: 20px;
}

.login_btn_wrap {
	margin-top: 20px;
}

</style>

</head>
<body>

<div id="container">
	<h1 style="color: green;">관리자 로그인</h1>	
	<div id="content">
		<div class="login_wrap">
			<form action="/admin/login" method="post" name="loginForm"class="form-horizontal">
				<div class="login_inner">
					<div class="id_pw_wrap">
						<div class="login_row">
							<input type="text" id="adminId" name="adminId" class="form-control" placeholder="아이디" title="아이디">
						</div>
						<div class="login_row">
							<input type="password" id="adminPw" name="adminPw" class="form-control" placeholder="비밀번호" title="비밀번호">
						</div>
					</div>
					<div class="login_btn_wrap">
						<p>
							<button type="button" class="btn btn-primary" id="btnLogin" onclick="loginCheck()">
							<span>로그인</span>
							</button>
						</p>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>