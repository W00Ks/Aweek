<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<!--Google Material Icons new ver.-->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

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
	
	//비밀번호 변경 버튼 클릭 시 팝업 열기
	$("#modifyPwBtn").click(function(){
		let openUrl = "/member/pwModify";
		let popOption = "width=630px, height=410px, top=300px, left=1000px, scrollbars=no";
		window.open(openUrl, 'pop', popOption);
	})
	
	//휴대폰 번호 변경 버튼 클릭 시 팝업 열기
	$("#modifyPhoneBtn").click(function(){
		let openUrl = "/member/phoneModify";
		let popOption = "width=630px, height=580px, top=200px, left=1000px, scrollbars=no";
		window.open(openUrl, 'pop', popOption);
	})
	
	//회원 탈퇴 버튼 클릭 시 팝업 열기
	$("#btnWd").click(function() {
		let openUrl = "/member/userWd";
		let popOption = "width=800px, height=500px, top=200px, left=1000px, scrollbars=yes";
		window.open(openUrl, 'pop', popOption);
	})
	
    //회원정보 수정 페이지 접속 시 비밀번호 포커스 주기
	$("#userPw").focus();
	
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
	$("#btnModify").click(function() {
		
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
				$("input").eq(8).focus()
        	});
			return;
		} 

		//상세주소 체크(공백인 경우)
		if($("#userAddress2").val() == ""){
			swal("상세주소를 입력해주세요","", "warning").then(function(){
				$("input").eq(9).focus()
        	});
			return;
		} 

		//생년월일 체크(공백인 경우)
		if($("#userBirth").val() == ""){
			swal("생년월일을 입력해주세요","", "warning").then(function(){
				$("input").eq(11).focus()
        	});
			return;
		} 

		//이메일 체크(공백인 경우)
		if($("#userEmail").val() == ""){
			swal("이메일을 입력해주세요","", "warning").then(function(){
				$("input").eq(12).focus()
        	});
			return;
		} 
		
		const address = $("#postCode").val() + ',' + $("#userAddress1").val() + ',' + $("#userAddress2").val();
		if($("#userAddress").val() == null || $("#userAddress").val() == '') {
			$("#userAddress").val(address);
		}
		
		//비밀번호 체크
		$.ajax({
			type:"post"
			, url: "/member/pwChk"
			, data: {
				userId : $("#userId").val()
				, userPw : $("#userPw").val()
			}
		, dataType: "html"
		, success: function( res ) {
			if( res == 1 ) {
			
			//회원정보 변경 처리
			$.ajax({
				type:"post"
				, url: "/member/info"
				, data: {
					userId : $("#userId").val()
					, userPw : $("#userPw").val()
					, userName : $("#userName").val()
					, userPhone : $("#userPhone").val()
					, userAddress : $("#userAddress").val()
					, userBirth : $("#userBirth").val()
					, userEmail : $("#userEmail").val()
				}
			, dataType: "html"
			, success: function( res ) {
				swal("","회원정보가 변경되었습니다.", "success").then(function() {
					window.location.href="/member/info";
				})
			}
			})
			} else {
				swal("","비밀번호가 일치하지 않습니다.", "error").then(function() {
					$("#userPw").focus();
				})
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

</script>

<style type="text/css">

/* 회원가입 텍스트 */
.infoTxt {
/* 	width: 800px; */
    text-align: center;
    color: #555555;
    font-size: 30px;
    font-weight: bold;
    margin: 20px auto;
}

/* 컨테이너 전체 */
.info_content {
	margin: 0 auto;
	width: 500px;
}

/* 회원가입 항목 이름 */
label {
	width: 105px;
	display: inline-block;
	padding-right: 15px;
    padding-left: 3px;
	font-size: 14px;
    font-weight: 600;
}

/* input box */
.int {
	border: 1px solid #ccc;
	outline: 0;
	width: 350px;
	height: 35px;
	cursor: pointer;
	font-size: 14px;
	padding-left: 15px;
    margin: 12px 0;
}

/* input focus */
input:focus{
	border: 2px solid #f4b0b0;
}

/* 에러 메시지 */
.error_msg {
	font-size: 12px;
	color: red;
	padding-left: 130px;
}

/* 성공 메시지 */
.success_msg {
	font-size: 12px;
	color: green;
	padding-left: 130px;
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

/* 비밀번호 span 영역 */
.pwBox {
	position: relative;
	z-index: 1;
}

/* 비밀번호 변경 span 영역 */
.modifyPw {
    position: absolute;
    top: 20px;
    right: 480px;
}

/* 비밀번호 변경 버튼 */
#modifyPwBtn {
	width: 95px;
    height: 25px;
    border-radius: 5px;
    border: 1px solid #f4b0b0;
    background: #f4b0b0;
    font-weight: 600;
    font-size: 12px;
    cursor: pointer;
}

/* 회원 정보 수정 버튼 div 영역 */
.btn_area {
	margin-top: 40px;
	margin-bottom: 50px;
	width: 500px;
	text-align: center;
	position: relative;
}

/* 회원정보 수정 버튼 */
#btnModify {
	width: 300px;
    height: 50px;
    border-radius: 30px;
    font-size: 15px;
    font-weight: 600;
    background-color: #f4b0b0;
    border: 1px solid #f4b0b0;
    color: #ffffff;
    cursor: pointer;
    margin: 20px 0;
}

/* 회원 탈퇴 버튼 */
#btnWd {
    width: 100px;
    height: 30px;
    float: right;
    border-radius: 30px;
    font-size: 10px;
    background-color: white;
    border: 1px solid #ccc;
    color: #ccc;
    cursor: pointer;
    position: absolute;
    left: 395px;
    top: -45px;
    margin: 10px 0;
}

/* 주소검색 span 영역 */
.findAddr {
    position: absolute;
    top: 19px;
    right: 8px;
}

/* 주소검색 버튼 */
#findAddrBtn {
	width: 75px;
    height: 25px;
    border-radius: 5px;
    border: 1px solid #f4b0b0;
    background: #f4b0b0;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
}

/* 아이디, 휴대폰 번호 span영역 */
#userId, #userPhone {
	background-color: #f3f3f3;
	border: none;
}

