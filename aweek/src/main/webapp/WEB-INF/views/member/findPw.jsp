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
	
	$("input").eq(0).focus()
	
	$("#btnSendSms").click(function() {
		
		//아이디 공백 체크
		if($("#userName").val() == "") {
			swal("이름을 입력해주세요!","", "warning").then(function(){
				$("input").eq(0).focus()
        	});
			return;
		} 
		
		//이름 공백 체크
		if($("#userId").val() == "") {
			swal("아이디를 입력해주세요!","", "warning").then(function(){
				$("input").eq(1).focus()
        	});
 			return;
		}
		
		//이메일 공백 체크
		if($("#userPhone").val() == "") {
			swal("휴대폰 번호를 입력해주세요!","", "warning").then(function(){
				$("input").eq(2).focus()
        	});
 			return;
		}
		
		//인증번호 문자 발송
		$.ajax({
			type:"post"			//요청 메소드
			, url: "/member/findPw"		//요청 URL
			, data: {		//요청 파라미터
				userName : $("#userName").val()
				userId : $("#userId").val()
				userPhone : $("#userPhone").val()
			}
		, dataType: "html"		//응답 데이터 형식
		, success: function( res ) {
			if(res == 1){
				$.ajax({
					type:"post"			//요청 메소드
					, url: "/member/smsAuth"		//요청 URL
					, data: {		//요청 파라미터
						userPhone : $("#userPhone").val()
					}
				, dataType: "html"		//응답 데이터 형식
				, success: function( res ) {
					const checkNum = res;
					$("#okDiv").css('display', 'block')
					$("#sendDiv").css('display','none')
					swal("","회원님의 핸드폰으로 인증번호를 발송하였습니다.", "info").then(function(){
						$("input").eq(3).focus()
		        	});
					
					$("#btnAuthOk").click(function() {
						const userNum = $('#authInput').val();
							
							if ( checkNum == userNum ) {
								swal("인증 성공!","비밀번호 변경 페이지로 이동합니다.", "success").then(function(){
									location.href='/member/findPwOk';
					        	});
							}
							else {
								swal("인증 실패!","인증번호를 다시 입력해주세요!", "error").then(function(){
									$("input").eq(3).focus()
					        	});
							}
						})
					}
				})
			} else {
				swal("","입력하신 회원정보가 일치하지 않습니다!", "error").then(function(){
					$("#userName").focus()
	        	});
			}
			
		}
		
		})
		
		//인증번호 문자 발송
// 		$.ajax({
// 			type:"post"			//요청 메소드
// 			, url: "/member/smsAuth"		//요청 URL
// 			, data: {		//요청 파라미터
// 				userPhone : $("#userPhone").val()
// 			}
// 		, dataType: "html"		//응답 데이터 형식
// 		, success: function( res ) {
// 			const checkNum = res;
// 			$("#okDiv").css('display', 'block')
// 			$("#sendDiv").css('display','none')
// 			swal("","회원님의 핸드폰으로 인증번호를 발송하였습니다.", "info").then(function(){
// 				$("input").eq(3).focus()
//         	});
			
// 			$("#btnAuthOk").click(function() {
// 				const userNum = $('#authInput').val();
					
// 					if ( checkNum == userNum ) {
// 						swal("인증 성공!","비밀번호 변경 페이지로 이동합니다.", "success").then(function(){
// 							location.href='/member/findPwOk';
// 			        	});
// 					}
// 					else {
// 						swal("인증 실패!","인증번호를 다시 입력해주세요!", "error").then(function(){
// 							$("input").eq(3).focus()
// 			        	});
// 					}
// 				})
// 			}
// 		, error: function() {
// 			swal("","입력하신 회원정보가 일치하지 않습니다!", "error").then(function(){
// 				$("#userName").focus()
//         	});
// 		}
// 		})
	})
	
})
</script>

<style type="text/css">

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
#btnSendSms {
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
	<div class="mainTxt">비밀번호 찾기</div>

	<form action="/member/findPw" method="post">
	<div class="divName">
		<input type="text" class="int" id="userName" name="userName" placeholder="이름" autocomplete="off">
	</div>
	<div class="divId">
		<input type="text" class="int" id="userId" name="userId" placeholder="아이디" autocomplete="off">
	</div>
	<div class="divPhone">
		<input type="text" class="int" id="userPhone" name="userPhone" placeholder="휴대폰 번호" autocomplete="off">
	</div>
	<span class="error_msg" id="errorMsg" style="display:none;"></span>
	
	<div id="sendDiv">
		<button type="button" id="btnSendSms">인증번호 발송</button>
	</div>

	<div id="okDiv" style="display:none;">
		<input type="text" class="int" id="authInput" name="authInput" placeholder="인증번호를 입력해주세요.">
		<button type="button" id="btnReSend">인증번호 재발송</button>
		<button type="button" id="btnAuthOk">인증번호 확인</button>
	</div>
	</form>

</div>

</body>
</html>