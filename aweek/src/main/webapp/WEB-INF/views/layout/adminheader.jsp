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

a {
	text-decoration: none;
}

/* body 태그 텍스트 가운데 정렬 */
body {
	text-align: center;
}

ul, li {
	list-style-type: none;
}

/* 메인 메뉴 - 1 Depth */
ul.nav {

	/* ul 태그의 기본 리스트 스타일(disc) 제거 */
	/* 기본적으로 점이 찍혀있는데 none을 써서 점을 지워줌 */	
	list-style-type: none;

	/* ul 태그의 기본 여백 제거 */
	padding: 0;
	margin: 0;
	
	/* ul 태그 가운데 정렬 */
	display: inline-block;
}

/* 메인 메뉴의 항목 */
ul.nav > li {

	/* */
	width: 250px;
	
	/* */
	border-radius: 1.1em;
	
	/* 수평으로 일렬로 배치하기 */
	float: left;

	/* 배경색 지정하기 */
	/* background-color: #666; */
	
	/* 항목 크기 변경(배경색 포함) */
	/* padding: 10px 5px; */
	
	/* 항목 크기 변경(배경색 미포함) */
	/* margin: 10px 5px; */

	/* 줄 간격을 이용한 높이 조절(배경색 포함) */
	line-height: 40px;
	
	/* 테두리를 이용한 메뉴 항목 구분 */
	border: 1px solid #43ff00;
	/* border-right: 1px solid #fff; */
	
	/* 서브 메뉴(absolute 요소)의 위치 기준점으로 설정 */
	position: relative;
}

/* 메인 메뉴의 항목 텍스트 */
ul.nav > li > span {
	
	/* 글자 색상 */
	color: #000;
	
	/* 글자 꾸밈선 제거(underline 제거) */
	text-decoration: none;
	
	/* 글자 크기 */
	font-size: 20px;

	/* 글자 모양 : 굵게 */
	/* font-weight: bold; */

	/* 글꼴 */
	font-family: 굴림 gulim 돋움 dotum;
	
	/* 내부 여백 */
	/* 링크 클릭이 가능한 영역 */
	padding: 10px 15px;
	
	/* 외부 여백 */
	/* 링크 클릭이 불가능한 영역 */
	margin: 0 5px;
}

/* 메인 메뉴의 항목 텍스트에 마우스를 올렸을 때 */
ul.nav > li > a:hover {
	color: green;
}

/* -------------------- */

/* 서브메뉴 */
ul.nav > li > ul {

	/* HTML 계층 구조에서 빼내는 설정 */
	/* 부모 요소가 배경색을 같이 씌우지 않음 */
	position: absolute;

	/* ul의 기본 리스트 스타일(circle) 제거 */
	list-style-type: none;
	
	/* ul 태그의 기본 여백 제거 */
	padding: 0;
	margin: 0;
	
	/* 서브 메뉴 영역의 너비 */
	width: 200px;
	
	/* 서브 메뉴의 위치 설정 */
	left: 21px;
}

/* 서브 메뉴의 항목 */
ul.nav > li > ul > li {
	
	/* 배경색 지정 */
	background-color: #999;

	/* 내부 여백 - 항목의 크기 설정 */
	/* padding: 10px; */

	/* 왼쪽 내부 여백 - 들여쓰기 효과 */
	/* padding-left: 20px; */
	
	/* 평소에 안보이도록 숨기기 */
	/* display: none; */
	
	/* 평소에 안보이도록 숨기기 */
	height: 0;		/* 컨텐츠 영역의 높이 제거 */
	font-size: 0;	/* 글자 크기 제거 */
	line-height: 0; /* 줄 간격 제거 */
}

/* 메인 메뉴 항목에 마우스를 올렸을 때 서브 메뉴의 항목이 보이도록 설정하기 */
/* 메인 메뉴 항목 : ul.nav > li */
ul.nav > li:hover > ul > li {

	height: 40px;	   /* 보여질 컨텐츠 영역의 높이 지정 */
	font-size: 15px;   /* 보여질 글자 크기 지정 */
	line-height: 40px; /* 보여질 줄 간격 높이 지정 */
}

/* 서브 메뉴의 항목 텍스트 */
ul.nav > li > ul > li > a {

	/* 배경색 지정 */
	background: #E0E3DA;
	
	/* 글자색 지정 */
	color: #333;
	
	/* 글자 꾸밈선 제거(underline 제거) */
	text-decoration: none;
	
	/* 부모 <li> 태그 크기만큼 영역을 차지하도록 설정 */
	display: block;
}

/* 서브 메뉴의 항목 텍스트에 마우스가 올라갔을 때 */
ul.nav > li > ul > li > a:hover {

	/* 글자색 지정 */
	color: green;

	/* 배경색 지정 */
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
			<a href="/admin/logout" style="color: black;">로그아웃</a>
			</c:if>
			</li>
		</ul>
	</div>
	<div style="margin: 0 auto;">
	<h1 style="height: 70px;"><a href="/admin/main" style="color: white;">ADMIN</a></h1>
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