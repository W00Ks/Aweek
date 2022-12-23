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
	
	//비밀번호 입력 후 엔터키 입력 시 $("#btnUserWd").click() 호출
	$("input").eq(0).keypress(function(e) {
		if( e.keyCode == 13 ) {
			$("#btnUserWd").click();
		}
	})
	
	//취소 버튼 클릭(팝업 닫기)
	$("#btnCancel").click(function() {
		close();
	})
	
	//회원 탈퇴 버튼 클릭
	$("#btnUserWd").click(function() {
		
		//현재 비밀번호 체크(공백인 경우)
		if($("#userPw").val() == ""){
			swal("비밀번호를 입력해주세요","", "warning").then(function(){
				$("input").eq(0).focus()
        	});
			return;
		} 
		
		//비밀번호 체크
		$.ajax({
	        type:"post"
	        , url: "./pwChk"
	       	, data : {
				userId : "${member.userId}"
				, userPw : $("#userPw").val()
			}
			, dataType : "html"
	        , success : function( res ) {
        		//회원 탈퇴 처리
	        	if ( res == 1 ) {
	        	    $.ajax({
	        	        type:"post"
	        	        , url: "./userWd"
	        	       	, data : {
	        				userId : "${member.userId}"
	        			}
	        			, dataType : "html"
	        	        , success : function() {
	        	        	swal("회원 탈퇴 성공","다음에 또 만나요~", "success").then(function(){
	        	        		$.ajax({
	        	    				type:"post"
	        	    				, url: "/member/logout"
	        	    				, data: {
	        	    				}
	        	    			, dataType: "html"
	        	    			, success: function() {
		        	        		window.close();
									opener.parent.location="/aweekHome";
	        	    			}
	        	    			})
	        	        	});
	        	        }
	        	    });
	        	} else {
	        		swal("회원 탈퇴 실패!","비밀번호가 일치하지 않습니다.", "error").then(function(){
	        			$("#OriginUserPw").focus()
	        		});
	        	}
	        }
		})//비밀번호 체크 끝
	    
	})//$("#btnModifyPw").click(function() {} 끝
	
})

</script>

<style type="text/css">

@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

h3 {
	margin: 10px 0;
}

p {
	margin: 1px 0;
	line-height: 20px;
}

.pp {
	margin: 10px 0 15px;
}

/* 컨테이너 전체 */
.container {
	margin: 0 auto;
	width: 600px;
	font-family: 'NanumSquareNeo-Variable';
	cursor: default;
}

/* 비밀번호 변경 텍스트 */
.mainTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin-top: 30px;
	font-family: 'NanumSquareNeo-Variable';
}

/* PW BOX 영역 */
.pwDiv {
	text-align: center;
    margin: 10px 0;
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
	font-family: 'NanumSquareNeo-Variable';
}

/* input focus */
input:focus{
	border: 2px solid #f4b0b0;
}

/* 버튼 영역 */
.btn_area {
	margin: 10px auto;
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
    font-family: 'NanumSquareNeo-Variable';
}

/* 회원 탈퇴 버튼 */
#btnUserWd {
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
	font-family: 'NanumSquareNeo-Variable';
}

/* V 아이콘 */
#chk1, #chk2, #chk3 {
	font-size: 13px;
	color: #390;
    font-weight: 600;
}

/* 안내 텍스트 */
.h_dropout {
	font-size: 13px;
	font-weight: 600;
	word-spacing: -0.6px;
}

/* 아이디 텍스트 */
.h_dropout em {
	font-size: 13px;
	color: #390;
	font-style: normal;
}

/* 상세 안내 텍스트 */
.dropout_dsc {
	font-size: 13px;
    padding-left: 20px;
    margin-bottom: 10px;
}

/* 상세 텍스트 강조 */
.dropout_dsc em {
	font-size: 13px;
	font-weight: 600;
	color: #ff6000;
	font-style: normal;
}

</style>

</head>
<body>

<div class="container">
<span id="userId" style="display:none">${member.userId }</span>
	<div class="mainTxt">회원 탈퇴</div>
	<div class="guideMain">
		<h3>탈퇴 안내</h3>
		<p class="pp">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요!</p>
		
		<span class="material-icons" id="chk1">done</span>
		<span class="h_dropout">사용하고 계신 아이디(
			<em>${member.userId}</em>
			)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
		</span>
		<p class="dropout_dsc">
     	  <em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
    	</p>
    	
		<span class="material-icons" id="chk2">done</span>
		<span class="h_dropout">탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.
		</span>
		<p class="dropout_dsc">
     	  회원정보 및 개설 모임, 일정, 다이어리, 채팅 등 개인형 서비스 이용기록은 모두 삭제되며,<br>삭제된 데이터는 복구되지 않습니다.<br>
     	  삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
    	</p>
    	
		<span class="material-icons" id="chk3">done</span>
		<span class="h_dropout" style="word-spacing :-0.6px">상기 내용에 동의하시면 비밀번호를 입력 후 [회원 탈퇴] 버튼을 클릭하시면 회원 탈퇴가 완료됩니다. 
		</span>
    	
	</div>
	
	<div class="pwDiv">
		<input type="password" name="userPw" id="userPw" class="int" maxlength="16" placeholder="비밀번호 입력" autocomplete="off">
		<span class="error_msg" id="userPwMsg" style="display:none;"></span>
	</div>
	
	<div class="btn_area">
		<button type="button" id="btnCancel" class="btnType">취소</button>
		<button type="button" id="btnUserWd" class="btnType">회원 탈퇴</button>
	</div>
	
</div>

</body>
</html>