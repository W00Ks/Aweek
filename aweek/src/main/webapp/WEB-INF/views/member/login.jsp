<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- SweetAlert2 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>

<!-- kakao Login -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<!---------- 카카오 로그인 기능 처리 ---------->
<script>
Kakao.init('83db0909626a39e8a1cdaf664b67a04d'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오 로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	console.log(response)
        	console.log(response.id)
        	console.log(response.kakao_account.profile.nickname)
        	console.log(response.kakao_account.email)
        	
        	const uId = 'kakao' + response.id;
        	const uName = response.kakao_account.profile.nickname;
        	const uEmail = response.kakao_account.email;
        	
        	$.ajax({
				type:"post"
				, url: "/member/joinIdChk"
				, data: {
					userId : uId
				}
				, dataType: "html"
				, success: function( res ) { // return: 1 => 회원
					if( res == 1 ){
						$.ajax({
							type:"post"
							, url: "/member/kakaoLogin"
							, data: {
								userId : uId
							}
							, dataType: "html"
							, success: function( res ) {
								if ( res == 1 ) {
									swal("로그인 성공!", uName + "님 환영합니다!", "success").then(function(){
										window.location.href="/aweekHome";
						        	});
								} else {
									swal("로그인 실패!", "다시 시도 해주세요", "error")
								}
							}
						})
					} else { // return: 0 => 비회원
						
						swal("가입되지 않은 회원입니다.", "회원가입 페이지로 이동합니다.", "info").then(function(){
							$.ajax({
								type:"post"
								, url: "/member/kakaoJoinChk"
								, data: {
									userId : uId
									, userName : uName
									, userEmail : uEmail 
								}
								, dataType: "html"
								, success: function() {
									//카카오 로그인 전용 회원가입 페이지 이동
									window.location.href="/member/kakaoJoin";
								}
							})
						});
						
					}
				}
				
			})
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>

<!---------- 아이디 저장 기능 처리 ---------->
<script type="text/javascript">
$(document).ready(function() {
	
	//------------------------------------ 아이디 저장 기능 ------------------------------------
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key); 
     
    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    if($("#userId").val() != ""){ 
        $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#checkId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#checkId").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#checkId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });

	// 쿠키 저장하기 
	// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	// 쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	 
	// 쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) { // 쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
				end = cookieData.length;
	            console.log("end위치  : " + end);
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
	
	//------------------------------------ 아이디 저장 기능 끝 ------------------------------------
	
	//세션 확인 코드
	console.log(sessionStorage.length);
	
	//로그인 페이지 접속 시 ID 포커스 주기
	$("#userId").focus();
	
	//패스워드 입력창에 엔터키 입력 시 $("#btnLogin").click() 호출
	$("input").eq(2).keypress(function(e) {
		if( e.keyCode == 13 ) { //엔터키
			$("#btnLogin").click();
		}
	})
	
	//로그인 버튼 클릭
	$("#btnLogin").click(function() {
		var id = $("#userId").val();
	    var pw = $("#userPw").val();
	    var oMsg = $("#errorMsg");
		
	    //아이디가 공백인 경우
		if(id == ""){
			showErrorMsg(oMsg,"※ 아이디를 입력해주세요!");
			$("input").eq(1).focus()
			return false;
		} 

		//비밀번호가 공백인 경우
		if(pw == ""){
			showErrorMsg(oMsg,"※ 비밀번호를 입력해주세요!");
			$("input").eq(2).focus()
			return false;
		} 
		
	    $.ajax({
	        type:"post"
	        , url: "./login"
	       	, data : {
				userId : $("#userId").val(),
				userPw : $("#userPw").val()
			}
			, dataType : "html"
	        , success : function( result ) {
	            if (result == 0) {
	            	swal("로그인 실패","아이디 또는 비밀번호를 확인해주세요!", "error").then(function(){
		                $("input").eq(2).focus();
		                hideMsg(oMsg);
	            	});
// 	            	alert("로그인 실패 : 아이디 또는 비밀번호를 확인해주세요!");
// 	                $("input").eq(1).focus();
				    
	            } else if ( result == 1 ) {
	            	swal("로그인 성공!", $('#userId').val() + "님 환영합니다!", "success").then(function(){
	            		location.href='/aweekHome';
	            	});
// 	            	alert("로그인 성공! " + $("#userId").val() + "님 환영합니다!");
// 	            	window.location.href = "/aweek/main";
	            }
	        }
	    });
	});
	
	$("#btnLogout").click(function() {
		swal("로그아웃 완료!","다음에 또 만나요~", "success").then(function(){
			kakaoLogout();
			$.ajax({
				type:"post"
				, url: "/member/logout"
				, data: {
				}
			, dataType: "html"
			, success: function( res ) {
				window.location.href="/aweekHome";
			}
			})
		});
	})
	
});

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

/* 로그인 텍스트 */
.mainTxt {
	text-align: center;
	color: #f4b0b0;
	font-size: 40px;
	font-weight: bold;
	margin: 150px auto 50px;
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
	width: 411px;
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

/* 아이디|비밀번호 찾기, 회원가입 div */
.joinDiv {
	position: relative;
	height: 40px;
}

/* 아이디|비밀번호 찾기 버튼 */
#find {
	position: absolute;;
	margin-left: 3px;
	margin-top: 10px;
}

#join > a {
	color: #666666;
	font-size: 12px;
	text-decoration: none;
}

