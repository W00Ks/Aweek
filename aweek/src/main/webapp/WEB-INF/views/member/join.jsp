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

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<!-- 주소검색 API(카카오) -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
function findAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            //팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            //각 주소의 노출 규칙에 따라 주소를 조합한다.
            //내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; //주소 변수
            var extraAddr = ''; //참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { //사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { //사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            //사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다. (법정리는 제외)
                //법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                //건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            }

            //우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("userAddress1").value = addr;
            //커서를 상세주소 필드로 이동한다.
            document.getElementById("userAddress2").focus();
        }
    }).open();
}

</script>

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
	
    //회원가입 페이지 접속 시 ID 포커스 주기
	$("#userId").focus();
	
    //ID blur 시 ID 유효성 체크 및 중복 체크 진행
	$("#userId").blur(function() {
        checkId();
    });
	
    //PW 포커스 시 PW 설정 메시지 출력
	$("#userPw").focus(function() {
		$("#userPwMsg").css('display', 'block');
	});
	
	//PW blur 시 PW 유효성 체크 진행
	$("#userPw").blur(function() {
        checkPw();
    });
	
	//PW 확인 포커스 시 PW 확인 설정 메시지 출력(메시지 없으나 아이콘 위치 변경되지 않도록 설정함)
	$("#userPwChk").focus(function() {
		$("#userPwChkMsg").css('display', 'block');
	});
	
	//PW 확인 blur 시 유효성 체크 진행
	$("#userPwChk").blur(function() {
        checkPwChk();
    });
	
	//이름 blur 시 공백여부 체크
	$("#userName").blur(function() {
		var name = $("#userName").val();
		var oMsg = $("#userNameMsg");
		if ( name == "" ) {
	        showErrorMsg(oMsg,"필수 정보입니다.");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//휴대폰 번호 blur 시 유효성 검사 및 공백여부 체크
	$("#userPhone").blur(function() {
		var phone = $("#userPhone").val();
		var oMsg = $("#userPhoneMsg");
		if ( phone == "" || phone.length != 13 ) {
	        showErrorMsg(oMsg,"휴대폰 번호를 올바르게 입력해주세요!");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//주소 blur 시 공백여부 체크
	$("#userAddress1").blur(function() {
		var address = $("#userAddress1").val();
		var oMsg = $("#userAddressMsg");
		if ( address == "") {
	        showErrorMsg(oMsg,"필수 정보입니다.");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//상세주소 blur 시 공백여부 체크
	$("#userAddress2").blur(function() {
		var address = $("#userAddress2").val();
		var oMsg = $("#userAddressMsg");
		if ( address == "") {
	        showErrorMsg(oMsg,"필수 정보입니다.");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//생년월일 blur 시 공백여부 체크
	$("#userBirth").blur(function() {
		var birth = $("#userBirth").val();
		var oMsg = $("#userBirthMsg");
		if ( birth == "" || birth.length != 10 ) {
	        showErrorMsg(oMsg,"생년월일을 올바르게 입력해주세요!");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//이메일 blur 시 공백여부 체크
	$("#userEmail").blur(function() {
		var email = $("#userEmail").val();
		var oMsg = $("#userEmailMsg");
		if ( email == "") {
	        showErrorMsg(oMsg,"필수 정보입니다.");
	        return false;
	    } else {
	    	hideMsg(oMsg);
	    	return true;
	    }
    });
	
	//회원가입 버튼 클릭 시 공백 항목 체크
	$("#btnJoin").click(function() {
		
		//아이디 체크(공백인 경우)
		if($("#userId").val() == ""){
			swal("아이디를 입력해주세요","", "warning").then(function(){
                $("input").eq(0).focus();
        	});
			return;
		} 

		//비밀번호 체크(공백인 경우)
		if($("#userPw").val() == ""){
			swal("비밀번호를 입력해주세요","", "warning").then(function(){
				$("input").eq(1).focus()
        	});
			return;
		} 

		//비밀번호 확인 체크 (비밀번호와 같지 않거나 공백인 경우)
		if($("#userPwChk").val() != $("#userPw").val() || $("#userPwChk").val() == ""){
			swal("비밀번호 확인을 비밀번호와 동일하게 입력해주세요","", "warning").then(function(){
				$("input").eq(2).focus()
        	});
			return;
		} 

		//이름 체크(공백인 경우)
		if($("#userName").val() == ""){
			swal("이름을 입력해주세요","", "warning").then(function(){
				$("input").eq(3).focus()
        	});
			return;
		} 


		//휴대폰 번호 체크(공백인 경우)
		if($("#userPhone").val() == ""){
			swal("휴대폰 번호를 입력해주세요","", "warning").then(function(){
				$("input").eq(4).focus()
        	});
			return;
		} 

		//주소 체크(공백인 경우)
		if($("#userAddress1").val() == ""){
			swal("주소를 입력해주세요","", "warning").then(function(){
				$("input").eq(7).focus()
        	});
			return;
		} 

		//상세주소 체크(공백인 경우)
		if($("#userAddress2").val() == ""){
			swal("상세주소를 입력해주세요","", "warning").then(function(){
				$("input").eq(8).focus()
        	});
			return;
		} 

		//생년월일 체크(공백인 경우)
		if($("#userBirth").val() == ""){
			swal("생년월일을 입력해주세요","", "warning").then(function(){
				$("input").eq(10).focus()
        	});
			return;
		} 

		//이메일 체크(공백인 경우)
		if($("#userEmail").val() == ""){
			swal("이메일을 입력해주세요","", "warning").then(function(){
				$("input").eq(11).focus()
        	});
			return;
		} 
		
		//주소 값 합친 후 $("#userAddress")에 삽입
// 		var post = $("#postCode").val();
// 		var addr1 = $("#userAddress1").val();
// 		var addr2 = $("#userAddress2").val();
// 		var address = post + ' ' + addr1 + ' ' + addr2;
		const address = $("#postCode").val() + ' ' + $("#userAddress1").val() + ' ' + $("#userAddress2").val();
		
		$("#userAddress").val(address);
		
		// 제출하기
		$(this).parents("form").submit();
	})
	
	//가입 취소 버튼(뒤로가기)
	$("#btnCancel").click(function() {
		history.go(-1)
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

//ID 유효성 검사 및 중복 검사
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

//PW 유효성 검사
function checkPw() {
    var pw = $("#userPw").val();
    var oMsg = $("#userPwMsg");
	
    if ( pw == "") {
        showErrorMsg(oMsg,"필수 정보입니다.");
        return false;
    }
	
    var isPW = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{7,15}$/;
//    var isPW = /^[a-zA-Z][!@#$%^*+=-][0-9]{7,15}$/;
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

/* 회원가입 텍스트 */
.joinTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin: 50px auto;
}

/* 컨테이너 전체 */
.join_content {
	margin: 0 auto;
	width: 400px;
}

/* 회원가입 항목 이름 */
.join_title {
	margin: 20px 0 10px; /* 상 좌우 하 */
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

/* 비밀번호 span 영역 */
.pwBox {
	position: relative;
	z-index: 1;
	flaot: left;
}

/* 버튼 div 영역 */
.btn_area {
	margin-top: 40px;
	margin-bottom: 50px;
	width: 411px;
}

/* 가입 취소 버튼 */
#btnCancel {
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

/* 회원가입 버튼 */
#btnJoin {
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

/* 주소찾기 div */
.findAddr {
    position: absolute;
    top: -3px;
    right: -10px;
}

/* 주소찾기 버튼 */
#findAddrBtn {
	width: 100px;
    height: 30px;
    border-radius: 5px;
    border: 1px solid #f4b0b0;
    background: #f4b0b0;
    font-weight: 600;
    font-size: 15px;
    cursor: pointer;
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
	<span class="error_msg" id="userPwMsg" style="display:none;">비밀번호는 8~16자의 영문자+숫자+특수문자 조합으로 사용 가능합니다.(사용가능 특수문자: !@#$%^*+=-)</span>

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
	<span class="error_msg" id="userNameMsg" style="display:none;"></span>
	
	<h3 class="join_title">
		<label for="userPhone">휴대폰번호</label>
	</h3>
	<span><input type="text" name="userPhone" id="userPhone" class="int" maxlength="13" autocomplete="off" placeholder="ex) 010-0000-0000"></span>
	<span class="error_msg" id="userPhoneMsg" style="display:none;"></span>
	
	<div class="addrDiv" style="position:relative;">
		<h3 class="join_title">
			<label for="userAddress">주소</label>
		</h3>
		<span class="findAddr"><input type="button" onclick="findAddress()" id="findAddrBtn" value="주소 검색"><br></span>
			<input type="hidden" id="postCode" placeholder="우편번호">
		<span><input type="text" id="userAddress1" class="int" placeholder="주소 검색 버튼을 눌러주세요" readonly="readonly"><br></span>
		<span><input type="text" style="margin-top: 5px;" id="userAddress2" class="int" placeholder="상세주소" autocomplete="off"></span>
			<input type="hidden" name="userAddress" id="userAddress" class="int" autocomplete="off">
		<span class="error_msg" id="userAddressMsg" style="display:none;"></span>
	</div>
	
	<h3 class="join_title">
		<label for="userBirth">생년월일</label>
	</h3>
	<span><input type="text" name="userBirth" id="userBirth" class="int" maxlength="10" autocomplete="off" placeholder="ex) 0000-00-00"></span>
	<span class="error_msg" id="userBirthMsg" style="display:none;"></span>
	
	<h3 class="join_title">
		<label for="userEmail">이메일</label>
	</h3>
	<span><input type="email" name="userEmail" id="userEmail" class="int" maxlength="30" autocomplete="off"></span>
	<span class="error_msg" id="userEmailMsg" style="display:none;"></span>

	<div class="btn_area">
		<button type="button" id="btnCancel">가입 취소</button>
		<button type="button" id="btnJoin">회원 가입</button>
	</div>

</div>
</form>

</body>
</html>