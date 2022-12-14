<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            .prev('#userPw').attr('type',"text");
        }else{
            $(this).text("visibility")
            .prev('#userPw').attr('type','password');
        }
    });
    
	//비밀번호 확인 보여주기
    $('#pwView2').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).text("visibility_off")
            .prev('#userPwChk').attr('type',"text");
        }else{
            $(this).text("visibility")
            .prev('#userPwChk').attr('type','password');
        }
    });
	
	//페이지 접속 시 비밀번호에 포커스 주기
	$("#userPw").focus();
	
	//PW blur 시 PW 유효성 체크 진행
	$("#userPw").blur(function() {
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
	
	//취소 버튼 클릭(로그인 페이지로 이동)
	$("#btnCancel").click(function() {
		$.ajax({
			type:"post"
			, url: "/member/logout"
			, data: {
			}
		, dataType: "html"
		, success: function() {
			window.location.href="/member/login";
		}
		})
	})
	
	//비밀번호 변경 버튼 클릭
	$("#btnModifyPw").click(function() {
			
		//비밀번호 체크(공백인 경우)
		if($("#userPw").val() == ""){
			swal("비밀번호를 입력해주세요","", "warning").then(function(){
				$("input").eq(0).focus()
        	});
			return;
		} 

		//비밀번호 확인 체크 (비밀번호와 같지 않거나 공백인 경우)
		if($("#userPwChk").val() != $("#userPw").val() || $("#userPwChk").val() == ""){
			swal("비밀번호 확인을 비밀번호와 동일하게 입력해주세요","", "warning").then(function(){
				$("input").eq(1).focus()
        	});
			return;
		}
		
		console.log($("#userId").val());
		//비밀번호 변경 호출
	    $.ajax({
	        type:"post"
	        , url: "./findPwOk"
	       	, data : {
				userId : "${userId}"
				, userPw : $("#userPw").val()
			}
			, dataType : "html"
	        , success : function() {
	        	swal("비밀번호 변경 성공!","로그인 화면으로 이동합니다.", "success").then(function(){
       				$.ajax({
						type:"post"
						, url: "/member/logout"
						, data: {
						}
					, dataType: "html"
					, success: function() {
						window.location.href="/member/login";
					}
					})
	        	});
	        }
	    });
	    
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
    var pw = $("#userPw").val();
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
	
    if ( pwChk == $("#userPw").val() ) {
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

/* 비밀번호 찾기 텍스트 */
.mainTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin: 150px auto 30px;
}

/* 안내 텍스트 영역 */
.TxtArea {
	width: 600px;
	border: 1px solid #ccc;
	padding: 20px 0;
	background-color: #fff4f4;
}

/* 비밀번호 변경 안내 텍스트 */
.infoTxt {
	font-size: 14px;
	text-align: center;
	font-weight: 400;
	color: #5e5e5e;
}

/* ID 노출 영역 */
.idTxt {
	text-align: center;
	margin-top: 20px;
	font-weight: 600;
}

/* input Div 영역 */
.pwDiv {
    width: 411px;
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
	width: 405px;
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
	padding-left: 3px;
}

/* 성공 메시지 */
.success_msg {
	font-size: 12px;
	color: green;
	padding-left: 3px;
}

/* 비밀번호 설정 안내 메시지 */
#userPwMsg {
	width: 400px;
}

/* 비밀번호 보기 아이콘 */
#pwView1, #pwView2 {
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

<c:import url="../layout/mainHeader.jsp" />

<div class="container">
	<div class="mainTxt">비밀번호 찾기</div>
	<div class="TxtArea">
		<div class="infoTxt">
			<div class="subTxt">비밀번호를 변경해 주세요</div>
			<div class="subTxt">다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해주세요.</div>
		</div>
		<div class="idTxt">
			<span>AWEEK 아이디 : </span>
			<span id="userId">${userId }</span>
		</div>
	</div>
	
	<div class="pwDiv">
		<span class="pwBox"><input type="password" name="userPw" id="userPw" class="int" maxlength="16" placeholder="새 비밀번호" autocomplete="off">
			<span class="material-icons" id="pwView1">visibility</span>
		</span>
		<span class="error_msg" id="userPwMsg" style="display:none;"></span>
	
		<span class="pwBox"><input type="password" name="userPwChk" id="userPwChk" class="int" maxlength="16" placeholder="새 비밀번호 확인" autocomplete="off">
			<span class="material-icons" id="pwView2">visibility</span>
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