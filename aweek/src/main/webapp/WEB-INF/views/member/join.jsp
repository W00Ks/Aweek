<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>: : : Aweek Join : : :</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#id").blur(function() {
		console.log("blur on");
        checkId("first");
    });
	
})

function showErrorMsg(obj, msg) {
        obj.attr("class", "error_msg");
        obj.html(msg);
        obj.show();
}

function setFocusToInputObject(obj) {
    if(submitFlag) {
        submitFlag = false;
        obj.focus();
    }
}

function hideMsg(obj) {
    obj.hide();
}

function checkId(event) {
    var id = $("#id").val();
    var oMsg = $("#idMsg");
    var oInput = $("#id");
	
    if ( id == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        setFocusToInputObject(oInput);
        return false;
    }
	
    var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
    if (!isID.test(id)) {
        showErrorMsg(oMsg,"5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
        setFocusToInputObject(oInput);
        return false;
    }
	
    $.ajax({
        type:"post"
        , url: "./joinIdChk"
       	, data : {
			userId : $("#id").val()
		}
		, dataType : "html"
        , success : function( result ) {
            if (result >= 1) {
                showSuccessMsg(oMsg, "멋진 아이디네요!");
            } else {
                showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
                setFocusToInputObject(oInput);
            }
        }
    });
    return true;
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
	margin: 20px 0 10px; /* 상 좌 하 */
}

.int {
	border: none;
	outline: 0;
	width: 392px;
	height: 40px;
	cursor: pointer;
	font-size: 16px;
}

.btn_area {
	margin-top: 30px;
	
}

#idChk {
	
}

</style>

</head>
<body>


<form action="/aweek/join" method="post">

<div class="joinTxt">회원가입</div>

<div class="join_content">
	<h3 class="join_title">
		<label for="id">아이디</label>
	</h3>
	<button class="idCheck" type="button" id="idCheck" onclick="idCheck();" value="N">중복확인</button><br>
	<span><input type="text" name="userid" id="id" class="int" maxlength="20" autofocus></span>
	<span class="error_msg" id="idMsg" >아이디는 5 ~ 20자의 영문 소문자, 숫자만 입력 가능합니다.</span>
	
	
	<h3 class="join_title">
		<label for="pw1">비밀번호</label>
	</h3>
	<span><input type="password" name="userpw1" id="pw1" class="int" maxlength="16" ></span>
	<span class="error_msg" id="pw1Msg" style="display:none;">비밀번호는 8 ~ 16자의 영문 소문자, 숫자만 입력 가능합니다.</span>

	<h3 class="join_title">
		<label for="pw2">비밀번호 확인</label>
	</h3>
	<span><input type="password" name="userpw2" id="pw2" class="int" maxlength="16" ></span>
	<span class="error_msg" id="pw2Msg" style="display:none;">비밀번호는 8 ~ 16자의 영문 소문자, 숫자만 입력 가능합니다.</span>

	<div class="btn_area">
		<button type="button" id="btn_cancel" class="btn_type">가입 취소</button>
		<button type="button" id="btn_join" class="btn_type">회원 가입</button>
	</div>

</div>
</form>

</body>
</html>