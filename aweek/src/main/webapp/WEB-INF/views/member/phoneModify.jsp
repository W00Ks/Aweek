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

<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script type="text/javascript">
$(document).ready(function() {
	
	//페이지 접속 시 현재 비밀번호에 포커스 주기
	$("#ModifyUserPhone").focus();
	
	//변경할 휴대폰 번호 입력 후 엔터키 입력 시 $("#btnSendSms").click() 호출
	$("input").eq(1).keypress(function(e) {
		if( e.keyCode == 13 ) {
			$("#btnSendSms").click();
		}
	})

	//인증번호 입력 후 엔터키 입력 시 $("#btnAuthOk").click() 호출
	$("input").eq(2).keypress(function(e) {
		if( e.keyCode == 13 ) {
			$("#btnAuthOk").click();
		}
	})
	
	//변경할 휴대폰 번호 blur 시 유효성 검사 및 공백여부 체크
	$("#ModifyUserPhone").blur(function() {
		var phone = $("#ModifyUserPhone").val();
		var oMsg = $("#ModifyUserPhoneMsg");
		if ( phone == "" || phone.length != 13 ) {
	        showErrorMsg(oMsg,"휴대폰 번호를 올바르게 입력해주세요!");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//취소 버튼 클릭(팝업 닫기)
	$("#btnCancel").click(function() {
		close();
	})
	
	//인증번호 발송 버튼 클릭
	$("#btnSendSms").click(function() {
		//변경할 휴대폰 번호 체크(공백인 경우)
		if($("#ModifyUserPhone").val() == "" || $("#ModifyUserPhone").val().length != 13){
			swal("","변경하실 휴대폰 번호를 올바르게 입력해주세요!", "warning").then(function(){
				$("input").eq(1).focus()
        	});
			return;
		} 
		
		//인증번호 문자 발송
		$.ajax({
			type:"post"
			, url: "/member/smsAuth"
			, data: {
				userPhone : $("#ModifyUserPhone").val()
			}
		, dataType: "html"
		, success: function( res ) {
			const checkNum = res;
			$("#okDiv").css('display', 'block')
			$("#sendDiv").css('display','none')
			swal("","회원님의 핸드폰으로 인증번호를 발송하였습니다.", "info").then(function(){
				$("input").eq(2).focus()
        	});
			
			//인증번호 확인 버튼 클릭
			$("#btnAuthOk").click(function() {
				const userNum = $('#authInput').val();
				
				if ( checkNum == userNum ) {
					swal("인증 성공!","휴대폰 번호 변경 버튼을 클릭하시면<br>휴대폰 번호가 변경됩니다.", "success").then(function() {
						$("#btnModifyPhone").css('display', 'block');
					});
					
					//휴대폰 번호 변경 버튼 클릭
					$("#btnModifyPhone").click(function() {
						
						//변경할 휴대폰 번호 체크(공백인 경우)
						if($("#ModifyUserPhone").val() == ""){
							swal("변경하실 휴대폰 번호를 입력해주세요!","", "warning").then(function(){
								$("input").eq(1).focus()
				        	});
							return;
						} 
						
						//인증번호 입력창 체크(공백인 경우)
						if($("#authInput").val() == ""){
							swal("","인증번호가 입력되지 않았습니다!", "warning").then(function(){
								$("input").eq(2).focus()
				        	});
							return;
						}
						
						//휴대폰 번호 변경 처리
						$.ajax({
							type:"post"
							, url: "/member/phoneModify"
							, data: {
								userId : "${member.userId}"
								, userPhone : $("#ModifyUserPhone").val()
							}
						, dataType: "html"
						, success: function() {
							swal("휴대폰 번호 변경 성공!","", "success").then(function(){
								window.close();
				        	});
						}
						
						})

					})
					
				}
				else {
					swal("인증 실패!","인증번호를 다시 입력해주세요!", "error").then(function(){
						$("input").eq(2).focus()
		        	});
				}
				
				
				
			})
		}
		})//인증번호 문자 발송 끝
	})//$("#btnSendSms").click(function() {} 끝
	
	//인증번호 문자 재발송
	$("#btnReSend").click(function() {
		$.ajax({
			type:"post"
			, url: "/member/smsAuth"
			, data: {
				userPhone : $("#ModifyUserPhone").val()
			}
		, dataType: "html"
		, success: function( res ) {
			const checkNum = res;
			$("#okDiv").css('display', 'block')
			$("#sendDiv").css('display','none')
			swal("","회원님의 핸드폰으로 인증번호를 발송하였습니다.", "info").then(function(){
				$("input").eq(2).focus()
        	});
			
			$("#btnAuthOk").click(function() {
				const userNum = $('#authInput').val();
					
					if ( checkNum == userNum ) {
						swal("인증 성공!","휴대폰 번호 변경 버튼을 클릭하시면<br>휴대폰 번호가 변경됩니다.", "success").then(function() {
							$("#btnModifyPhone").css('display', 'block');
						});
						
					} else {
						swal("인증 실패!","인증번호를 다시 입력해주세요!", "error").then(function(){
							$("input").eq(2).focus()
			        	});
					}
					
					
					
				})
			}
		})
	})/* $("#btnReSend").click(function() {} 끝 */
	
})

//성공메시지
function showSuccessMsg(obj, msg) {
	obj.attr("class", "success_msg");
	obj.html(msg);
	obj.show();
}

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

/* 컨테이너 전체 */
.container {
	margin: 0 auto;
	width: 600px;
}

/* 비밀번호 변경 텍스트 */
.mainTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin-top: 30px;
}

/* input Div 영역 */
.phoneDiv {
    width: 430px;
    margin: 10px auto 20px;
}

/* input box */
.int {
	border: 1px solid #ccc;
	outline: 0;
	width: 390px;
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

/* 에러 메시지 */
.error_msg {
	font-size: 12px;
	color: red;
}

/* 성공 메시지 */
.success_msg {
	font-size: 12px;
	color: green;
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

/* 버튼 영역 */
.btn_area {
	margin: 20px auto;
	width: 330px;
}

/* 취소 버튼 */
#btnCancel {
	width: 150px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #ffffff;
    border: 1px solid #f4b0b0;
    color: #f4b0b0;
    cursor: pointer;
}

/* 휴대폰 번호 변경 버튼 */
#btnModifyPhone {
	width: 150px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #f4b0b0;
    border: 1px solid #f4b0b0;
    color: #ffffff;
	cursor: pointer;
	float: right;
	padding-right: 5px;
}

/* 현재 휴대폰번호, 변경할 휴대폰 번호 사이 */
.phone-divide {
	display: flex;
    align-items: center;
}

/* 현재 휴대폰번호, 변경할 휴대폰 번호 사이 줄 */
.half-line {
    height: 1px;
    width: 35.5%;
    display: block;
    background: #dadada;
}

/* 현재 휴대폰번호, 변경할 휴대폰 번호 사이 글자 */
.half-chars {
    color: #707070;
    padding: 0 20px;
    word-break: keep-all;
}

</style>

</head>
<body>

<div class="container">
<span id="userId" style="display:none">${member.userId}</span>
	<div class="mainTxt">휴대폰 번호 변경</div>
	<div class="phoneDiv">
		<input type="text" class="int" id="OriginUserPhone" name="OriginUserPhone" maxlength="13" value="${member.userPhone}" placeholder="현재 휴대폰 번호" autocomplete="off" readonly="readonly"><br>
		
		<div class="phone-divide">
			<div class="half-line"></div>
			<div class="half-chars">↓변경↓</div>
			<div class="half-line"></div>
		</div>
		
		<input type="text" class="int" id="ModifyUserPhone" name="ModifyUserPhone" maxlength="13" placeholder="변경할 휴대폰 번호  ex) 010-0000-0000" autocomplete="off"><br>
		<span class="error_msg" id="ModifyUserPhoneMsg" style="display:none;"></span>
	
		<div id="sendDiv">
			<button type="button" id="btnSendSms">인증번호 발송</button>
		</div>

		<div id="okDiv" style="display:none;">
			<input type="text" class="int" id="authInput" name="authInput" placeholder="인증번호를 입력해주세요." autocomplete="off" maxlength="6">
			<button type="button" id="btnReSend">인증번호 재발송</button>
			<button type="button" id="btnAuthOk">인증번호 확인</button>
		</div>
	</div>
	
	<div class="btn_area">
		<button type="button" id="btnCancel" class="btnType">취소</button>
		<button type="button" id="btnModifyPhone" class="btnType" style="display:none;">휴대폰 번호 변경</button>
	</div>
	
</div>

</body>
</html>