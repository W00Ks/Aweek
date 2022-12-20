<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnList").click(function() {
		location.href = "/admin/qnalist"
	})
		
	$("#btnUpdate").click(function() {
		location.href = "/admin/qnamodify?qnaNo=${ viewQna.qnaNo }"
	})
	
	$("#btnDelete").click(function() {
		var del_list = confirm ("삭제하시겠습니까?")
		
		if( del_list == true ) {
			alert("삭제하셨습니다.")
			location.href = "/admin/qnadelete?qnaNo=${ viewQna.qnaNo }"
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

table {
	table-layout: fixed;
}

</style>

</head>
<body>

<%-- body 태그에 우클릭, 드래그, 새로고침 안됨 --%>
<%-- oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydown="return false" --%>

<h1>자주묻는질문 상세보기</h1>
<hr>

<div class="container">

<table class="table table-bordered">
	<tr>
		<td>글번호 : ${ viewQna.qnaNo }</td>
		<td>아이디 : ${ viewQna.writerId }</td>
		<td>제목 : ${ viewQna.qnaTitle }</td>
		<td>작성일 : <fmt:formatDate value="${ viewQna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	</tr>
	
	<tr>
		<td>본문 : ${ viewQna.qnaContent }</td>
	</tr>
	
</table>
	
	<div style="margin: 0 auto;">
		<button id="btnUpdate" class="btnUpdate">수정</button>
		<button id="btnDelete" class="btnDelete">삭제</button>
		<button id="btnList" class="btnList">목록</button>
	</div>

</div>
</body>
</html>