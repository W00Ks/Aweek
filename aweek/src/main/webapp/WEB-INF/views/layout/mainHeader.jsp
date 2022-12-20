<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<!-- favicon -->
<link rel="icon" href="/resources/favicon.ico" type="image/x-icon"/>
<meta charset="UTF-8">
<title>Aweek</title>

	
	
	<!--Open Graph-->
	<meta property="og:type" content="website" />
	<meta property="og:site_name" content="Aweek" />
	<meta property="og:title" content="aweek room" />
	<meta property="og:description" content="직장, 동호회, 친구와 스케줄을 공유하세요!" />
	<meta property="og:image" content="<%=request.getContextPath() %>/resources/img/aweekLogo.png" />
	<meta property="og:url" content="https://localhost:8888/aweek/room/main" />
	
	<!--Twitter Card-->
	<meta property="twitter:card" content="summary" />
	<meta property="twitter:site" content="Aweek" />
	<meta property="twitter:title" content="aweek room" />
	<meta property="twitter:description" content="직장, 동호회, 친구와 스케줄을 공유하세요!" />
	<meta property="twitter:image" content="<%=request.getContextPath() %>/resources/img/aweekLogo.png" />
	<meta property="twitter:url" content="https://localhost:8888/aweek/room/main" />
	
	<!--브라우저 스타일 초기화-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  	<!-- google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

	<!--Google Material Icons new ver.-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

	<!-- jQuery 2.2.4 -->
   <script defer type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
   
   <!-- SweetAlert2 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
   <script defer src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
   
   <!-- kakao Login -->
   <script defer src="https://developers.kakao.com/sdk/js/kakao.js"></script>

 	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainHeader.css" type="text/css" />
	<script defer type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mainHeader.js"></script>

</head>

<body>

<!-- HEADER -->
<header>
	<div class="inner">
    	<ul class="header__top">
			<c:choose>
				<c:when test="${empty userNo || userNo eq '0'}">
					<li><a href="/member/join">회원가입</a></li>
					<li><a href="/member/login">로그인</a></li>
				</c:when>
				<c:otherwise>
	    			<li><a id="btnLogout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>
	    </ul>
	</div>
</header>

<nav>
	<div class="inner">
		<div class="nav__logo">
      		<a href="<%=request.getContextPath() %>/aweekHome" class="logo">
	        	<img src="<%=request.getContextPath() %>/resources/img/aweekLogo_black.png" alt="aweekLogo">
	    	</a>
    	</div>
    	
    	<div class="nav__menu-wrap">
			<ul class="nav__menu">
				<li>어위크
					<div class="sub-menu-wrap">
						<div class="sub-menu">
							<ul class="inner aweek">
								<li class="sub-title"><p>어위크 소개</p>
									<a href="javascript:void(0)"><span>어위크 소개</span></a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>모임
					<div class="sub-menu-wrap">
						<div class="sub-menu">
							<ul class="inner room">
								<li class="sub-title"><p>모임</p>
									<a href="/chat/main"><span>채팅</span></a>
									<a href="/calendar/myCal"><span>캘린더</span></a>
									<a href="/diary/main"><span>다이어리</span></a>
									<a href="/room/main"><span>모임 메인</span></a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>결제
					<div class="sub-menu-wrap">
						<div class="sub-menu">
							<ul class="inner pay">
								<li class="sub-title"><p>결제 안내</p>
									<a href="javascript:void(0)"><span>상품 및 가격 안내</span></a>
									<a href="/payment/payment"><span>결제</span></a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>고객센터
					<div class="sub-menu-wrap">
						<div class="sub-menu">
							<ul class="inner cs">
								<li class="sub-title"><p>고객센터</p>
									<a href="/cs/notice"><span>공지사항</span></a>
									<a href="/cs/qna"><span>자주하는 질문</span></a>
									<a href="/cs/inquiry"><span>1:1 질문</span></a>
								</li>
							</ul>
						</div>
					</div>
				</li>
				<li>마이페이지
					<div class="sub-menu-wrap">
						<div class="sub-menu">
							<ul class="inner my">
								<li class="sub-title"><p>마이페이지</p>
									<a href="/member/mySubscription"><span>마이페이지</span></a>
									<a href="/room/main"><span>내 모임</span></a>
									<a href="/member/myInquiry"><span>내 활동</span></a>
								</li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</div>
	
	    <div class="nav__search">
	    	<input type="text" />
			<span class="material-symbols-outlined">search</span>
	    </div>
	    
	    <a href="javascript:void(0)" class="nav__toggleBtn">
	      <span class="material-icons">menu</span>
	    </a>
	    
	</div>
</nav>

