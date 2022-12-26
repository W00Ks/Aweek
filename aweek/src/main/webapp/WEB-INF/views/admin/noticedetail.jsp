<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnList").click(function() {
		location.href = "/admin/noticelist"
	})
		
	$("#btnUpdate").click(function() {
		location.href = "/admin/noticemodify?noticeNo=${ viewNotice.noticeNo }"
	})
	
	$("#btnDelete").click(function() {
		var del_list = confirm ("공지사항을 삭제하시겠습니까?")
		
		if( del_list == true ) {
			alert("삭제하셨습니다.")
			location.href = "/admin/noticedelete?noticeNo=${ viewNotice.noticeNo }"
		} else if( del_list == false ) {
			return false;
		}
	})
})

</script>

<style type="text/css">

p {
	margin: 15px 0;
}

.container {
	width: 800px;
	border: 1px solid green;
	margin-top: 70px;
	border-radius: 1.5em;
}

.firstList {
	border-bottom: 1px solid gray;
}

.secondList {
	border-bottom: 1px solid gray;
}

.thirdList {
	border-bottom: 1px solid gray;
}

.second {
	margin: 30px 0px;
}

.third {
	margin: 90px 0px;
}

.fourth {
	margin: 30px 0px;
}

</style>

</head>
<body>

<h1>공지사항 상세보기</h1>
<hr>

<div class="container">
	<div style="display: flex;" class="firstList">
		<p style="width: 30%;">아이디 : ${ viewNotice.writerNick }</p>
		<p style="width: 40%; text-align: left;">작성일 : <fmt:formatDate value="${ viewNotice.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		<p style="width: 15%;">조회수 : ${ viewNotice.noticeHit }</p>
		<p style="width: 15%;">글번호 : ${ viewNotice.noticeNo }</p>
	</div>
	
	<div style="display: flex;" class="secondList">
		<p style="width: 30%" class="second">제목</p>
		<p style="width: 70%; text-align: left;" class="second">${ viewNotice.noticeTitle }</p>
	</div>
	
	<div style="display: flex;" class="thirdList">
		<p style="width: 30%" class="third">내용</p>
		<p style="width: 70%; text-align: left;" class="third">${ viewNotice.noticeContent }</p>
	</div>
	
	<div style="display: flex;" class="fourthList">
		<p style="width: 30%;" class="fourth">파일 다운로드</p>
		<a href="/admin/download?fileNo=${ csFile.fileNo }" style="margin: 30px 0px;">${ csFile.originName }</a>
	</div>
</div>

<div style="margin: 0 auto; margin-top: 70px;" class="fileList">
	<button id="btnUpdate" class="btnUpdate">수정</button>
	<button id="btnDelete" class="btnDelete">삭제</button>
	<button id="btnList" class="btnList">목록</button>
</div>

</body>
</html>