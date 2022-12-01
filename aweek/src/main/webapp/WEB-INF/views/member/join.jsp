<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>: : : Aweek Join : : :</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 주소검색 API(카카오) -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- 구글 아이콘 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

<script type="text/javascript">
$(document).ready(function() {
	
	// 비밀번호 보여주기
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
	
    // 회원가입 페이지 접속 시 ID 포커스 주기
	$("#userId").focus()
	
    // ID blur 시 ID 유효성 체크 및 중복 체크 진행
	$("#userId").blur(function() {
        checkId();
    });
	
    // PW 포커스 시 PW 설정 메시지 출력
	$("#userPw").focus(function() {
		$("#userPwMsg").css('display', 'block');
	})
	
	// PW blur 시 PW 유효성 체크 진행
	$("#userPw").blur(function() {
        checkPw();
    });
	
	// PW 확인 포커스 시 PW 확인 설정 메시지 출력(메시지 없으나 아이콘 위치 변경되지 않도록 설정함)
	$("#userPwChk").focus(function() {
		$("#userPwChkMsg").css('display', 'block');
	})
	
	// PW 확인 blur 시 유효성 체크 진행
	$("#userPwChk").blur(function() {
        checkPwChk();
    });
	
	// 회원가입 버튼 클릭 시 빈 항목 체크
	$("#btnJoin").click(function() {
		
		//아이디 체크(공백인 경우)
		if($("#userId").val() == ""){
			alert("아이디를 입력해주세요");
			$("input").eq(0).focus()
			return;
		} 

		//비밀번호 체크(공백인 경우)
		if($("#userPw").val() == ""){
			alert("비밀번호를 입력해주세요");
			$("input").eq(1).focus()
			return;
		} 

		//비밀번호 확인 체크 (비밀번호와 같지 않거나 공백인 경우)
		if($("#userPwChk").val() != $("#userPw").val() || $("#userPwChk").val() == ""){
			alert("비밀번호 확인을 비밀번호와 동일하게 입력해주세요");
			$("input").eq(2).focus()
			return;
		} 
		
		
		$(this).parents("form").submit();
	})
	
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
})

function showMsg(obj, msg) {
        obj.attr("class", "show_msg");
        obj.html(msg);
        obj.show();
}

function showSuccessMsg(obj, msg) {
        obj.attr("class", "success_msg");
        obj.html(msg);
        obj.show();
}

function showErrorMsg(obj, msg) {
        obj.attr("class", "error_msg");
        obj.html(msg);
        obj.show();
}

function hideMsg(obj) {
    obj.hide();
}

// ID 중복 검사
function checkId() {
    var id = $("#userId").val();
    var oMsg = $("#userIdMsg");
	
    if ( id == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
	
    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    if (!isID.test(id)) {
        showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
        return false;
    }
	
    $.ajax({
        type:"post"
        , url: "./joinIdChk"
       	, data : {
			userId : $("#userId").val()
		}
		, dataType : "html"
        , success : function( result ) {
            if (result == 0) {
                showSuccessMsg(oMsg, "사용 가능한 아이디입니다!");
			    return true;
			    
            } else if ( result == 1 ) {
                showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
                return false;
            }
        }
    });
}

function checkPw() {
    var pw = $("#userPw").val();
    var oMsg = $("#userPwMsg");
	
    if ( pw == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
	
    var isPW = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,15}$/;
//     var isPW = /^[a-zA-Z][!@#$%^*+=-][0-9]{7,15}$/;
    if (!isPW.test(pw)) {
        showErrorMsg(oMsg,"비밀번호는 8~16자의 영문자+숫자+특수문자 조합으로 사용 가능합니다.");
        return false;
    } else {
    	showSuccessMsg(oMsg, "사용 가능한 비밀번호입니다!");
    	return true;
    }
	
}

function checkPwChk() {
    var pwChk = $("#userPwChk").val();
    var oMsg = $("#userPwChkMsg");
	
    if ( pwChk == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
	
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

.joinTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin: 50px auto;
}

.join_content {
	margin: 0 auto;
	width: 400px;
}

.join_title {
	margin: 20px 0 10px; /* 상 좌우 하 */
}

.int {
	border: 1px solid #ccc;
	outline: 0;
	width: 392px;
	height: 40px;
	cursor: pointer;
	font-size: 16px;
	padding-left: 15px;
}

input:focus{
	border: 2px solid #f4b0b0;
}

.error_msg {
	font-size: 12px;
	color: red;
}

.success_msg {
	font-size: 12px;
	color: green;
}

.material-icons {
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

.pwBox {
	position: relative;
	z-index: 1;
	flaot: left;

}


.btn_area {
	margin-top: 30px;
	margin-bottom: 50px;
	width: 411px;
	
}

#btnJoin {
	width: 200px;
    height: 50px;
	float: right;
}

#btnCancel {
	width: 200px;
    height: 50px;

}

</style>

</head>
<body>


<form action="/member/join" method="post">

<div class="joinTxt">회원가입</div>

<div class="join_content">
	<h3 class="join_title">
		<label for="userId">아이디</label>
	</h3>
	
	<div class="idBox">
		<input type="text" name="userId" id="userId" class="int" maxlength="20" autocomplete="off">
	</div>
	<span class="error_msg" id="userIdMsg" style="display:none;">아이디는 5 ~ 20자의 영문 소문자, 숫자만 입력 가능합니다.</span>
	
	<h3 class="join_title">
		<label for="userPw">비밀번호</label>
	</h3>
	<span class="pwBox"><input type="password" name="userPw" id="userPw" class="int" maxlength="16" autocomplete="off">
		<span class="material-icons" id="pwView1">visibility</span>
	</span>
	<span class="error_msg" id="userPwMsg" style="display:none;">비밀번호는 8~16자의 영문자+숫자+특수문자 조합으로 사용 가능합니다.</span>

	<h3 class="join_title">
		<label for="userPwChk">비밀번호 확인</label>
	</h3>
	<span class="pwBox"><input type="password" name="userPwChk" id="userPwChk" class="int" maxlength="16" autocomplete="off">
		<span class="material-icons" id="pwView2">visibility</span>
	</span>
	<span class="error_msg" id="userPwChkMsg" style="display:none;"></span>
	
	<h3 class="join_title">
		<label for="userName">이름</label>
	</h3>
	<span><input type="text" name="userName" id="userName" class="int" maxlength="10" autocomplete="off"></span>
	
	<h3 class="join_title">
		<label for="userPhone">휴대폰번호</label>
	</h3>
	<span><input type="text" name="userPhone" id="userPhone" class="int" maxlength="13" autocomplete="off" placeholder="ex) 010-0000-0000"></span>
	
	<h3 class="join_title">
		<label for="userAdrress">주소</label>
	</h3>
	<span><input type="text" name="userAdrress" id="userAdrress" class="int" maxlength="30" autocomplete="off"></span>
	
	<h3 class="join_title">
		<label for="userBirth">생년월일</label>
	</h3>
	<span><input type="text" name="userBirth" id="userBirth" class="int" maxlength="10" autocomplete="off" placeholder="ex) 0000-00-00"></span>
	
	<h3 class="join_title">
		<label for="userEmail">이메일</label>
	</h3>
	<span><input type="email" name="userEmail" id="userEmail" class="int" maxlength="30" autocomplete="off"></span>

	<div class="btn_area">
		<button type="button" id="btnCancel" class="btnType">가입 취소</button>
		<button type="button" id="btnJoin" class="btnType">회원 가입</button>
	</div>

</div>
</form>

</body>
</html>