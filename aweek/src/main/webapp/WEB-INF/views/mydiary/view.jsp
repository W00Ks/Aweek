<%@page import="diary.dto.DiaryFile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%	DiaryFile diaryFile = (DiaryFile) request.getAttribute("diaryFile"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.info {
	font-weight: 600;
}
td {
	height: 30px;
}
.commentblock {
	width: 99.5%;
	min-height: 125px;
	
}
.clear {
	clear: both;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnList").click(function() {
		/* $(location).attr("href", "./list") */
		var referrer = "./entire?roomNo=0";
		location.href = referrer;
	})
	
	$("#btnUpdate").click(function() {
		$(location).attr("href", "./update?diaryNo=${diary.diaryNo }&userNo=${diary.userNo }")
	})

	$("#btnDelete").click(function() {
		$.ajax({
			type: "get"
			, url: "./delete"
			, data: {
				n1 : ${diary.diaryNo }
				, n2 : ${diary.userNo }
				, n3 : 0
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				
				if(res == 1) {
					var referrer = document.referrer;
					alert("삭제가 완료되었습니다."); // alert와 reload는 같이 사용이 안되서 href로 이동시켜야 한다.
					location.href = referrer; // 해당 url로 리다이렉트
				} else if(res == 0) {
					alert("권한이 없습니다.");
				}
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})		
		
		/* $(location).attr("href", "./delete?diaryNo=${diary.diaryNo }") */
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
	
	$(".commentbtn").click(function() {
		if($("#comment").val() == ""){
			alert("댓글을 입력해주세요.");
			return false;
		}
	})

})
</script>

<br><br>
<div style="font-weight: 600; font-size: 1.1em;">게시글 상세보기</div>
<br>
<hr>

	<table class="table table-bordered" style="width: 100%">
	<br>
	<tr><td class="info">글번호</td><td><span>${diary.diaryNo }</span></td><td class="info">글쓴이</td><td><span style="font-weight: 500;">${diary.userNo }</span></td></tr>
	<tr><td class="info">조회수</td><td><span>0</span></td><td class="info">작성일자</td><td><span style="font-weight: 500;">${diary.diaryDate }</span></td></tr>
	<tr><td class="info">제목</td><td>${diary.diaryTitle }</span></td><td class="info">공개여부</td><td><span style="font-weight: 500;"><c:if test="${diary.diaryPublic eq 1}">공개</c:if><c:if test="${diary.diaryPublic eq 0}">비공개</c:if></span></td></tr>
	</table>
	
	<hr><br>
	
	<div style="width: 100%; min-height: 200px;">
	${diary.diaryContent }
	</div>
	
	<div style="display: flex; justify-content: center;">
		<div style="display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
			<div>추천수</div>
			<br>
			<div class="recommresult">0</div>
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
	<td>0</td>
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
<br><br><br><br>

<div class="commentblock">
	<c:forEach items="${comment }" var="data">
		<table>
			<tr>
				<td style="width: 15%; height: 0px;">0</td>
				<td style="width: 50%; height: 0px;">${data.diaryCommContent }</td>
				<td style="width: 33%; height: 0px;">${data.diaryCommDate }</td>
				<td style="width: 10%; height: 0px;">
				<form action="./commentDelete" method="get">
				<button>X</button>
				<input type="text" value="${data.userNo }" name="userNo" style="display: none;">
				<input type="text" value="${diary.diaryNo }" name="diaryNo" style="display: none;">
				<input type="text" value="${data.diaryCommNo }" name="diaryCommNo" style="display: none;">
				<input type="text" value="0" name="roomNo" style="display: none;">
				</form>
				</td>
			</tr>
		</table>
	<hr>
	</c:forEach>
</div>

<div>
	<form action="./comment" method="get">
	<textarea id="comment" name="comment" style="width: 99.5%; height:50px; resize: none;" placeholder="댓글을 입력하세요"></textarea>
	<input type="text" name="diaryNo" value="${diary.diaryNo }" style="display:none; ">
	<button class="btn commentbtn" style="float: right;">등록</button>
	</form>
</div>

<jsp:include page="./footer.jsp" flush="true" />