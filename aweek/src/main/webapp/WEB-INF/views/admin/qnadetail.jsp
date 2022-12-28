<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	$("#btnList").click(function() {
		location.href = "/admin/qnalist"
	})
		
	$("#btnUpdate").click(function() {
		var upd_list = alert ("Q&A를 수정합니다.")
		location.href = "/admin/qnamodify?qnaNo=${ viewQna.qnaNo }"
	})
	
	$("#btnDelete").click(function() {
		var del_list = confirm ("Q&A를 삭제하시겠습니까?")
		
		if( del_list == true ) {
			location.href = "/admin/qnadelete?qnaNo=${ viewQna.qnaNo }"
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

.second {
	margin: 30px 0px;
}

.third {
	margin: 90px 0px;
}

</style>

</head>
<body>

<h1>자주 묻는 질문 상세보기</h1>
<hr>

<div class="container">
	<div style="display: flex;" class="firstList">
		<p style="width: 30%;">아이디 : ${ viewQna.writerNick }</p>
		<p style="width: 30%; text-align: left;">작성일 : <fmt:formatDate value="${ viewQna.qnaDate }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
		<p style="width: 20%;">글번호 : ${ viewQna.qnaNo }</p>
		<c:if test="${ viewQna.qnaCategoryNo eq '1' }">
			<p>카테고리 : 회원관리</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '2' }">
			<p>카테고리 : 어위크</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '3' }">
			<p>카테고리 : 모임</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '4' }">
			<p>카테고리 : 채팅</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '5' }">
			<p>카테고리 : 캘린더</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '6' }">
			<p>카테고리 : 다이어리</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '7' }">
			<p>카테고리 : 결제</p>
		</c:if>
		<c:if test="${ viewQna.qnaCategoryNo eq '8' }">
			<p>카테고리 : 고객센터</p>
		</c:if>
	</div>
	
	<div style="display: flex;" class="secondList">
		<p style="width: 30%" class="second">제목</p>
		<p style="width: 70%; text-align: left;" class="second">${ viewQna.qnaTitle }</p>
	</div>
	
	<div style="display: flex;" class="thirdList">
		<p style="width: 30%" class="third">내용</p>
		<p style="width: 70%; text-align: left;" class="third">${ viewQna.qnaContent }</p>
	</div>
</div>

<div style="margin: 0 auto; margin-top: 70px;" class="fileList">
	<button id="btnUpdate" class="btnUpdate">수정</button>
	<button id="btnDelete" class="btnDelete">삭제</button>
	<button id="btnList" class="btnList">목록</button>
</div>

</body>
</html>