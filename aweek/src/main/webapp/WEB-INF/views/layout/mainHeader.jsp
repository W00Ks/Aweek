<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
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
	
	<!-- favicon -->
	<link rel="icon" href="favicon.ico">
	
	<!--브라우저 스타일 초기화-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
  	<!-- google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

	<!--Google Material Icons new ver.-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

 	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainHeader.css" type="text/css" />
	<script defer type="text/javascript" src="<%=request.getContextPath() %>/resources/js/mainHeader.js"></script>

	


</head>
<body>

</body>
</html>