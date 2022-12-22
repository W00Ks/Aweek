<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	//메인으로 버튼 클릭
	$("#btnMain").click(function() {
		$.ajax({
			type:"post"
			, url: "/member/logout"
			, data: {
			}
		, dataType: "html"
		, success: function() {
			window.location.href="/aweekHome";
		}
		})
	})
	
	//로그인 버튼 클릭
	$("#btnLogin").click(function() {
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
	
})
</script>

<style type="text/css">

/* 아이디 찾기 텍스트 */
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
	width: 600px;
	margin-bottom: 90px;
}

/* 아이디 div 영역 */
.idBox {
	margin: 50px auto;
	border: 1px solid #e5e5e5;
	width: 600px;
	height: 200px;
	position: relative;
    background-color: #fff4f4;
}

/* 아이디 안내 텍스트 */
.idBoxWord {
	position: absolute;
	top: 12px;
	width: 100%;
	text-align: center;
    line-height: 55px;
}

/* 아이디 텍스트 */
.idWord {
	font-weight: 600;
	font-size: 23px;
	color: #666;
}

/* 아이디 노출 영역 */
.idArea {
	font-weight: 600;
	font-size: 25px;
	color: #594B4B;
}

/* 버튼 영역 */
.btn_area {
	margin: 20px auto;
	width: 450px;
}

/* 홈으로 버튼 */
#btnMain {
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

/* 로그인 버튼 */
#btnLogin {
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

.member_footer {
	position: absolute;
    width: 100%;
}

</style>

<c:import url="../layout/mainHeader.jsp" />

<div class="container">
	<div class="mainTxt">회원가입 완료</div>
	<div class="idBox">
		<div class="idBoxWord">
			<span class="idWord">AWEEK에 오신 것을 환영합니다!</span><br>
			<span class="idArea">회원가입 아이디 : ${userId}</span><br>
			<span class="idWord">로그인 후 마음에 드는 모임을 찾아보세요!</span>
		</div>
	</div>
	
	<div class="btn_area">
		<button type="button" id="btnMain" class="btnType">메인으로</button>
		<button type="button" id="btnLogin" class="btnType">로그인</button>
	</div>
	
</div>

<div class="member_footer">
	<c:import url="../layout/mainFooter.jsp" />
</div>