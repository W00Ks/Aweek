<%@page import="diary.dto.DiaryFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%	DiaryFile diaryFile = (DiaryFile) request.getAttribute("diaryFile"); %>

<style type="text/css">
.info {
	font-weight: 600;
}
td {
	height: 30px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnList").click(function() {
		/* $(location).attr("href", "./list") */
		var referrer = document.referrer;
		location.href = referrer;
	})
	
	$("#btnUpdate").click(function() {
		$(location).attr("href", "./update?diaryNo=${diary.diaryNo }")
	})

	$("#btnDelete").click(function() {
		$(location).attr("href", "./delete?diaryNo=${diary.diaryNo }")
	})
	
	$(".recommbutton").click(function() {
		$.ajax({
			type: "get"
			, url: "./recomm"
			, data: {
				n1 : ${diary.diaryNo }
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".recommresult").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
		
	})	

})
</script>

<br><br><br><br>
<div style="font-weight: 600; font-size: 1.1em;">게시글 상세보기</div>
<br>
<hr>

	<table class="table table-bordered" style="width: 100%">
	<br>
	<tr><td class="info">글번호</td><td><span>${diary.diaryNo }</span></td><td class="info">글쓴이</td><td><span style="font-weight: 500;">${diary.userName }</span></td></tr>
	<tr><td class="info">모임</td><td><span>${diary.roomName }</span></td><td class="info">카테고리</td><td><span style="font-weight: 500;">${diary.diaryCateName }</span></td></tr>
	<tr><td class="info">조회수</td><td><span>${diary.diaryHit }</span></td><td class="info">작성일자</td><td><span style="font-weight: 500;">${diary.diaryDate }</span></td></tr>
	<tr><td class="info">제목</td><td colspan="3">${diary.diaryTitle }</td></tr>
	</table>
	
	<hr><br>
	
	<div style="width: 100%; min-height: 200px;">
	${diary.diaryContent }
	</div>
	
	<div style="display: flex; justify-content: center;">
		<div style="display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
			<div>추천수</div>
			<br>
			<div class="recommresult">${diary.diaryRecommend }</div>
		</div>
		<div style="width: 10px;">
		</div>
		<a class="recommbutton" style="cursor: pointer;">
		<div>
			<img alt="" src="/resources/diary/check_circle_FILL0_wght400_GRAD0_opsz48.png">
		</div>
		</a>
	</div>
	
	
<%-- <table class="table table-bordered">

<tr>
	<td class="info">글번호</td>
	<td>${diary.diaryNo }</td>
	
	<td class="info">글쓴이</td>
	<td>${diary.userName }</td>
</tr>

<tr>
	<td class="info">모임</td>
	<td>${diary.roomName }</td>
	
	<td class="info">카테고리</td>
	<td>${diary.diaryCateName }</td>
</tr>

<tr>
	<td class="info">조회수</td>
	<td>${diary.diaryHit }</td>
	
	<td class="info">작성일자</td>
	<td>${diary.diaryDate }</td>
</tr>

<tr>
	<td class="info">제목</td>
	<td colspan="3">${diary.diaryTitle }</td>
</tr>

<tr>
	<td class="info" colspan="4">본문</td>
</tr>

<tr>
	<td colspan="4">${diary.diaryContent }</td>
</tr>

</table> --%>

<hr><br>
첨부파일

<div>
<%	if( diaryFile != null ) { %>
<a href="<%=request.getContextPath() %>/upload/<%=diaryFile.getDiaryStoredName() %>"
 download="<%=diaryFile.getDiaryOriginName() %>">
	<%=diaryFile.getDiaryOriginName() %>
</a>
<%	} %>
</div>

<div class="text-center" style="display: flex; float: right;">
	<button id="btnList" class="btn btn-primary">목록</button>
	<button id="btnUpdate" class="btn btn-info" style="margin-left: 10px;">수정</button>
	<button id="btnDelete" class="btn btn-danger" style="margin-left: 10px;">삭제</button>
</div>

<jsp:include page="./footer.jsp" flush="true" />