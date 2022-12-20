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
			return;
		}
	})
	document.oncontextmenu = function() {
		return false;
	}
})

</script>

<style type="text/css">

.container {
	width: 800px;
}

</style>

</head>
<body>

<%-- body 태그에 우클릭, 드래그, 새로고침 안됨 --%>
<%-- oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydown="return false" --%>

<h1>공지사항 상세보기</h1>
<hr>

<div class="container">
	<div style="display: flex;">
		<p style="width: 30%;">아이디 : ${ viewNotice.writerNick }</p>
		<p style="width: 40%;">작성일 : <fmt:formatDate value="${ viewNotice.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		<%-- <td>수정일 : <fmt:formatDate value="${ modifyNotice.noticeDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>
		<p style="width: 15%;">조회수 : ${ viewNotice.noticeHit }</p>
		<p style="width: 15%;">글번호 : ${ viewNotice.noticeNo }</p>
	</div>
	
	<div style="display: flex;">
		<p style="width: 30%;">${ viewNotice.noticeTitle }</p>
	</div>
	
	<div>
		<p style="width: 30%;">${ viewNotice.noticeContent }</p>
	</div>
	
	<div style="display: flex;">
		<p style="width: 30%;">파일 다운로드</p>
		<a href="/admin/download?fileNo=${ csFile.fileNo }">${ csFile.originName }</a>
	</div>

	<div style="margin: 0 auto;">
		<button id="btnUpdate" class="btnUpdate">수정</button>
		<button id="btnDelete" class="btnDelete">삭제</button>
		<button id="btnList" class="btnList">목록</button>
	</div>

</div>

</body>
</html>