<%@page import="diary.dto.DiaryFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%	DiaryFile diaryFileInfo = (DiaryFile) request.getAttribute("diaryFileInfo"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 스마트 에디터2 설치 -->
<script type="text/javascript" src="/resources/diary/se2/js/service/HuskyEZCreator.js"></script>

<style type="text/css">
#header, #footer {
	text-align: center;
	background: #f6f;
}
#header h1 a {
	text-decoration: none;
	color: #333;
}
table {
	border-collapse: separate;
  	border-spacing: 0 10px;
}
th, td {
	text-align: left;
}
.info {
	width: 160px;
}
/* td:nth-child(2) {
	text-align: justify;
} */
.selectdiaryCateNo:hover {
	background-color: #EFEBF0;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼
	$("#btnWrite").click(function() {
		
		if($(".cateresult").text() == "없음"){
			alert("카테고리를 선택해주세요.");
			return false;
		}
		
		if($("#title").val() == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if(!$('input:radio[name=publicresult]').is(':checked')){
			alert("공개 여부를 선택해주세요.");
			return false;
		}
		
		//작성된 내용을 <textarea>에 적용하기
		updateContents()

		$("form").submit();
	})
	
	//취소버튼
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
	$("#delFile").click(function() {
		
		$("#fileman").hide();
		$("#delFile").hide();
		$("#afterFile").show();
		$("#change").attr("value","change");
		
	})
	
	if(${diary.diaryPublic } == 1) { // diaryPublic이 1이면 공개 check, 0이면 비공개 check
		$("#publicresult1").prop('checked', true);
	} else {
		$("#publicresult2").prop('checked', true);
	}
	
})


function updateContents() {
	
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
}

</script>

<br><br><br><br>
<div style="font-weight: 600; font-size: 1.1em;">게시글 수정하기</div>
<br>
<hr>

<div class="container">

	<form action="./update" method="post" enctype="multipart/form-data">
	<input type="text" value="${diary.diaryNo }" name="diaryNo" style="display: none;">
	<input type="text" value="${diary.roomNo }" name="roomNo" style="display: none;">
	<table class="table table-bordered" style="width: 100%">
	<br>
	<tr><td class="info" style="font-weight: 600;">글번호</td><td style="width: 25%;"><span>${diary.diaryNo }</span></td><td class="info" style="font-weight: 600;">글쓴이</td><td><span style="font-weight: 500;">${diary.userName }</span></td></tr>
	<tr><td class="info" style="font-weight: 600;">모임</td><td><span>${diary.roomName }</span></td><td class="info" style="font-weight: 600;">카테고리</td><td><span style="font-weight: 500;">${diary.diaryCateName }</span></td></tr>
	<tr><td class="info" style="font-weight: 600;">조회수</td><td><span>${diary.diaryHit }</span></td><td class="info" style="font-weight: 600;">작성일자</td><td><span style="font-weight: 500;">${diary.diaryDate }</span></td></tr>
	<tr><td class="info" style="font-weight: 600;">제목</td><td colspan="3"><input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="width:99.2%; height: 20px;" value="${diary.diaryTitle }"></td></tr>
	<tr><td colspan="4"><textarea id="content" name="content" style="width: 100%; height:400px;">${diary.diaryContent }</textarea></td></tr>
	</table>
	
	<div style="float: right;">
	공개<input id="publicresult1" type='radio' name='publicresult' value='1' />
	비공개<input id="publicresult2" type='radio' name='publicresult' value='0' />
	</div>
	
<%	if( diaryFileInfo == null ) { %>
	첨부파일 <input type="file" name="file">
	<input type="text" name="change" value="normal" style="display: none;">
<% } %>

<%	if( diaryFileInfo != null ) { %>
	<span id="fileman"><%=diaryFileInfo.getDiaryOriginName() %></span>&nbsp;
	<span id="delFile" style="color: red; font-weight: bold; cursor: pointer;">X</span>
	<div id="afterFile" style="display: none;">
		첨부파일 <input type="file" name="file">
	</div>
	<input type="text" id="change" name="change" value="nochange" style="display: none;">
<% } %>
	
	</form>
	
	<br><br>
	<div class="text-center" style="display: flex; float: right;">
		<button id="btnWrite" class="btn btn-primary" style="margin-right: 5px;">수정</button>
		<button id="btnCancel" class="btn btn-danger" style="margin-left: 5px;">취소</button>
	</div>
	
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기
		sSkinURI: "/resources/diary/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	})
	</script>

</div>

<jsp:include page="./footer.jsp" flush="true" />