#join > a:hover {
	color: #390;
	font-size: 13px;
	font-weight: bold;
}

/* 아이디|비밀번호 찾기 속성 */
#find > a {
	letter-spacing :-0.5px;
	padding: 0;
	color: #666666;
	font-size: 12px;
	text-decoration: none;
}

/* 아이디|비밀번호 찾기 hover */
#find > a:hover {
	color: #2ba1ff;
	font-weight: bold;
	font-size: 13px;
}

/* 회원가입 버튼 */
#join {
	position: absolute;;
	right: 3px;
	margin-top: 10px;
}

/* 로그인, 카카오 로그인 사이 */
.join-divide {
	display: flex;
    align-items: center;
    padding: 20px 0;
}

/* 로그인, 카카오 로그인 사이 줄 */
.half-line {
    height: 1px;
    width: 100%;
    display: block;
    background: #dadada;
}

/* 로그인, 카카오 로그인 사이 글자 */
.half-chars {
    color: #707070;
    padding: 0 20px;
    word-break: keep-all;
}

/* 로그인 버튼 */
#btnLogin {
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

/* 카카오 로그인 버튼 */
#btnKakaoLogin {
	width: 411px;
    height: 50px;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 600;
    background-color: #FFE812;
    border: 1px solid #FFE812;
    color: black;
    cursor: pointer;
}

/* 카카오 로그인 div */
.KakaoDiv {
	position: relative;
	height: 50px;
	z-index: 1;
}

/* 카카오 아이콘 */
.kakaoIcon {
	position: absolute;
	z-index: 2;
}

/* 카카오 아이콘 이미지 */
.kakaoIcon > img {
	height: 49px;
	padding-left: 3px;
}

/* 로그인 유효성 검사 메시지 */
.error_msg {
	font-size: 13px;
	color: red;
	margin-left: 5px;
}

/* 아이디 저장 버튼 */
.checkIdDiv {
	margin: 4px 0;
	position: relative;
}

/* 아이디 저장 글자 */
.checkIdFont {
	font-size: 12px;
	color: #666666;
	position: absolute;
	top: 3px;
	left: 22px;
}

</style>

<c:import url="../layout/mainHeader.jsp" />

<div class="container">
	<div class="mainTxt">로그인</div>

	<form action="/member/login" method="post" onSubmit="return false;">
	<div class="divId">
		<input type="text" class="int" id="userId" name="userId" placeholder="아이디" autocomplete="off">
	</div>

	<div class="divPw">
		<input type="password" class="int" id="userPw" name="userPw" placeholder="비밀번호" autocomplete="off">
	</div>
	<span class="error_msg" id="errorMsg" style="display:none;"></span>
	
	<div class ="joinDiv">
		<div id="find">
			<a href="/member/findId" class="btnFindId" id="btnFindId">아이디 찾기</a>
			<span style="color:#ccc; font-weight:bold;"> | </span> 
			<a href="/member/findPw" class="btnFindPw" id="btnFindPw">비밀번호 찾기</a>
		</div>
		<div id="join">
			<a href="/member/join" id="btnJoin">회원가입</a>
		</div>
	</div>
	
	<div class="loginDiv">
	    <div class="checkIdDiv">
	    <input type="checkbox" id="checkId" name="checkId">
    	<label for="checkId"><span class="checkIdFont">아이디 저장</span></label>
    	</div>
		<button type="button" id="btnLogin">로그인</button>
	</div>
	</form>
	
	<div class="join-divide">
		<div class="half-line"></div>
		<div class="half-chars">또는</div>
		<div class="half-line"></div>
	</div>
	<div class="KakaoDiv">
		<span class="kakaoIcon"><img src="/resources/member/kakaoicon.jpg"></span>
		<button id="btnKakaoLogin" onclick="kakaoLogin();">카카오 로그인</button>
		<button id="btnLogout">로그아웃</button>
	</div>

</div>

</body>
</html>