/* 휴대폰 번호 변경 span 영역 */
.modifyPhone {
    position: absolute;
    top: 18px;
    right: 8px;
}

/* 휴대폰 번호 변경 버튼 */
#modifyPhoneBtn {
	width: 115px;
    height: 25px;
    border-radius: 5px;
    border: 1px solid #f4b0b0;
    background: #f4b0b0;
    font-weight: 600;
    font-size: 13px;
    cursor: pointer;
}

</style>

</head>
<body>

<c:import url="../layout/mypageTop.jsp" />

<form action="/member/info" method="post" name="infoForm">

<div class="infoTxt" style="position:relative;">
	<span>회원정보 수정</span>
	<span class="modifyPw"><button type="button" id="modifyPwBtn">비밀번호 변경</button><br></span>
</div>

<div class="info_content">
	<div class="info_title">
		<label for="userId">아이디</label>
		<input type="text" name="userId" id="userId" class="int" maxlength="20" value="${member.userId }" readonly="readonly">
	</div>
	<span class="error_msg" id="userIdMsg" style="display:none;"></span>
	
	<div class="info_title">
		<label for="userPw">비밀번호</label>
		<span class="pwBox"><input type="password" name="userPw" id="userPw" class="int" maxlength="16" autocomplete="off">
			<span class="material-icons" id="pwView1">visibility</span>
		</span>
	</div>
	<span class="error_msg" id="userPwMsg" style="display:none;">비밀번호를 수정 하실 경우에만 입력해주세요.</span>

	<div class="info_title">
		<label for="userPwChk">비밀번호 확인</label>
	<span class="pwBox"><input type="password" name="userPwChk" id="userPwChk" class="int" maxlength="16" autocomplete="off">
		<span class="material-icons" id="pwView2">visibility</span>
	</span>
	</div>
	<span class="error_msg" id="userPwChkMsg" style="display:none;"></span>
	
	<div class="info_title">
		<label for="userName">이름</label>
	<span><input type="text" name="userName" id="userName" class="int" maxlength="10" value="${member.userName }" autocomplete="off"></span>
	</div>
	<span class="error_msg" id="userNameMsg" style="display:none;"></span>
	
	<div class="info_title" style="position:relative;">
		<label for="userPhone">휴대폰번호</label>
		<input type="text" name="userPhone" id="userPhone" class="int" maxlength="13" value="${member.userPhone }" readonly="readonly" placeholder="ex) 010-0000-0000">
		<span class="modifyPhone"><input type="button" id="modifyPhoneBtn" value="휴대폰 번호 변경"><br></span>
	</div>
	<span class="error_msg" id="userPhoneMsg" style="display:none;"></span>
	
	<div class="addrDiv" style="position:relative;">
		<div class="info_title">
			<label for="userAddress2">주소</label>
		<span class="findAddr"><input type="button" onclick="findAddress()" id="findAddrBtn" value="주소 검색"><br></span>
		<c:set var="address" value="${member.userAddress}" />
			<input type="hidden" id="postCode" placeholder="우편번호" value="${fn:split(address, ',')[0]}">
		<span><input type="text" id="userAddress1" class="int" placeholder="주소 검색 버튼을 눌러주세요" readonly="readonly"
					value="${fn:split(address, ',')[1]}"><br></span>
		<label></label>
			<span><input type="text" style="margin-top: 5px;" id="userAddress2" class="int" placeholder="상세주소" autocomplete="off"
						value="${fn:split(address, ',')[2]}"></span>
			<input type="hidden" name="userAddress" id="userAddress" class="int" autocomplete="off">
		</div>
		<span class="error_msg" id="userAddressMsg" style="display:none;"></span>
	</div>
	
	<div class="info_title">
		<label for="userBirth">생년월일</label>
	<span><input type="text" name="userBirth" id="userBirth" class="int" maxlength="10" value="${member.userBirth }" autocomplete="off" placeholder="ex) 0000-00-00"></span>
	</div>
	<span class="error_msg" id="userBirthMsg" style="display:none;"></span>
	
	<div class="info_title">
		<label for="userEmail">이메일</label>
	<span><input type="email" name="userEmail" id="userEmail" class="int" maxlength="30" value="${member.userEmail }" autocomplete="off"></span>
	</div>
	<span class="error_msg" id="userEmailMsg" style="display:none;"></span>
	
	<div class="btn_area">
		<button type="button" id="btnModify">회원정보 수정</button>
		<button type="button" id="btnWd">회원 탈퇴</button>
	</div>
	
</div>
</form>

</body>
</html>