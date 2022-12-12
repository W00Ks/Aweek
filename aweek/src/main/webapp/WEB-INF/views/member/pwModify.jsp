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
	
	//비밀번호 보여주기
	$('#pwView1').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).text("visibility_off")
            .prev('#OriginUserPw').attr('type',"text");
        }else{
            $(this).text("visibility")
            .prev('#OriginUserPw').attr('type','password');
        }
    });
    
	//비밀번호 확인 보여주기
    $('#pwView2').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).text("visibility_off")
            .prev('#ModifyUserPw').attr('type',"text");
        }else{
            $(this).text("visibility")
            .prev('#ModifyUserPw').attr('type','password');
        }
    });
    
	//비밀번호 확인 보여주기
    $('#pwView3').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).text("visibility_off")
            .prev('#userPwChk').attr('type',"text");
        }else{
            $(this).text("visibility")
            .prev('#userPwChk').attr('type','password');
        }
    });
	
	//페이지 접속 시 현재 비밀번호에 포커스 주기
	$("#OriginUserPw").focus();
	
	//PW blur 시 PW 유효성 체크 진행
	$("#ModifyUserPw").blur(function() {
        checkPw();
        $("#userPwMsg").css('display', 'block');
    });
	
	//PW 확인 포커스 시 PW 확인 설정 메시지 출력(메시지 없으나 아이콘 위치 변경되지 않도록 설정함)
	$("#userPwChk").focus(function() {
		$("#userPwChkMsg").css('display', 'block');
	});
	
	//PW 확인 blur 시 유효성 체크 진행
	$("#userPwChk").blur(function() {
        checkPwChk();
    });
	
	//취소 버튼 클릭(팝업 닫기)
	$("#btnCancel").click(function() {
		close();
	})
	
	//비밀번호 확인창에서 엔터키 입력 시 $("#btnModifyPw").click() 호출
	$("input").eq(2).keydown(function(e) {
		if( e.keyCode == 13 ) {
			$("#btnModifyPw").click();
		}
	})
	
	//비밀번호 변경 버튼 클릭
	$("#btnModifyPw").click(function() {
		
		//현재 비밀번호 체크(공백인 경우)
		if($("#OriginUserPw").val() == ""){
			swal("현재 비밀번호를 입력해주세요","", "warning").then(function(){
				$("input").eq(0).focus()
        	});
			return;
		} 
		
		//변경 비밀번호 체크(공백인 경우)
		if($("#ModifyUserPw").val() == ""){
			swal("변경하실 비밀번호를 입력해주세요","", "warning").then(function(){
				$("input").eq(1).focus()
        	});
			return;
		} 

		//변경 비밀번호 확인 체크 (비밀번호와 같지 않거나 공백인 경우)
		if($("#userPwChk").val() != $("#ModifyUserPw").val() || $("#userPwChk").val() == ""){
			swal("비밀번호 확인을 변경하실 비밀번호와 동일하게 입력해주세요","", "warning").then(function(){
				$("input").eq(2).focus()
        	});
			return;
		}
		
		//비밀번호 체크
		$.ajax({
	        type:"post"
	        , url: "./pwChk"
	       	, data : {
				userId : "${member.userId}"
				, userPw : $("#OriginUserPw").val()
			}
			, dataType : "html"
	        , success : function( res ) {
        		//비밀번호 변경 처리
	        	if ( res == 1 ) {
	        	    $.ajax({
	        	        type:"post"
	        	        , url: "./pwModify"
	        	       	, data : {
	        				userId : "${member.userId}"
	        				, userPw : $("#ModifyUserPw").val()
	        			}
	        			, dataType : "html"
	        	        , success : function() {
	        	        	swal("비밀번호 변경 성공!","", "success").then(function(){
	        	        		window.close();
	        	        	});
	        	        }
	        	    });
	        	} else {
	        		swal("비밀번호 변경 실패!","비밀번호가 일치하지 않습니다.", "error").then(function(){
	        			$("#OriginUserPw").focus()
	        		});
	        	}
	        }
		})
		
	    
	})
	
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

//PW 유효성 검사
function checkPw() {
    var pw = $("#ModifyUserPw").val();
    var oMsg = $("#userPwMsg");
	
    var isPW = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,15}$/;
    if (!isPW.test(pw)) {
        showErrorMsg(oMsg,"비밀번호는 8~16자의 영문자+숫자+특수문자 조합으로 사용 가능합니다.(사용가능 특수문자: !@#$%^*+=-)");
        return false;
    } else {
    	showSuccessMsg(oMsg, "사용 가능한 비밀번호입니다!");
    	return true;
    }
}

//PW 확인 유효성 검사
function checkPwChk() {
    var pwChk = $("#userPwChk").val();
    var oMsg = $("#userPwChkMsg");
	
    if ( pwChk == $("#ModifyUserPw").val() ) {
    	showSuccessMsg(oMsg, "비밀번호가 일치합니다!");
    	return true;
    } else {
        showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
        return false;
    }
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
.pwDiv {
    width: 430px;
    margin: 10px auto 20px;
}

/* 비밀번호 span 영역 */
.pwBox {
	position: relative;
	z-index: 1;
	flaot: left;
}

/* input box */
.int {
	border: 1px solid #ccc;
	outline: 0;
	width: 400px;
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

/* 비밀번호 보기 아이콘 */
#pwView1, #pwView2, #pwView3 {
	width: 30px;
	position: absolute;
	right: 10px;
 	top: -4px; 
	font-size: 30px;
	vertical-align: middle;
	text-align: center;
	color: #f4b0b0;
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

/* 비밀번호 변경 버튼 */
#btnModifyPw {
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

</style>

</head>
<body>

<div class="container">
<span id="userId" style="display:none">${member.userId }</span>
	<div class="mainTxt">비밀번호 변경</div>
	<div class="pwDiv">
		<span class="pwBox"><input type="password" name="OriginUserPw" id="OriginUserPw" class="int" maxlength="16" placeholder="현재 비밀번호" autocomplete="off">
			<span class="material-icons" id="pwView1">visibility</span>
		</span>
		
		<span class="pwBox"><input type="password" name="ModifyUserPw" id="ModifyUserPw" class="int" maxlength="16" placeholder="새 비밀번호" autocomplete="off">
			<span class="material-icons" id="pwView2">visibility</span>
		</span>
		<span class="error_msg" id="userPwMsg" style="display:none;"></span>
	
		<span class="pwBox"><input type="password" name="userPwChk" id="userPwChk" class="int" maxlength="16" placeholder="새 비밀번호 확인" autocomplete="off">
			<span class="material-icons" id="pwView3">visibility</span>
		</span>
		<span class="error_msg" id="userPwChkMsg" style="display:none;"></span>
	</div>
	
	<div class="btn_area">
		<button type="button" id="btnCancel" class="btnType">취소</button>
		<button type="button" id="btnModifyPw" class="btnType">비밀번호 변경</button>
	</div>
	
</div>

</body>
</html>