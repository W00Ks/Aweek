<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//아이디 찾기 페이지 접속 시 이름 입력창에 포커스
	$("input").eq(0).focus()
	
	//이메일 입력창에 엔터키 입력 시 $("#btnSendEmail").click() 호출
	$("input").eq(1).keypress(function(e) {
		if( e.keyCode == 13 ) {
			$("#btnSendEmail").click();
		}
	})

	//이메일 입력창에 엔터키 입력 시 $("#btnAuthOk").click() 호출
	$("input").eq(2).keypress(function(e) {
		if( e.keyCode == 13 ) {
			$("#btnAuthOk").click();
		}
	})
	
	//아이디 찾기 버튼 클릭
	$("#btnSendEmail").click(function() {
		
		//아이디 공백 체크
		if($("#userName").val() == "") {
			swal("이름을 입력해주세요!","", "warning").then(function(){
				$("input").eq(0).focus()
        	});
			return;
		} 
		
		//이메일 공백 체크
		if($("#userEmail").val() == "") {
			swal("이메일을 입력해주세요!","", "warning").then(function(){
				$("input").eq(1).focus()
        	});
 			return;
		}
		
		//일치하는 회원정보 조회
		$.ajax({
			type:"post"
			, url: "/member/findId"
			, data: {
				userName : $("#userName").val()
				, userEmail : $("#userEmail").val()
			}
		, dataType: "html"
		, success: function( res ) {
			if ( res == 1 ) {
			$.ajax({
				type:"post"
				, url: "/member/emailAuth"
				, data: {
					userEmail : $("#userEmail").val()
				}
			, dataType: "html"
			, success: function( res ) {
				const checkNum = res;
				$("#okDiv").css('display', 'block')
				$("#sendDiv").css('display','none')
					swal("","회원님의 이메일로 인증번호를 발송하였습니다.", "info").then(function(){
						$("input").eq(2).focus()
		        	});
				
				//인증번호 확인 버튼 클릭
				$("#btnAuthOk").click(function() {
					const userNum = $('#authInput').val();
					if(checkNum == userNum) {
						swal("인증 성공!","아이디 확인 페이지로 이동합니다.", "success").then(function(){
							location.href='/member/findIdOk';
			        	});
					} else {
						swal("인증 실패!","인증번호를 다시 입력해주세요!", "error").then(function(){
							$("input").eq(2).focus()
			        	});
					}
				})
				
			}
			})
			
			} else if( res != 1 ) {
				swal("","입력하신 회원정보가 일치하지 않습니다!", "error").then(function(){
					$("#userName").focus()
	        	});
			}
			}
		}) /* 회원정보 조회 ajax 끝 */
	}) /* $("#btnSendEmail").click(function() {} 끝 */
	
	//인증번호 재발송 버튼 클릭
	$("#btnReSend").click(function() {
		$.ajax({
			type:"post"
			, url: "/member/emailAuth"
			, data: {
				userEmail : $("#userEmail").val()
			}
		, dataType: "html"
		, success: function( res ) {
			const checkNum = res;
			$("#okDiv").css('display', 'block')
			$("#sendDiv").css('display','none')
				swal("","회원님의 이메일로 인증번호를 발송하였습니다.", "info").then(function(){
					$("input").eq(2).focus()
	        	});
			
			//인증번호 확인 버튼 클릭
			$("#btnAuthOk").click(function() {
				const userNum = $('#authInput').val();
				if(checkNum == userNum) {
					swal("인증 성공!","아이디 확인 페이지로 이동합니다.", "success").then(function(){
						location.href='/member/findIdOk';
		        	});
				} else {
					swal("인증 실패!","인증번호를 다시 입력해주세요!", "error").then(function(){
						$("input").eq(2).focus()
		        	});
				}
			})			
			
		}
		})
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

/* 인증번호 발송 버튼 */
#btnSendEmail {
	margin-top: 10px;
	width: 411px;
    height: 50px;
    border-radius: 5px;
    font-size: 20px;
    font-weight: 600;
    background-color: #f4b0b0;
    border: 1px solid #f4b0b0;
    color: #ffffff;
    cursor: pointer;
}

/* 인증메일 재발송 버튼 */
#btnReSend {
	margin-top: 15px;
	width: 411px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #ffffff;
    border: 1px solid #f4b0b0;
    color: #f4b0b0;
    cursor: pointer;
}

/* 인증번호 확인 버튼 */
#btnAuthOk {
	margin-top: 10px;
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

</style>

</head>
<body>

<div class="container">
	<div class="mainTxt">아이디 찾기</div>

	<form action="/member/findId" method="post">
	<div class="divName">
		<input type="text" class="int" id="userName" name="userName" placeholder="이름" autocomplete="off">
	</div>

	<div class="divEmail">
		<input type="text" class="int" id="userEmail" name="userEmail" placeholder="이메일" autocomplete="off">
	</div>
	
	<div id="sendDiv">
		<button type="button" id="btnSendEmail">인증번호 발송</button>
	</div>

	<div id="okDiv" style="display:none;">
		<input type="text" class="int" id="authInput" name="authInput" placeholder="인증번호를 입력해주세요." autocomplete="off" maxlength="6">
		<button type="button" id="btnReSend">인증메일 재발송</button>
		<button type="button" id="btnAuthOk">인증번호 확인</button>
	</div>
	</form>

</div>

</body>
</html>