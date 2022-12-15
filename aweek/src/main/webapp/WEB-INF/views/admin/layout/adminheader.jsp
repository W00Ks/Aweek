<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

.wrap {
	margin: 0 auto;
	width: 1100px;
}

.header {
	text-align: center;
	background: #43C446;
}

.footer {
	text-align: center;
	background: #43C446;
}

.container {
	min-height: 400px;
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
	margin: 0;
	display: inline-block;
}

ul.nav > li {

	width: 250px;
	border-radius: 1.1em;
	float: left;
	line-height: 40px;
	border: 1px solid #43ff00;
	position: relative;
}

ul.nav > li > span {
	color: #000;
	text-decoration: none;
	font-size: 20px;
	font-family: 굴림 gulim 돋움 dotum;
	padding: 10px 15px;
	margin: 0 5px;
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

<div class="wrap">

<header class="header">
	<div>
		<ul style="margin: 0 auto; background: #fff; display: flex; justify-content: flex-end;">
			<li>
				<c:if test="${ empty adminLogin }">
					<a href="/admin/login" style="color: black;">로그인</a>
				</c:if>

				<c:if test="${ not empty adminLogin }">
					<span>${ adminNick } 로그인 중...</span>
					<a href="/admin/logout" style="color: black;">로그아웃</a>
				</c:if>
			</li>
		</ul>
	</div>
	
	<div style="margin: 0 auto;">
		<h1 style="height: 70px;">
			<a href="/admin/main" style="color: white;">ADMIN</a>
		</h1>
	</div>
</header>

<ul class="nav">
	<li>
		<span>회원 정보</span>
		<ul>
			<li><a href="/admin/memberlist">회원 목록</a>
			<li><a href="/admin/roomlist">방 목록</a>
			<li><a href="/admin/paymentlist">결제 목록</a></li>
		</ul>
	</li>
	
	<li>
		<span>검색</span>
		<ul>
			<li><a href="/admin/membersearch">회원 정보</a></li>
			<li><a href="/admin/paymentseacrh">결제 정보</a></li>
		</ul>
	</li>
	
	<li>
		<span>고객센터</span>
		<ul>
			<li><a href="/admin/noticelist">공지사항</a></li>
			<li><a href="/admin/inquirylist">1:1 문의</a></li>
			<li><a href="/admin/qnalist">자주 묻는 질문</a></li>
		</ul>	
	</li>
	
	<li>
		<span>통계</span>
		<ul>
			<li><a href="/admin/staties">회원가입</a></li>
			<li><a href="/admin/staties">방문자</a></li>
			<li><a href="/admin/staties">결제</a></li>
			<li><a href="/admin/staties">개설된 방</a></li>
		</ul>
	</li>
</ul>