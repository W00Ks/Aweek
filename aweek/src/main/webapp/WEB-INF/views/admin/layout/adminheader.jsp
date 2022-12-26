<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon"/>
<meta charset="UTF-8">
<title>Aweek 관리자 페이지</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<script>

$(document).ready(function() {

	$("#aweekhome").click(function() {
		var aweekhome = confirm("홈페이지 메인으로 이동하시겠습니까?")

		if( aweekhome == true ) {
			alert("홈페이지 메인으로 이동합니다.")
			location.href = "/aweekHome"
		} else if( aweekhome == false ) {
			return false;
		}
	})
})

</script>

<style type="text/css">

.adminlogin {
	max-width:1100px;
	margin: 0 auto;
}

.wrap {
	margin: 0 auto;
	width: 1100px;
}

.header {
	text-align: center;
	background: white;
}

.footer {
	text-align: center;
	background: #43C446;
}

.container {
	min-height: 400px;
}

.wrapheader {
	background: #43C446;
}

.logo {
	color: white;
}

header {
	width: 100%;
}

body {
	text-align: center;
}

a {
	text-decoration: none;
}

ul, li {
	list-style-type: none;
}

ul.nav {
	list-style-type: none;
	padding: 0;
	margin: 20px 0px;
	display: inline-block;
}

ul.nav > li {

	width: 155px;
	border-radius: 1.1em;
	float: left;
	line-height: 40px;
	border: 1px solid #43ff00;
	position: relative;
}

ul.nav > li > span {
	color: #000;
	text-decoration: none;
	font-size: 12px;
	font-family: 굴림 gulim 돋움 dotum;
	padding: 10px 15px;
	margin: 0 5px;
}

ul.nav > li > span > a {
	color: black;
}

ul.nav > li > a:hover {
	color: green;
}

ul.nav > li > ul {
	position: absolute;
	list-style-type: none;
	padding: 0;
	margin: 0;
	width: 200px;
	left: 21px;
}

ul.nav > li > ul > li {
	background-color: #999;
	height: 0;
	font-size: 0;
	line-height: 0;
}

ul.nav > li:hover > ul > li {
	height: 40px;
	font-size: 15px;
	line-height: 40px;
}

ul.nav > li > ul > li > a {

	background: #E0E3DA;
	color: #333;
	text-decoration: none;
	display: block;
}

ul.nav > li > ul > li > a:hover {
	color: green;
	background-color: white;
}

</style>

</head>
<body>

<header class="header">
	<div class="adminlogin">
		<ul style="margin: 0 auto; display: flex; justify-content: flex-end;">
			<li>
				<c:if test="${ empty adminLogin }">
					<a href="/admin/login" style="color: black;">로그인</a>
					<a href="/aweekHome" id="aweekhome">aweek</a>
				</c:if>

				<c:if test="${ not empty adminLogin }">
					<span style="color: black;">${ adminNick } 로그인 중... </span>
					<a href="/admin/logout" style="color: black;">로그아웃</a>
					<a href="<%=request.getContextPath() %>/aweekHome" class="logo" id="aweekhome">
						<img src="<%=request.getContextPath() %>/resources/img/aweekLogo_black.png" alt="aweekLogo" width="50px;">
					</a>
				</c:if>
			</li>
		</ul>
	</div>
</header>

<div class="wrap">
	<div class="wrapheader" style="margin: 0 auto;">
		<h1 style="margin: 0 auto;">
			<a href="/admin/main" style="color: white;">ADMIN</a>
		</h1>
	</div>

<ul class="nav">
	<li>
		<span><a href="/admin/memberlist">회원 관리</a></span>
	</li>

	<li>
		<span><a href="/admin/roomlist">방 관리</a></span>
	</li>

	<li>
		<span><a href="/admin/paymentlist">결제 관리</a></span>
	</li>

	<li>
		<span><a href="/admin/noticelist">공지사항 관리</a></span>
	</li>

	<li>
		<span><a href="/admin/qnalist">자주 묻는 질문 관리</a></span>
	</li>
	
	<li>
		<span><a href="/admin/inquirylist">1:1 문의 관리</a></span>
	</li>

	<li>
		<span><a href="/admin/staties">통계 관리</a></span>
	</li>
</ul>