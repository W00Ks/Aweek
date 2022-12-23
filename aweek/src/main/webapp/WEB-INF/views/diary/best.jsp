<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.rightbox1 {
	height: 70px;
}
.rightbox2 {
	height: 600px;
}
.rightbox3 {
	height: 70px;
}
.rightbox4 {
	height: 70px;
}
table {
	width: 100%;
	margin-top:	-10px;
}
th, td {
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
}
td:nth-child(4) {
	text-align: justify;
}
th {
	border-bottom: 1px solid #C7D1CA;
	border-bottom-width: thick;
	font-weight: 600;
}
td {
	border-top: 1px solid #C7D1CA;
}
.sortbutton {
	display: flex;
	float: right;
	cursor: pointer;
	border: 1px solid #C7D1CA;
}
.sortresult {
	position: absolute;
	width: 112px;
	height: 112px;
	border: 1px solid #C7D1CA;
	background-color: white;
	right: 235px;
    top: 182px;
}
.suchsortbutton {
	display: flex;
	float: left;
	cursor: pointer;
	border: 1px solid #C7D1CA;
}
.suchsortresult {
	position: absolute;
	width: 112px;
	height: 112px;
	border: 1px solid #C7D1CA;
	background-color: white;
    top: 93px;
}
.searchtext {
	position: relative;
	top: -2px;
	width: 200px;
	height: 21px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".sortbutton").click(function(){
		$(this).next("div").toggleClass("hide")
	});
	
	$(".sortresult").children().eq(0).click(function(){
		location.href = "./best?sort=0&searchsort=${searchsort}&searchtext=${searchtext}&curPage=${paging.curPage }";
	});
	$(".sortresult").children().eq(1).click(function(){
		location.href = "./best?sort=1&searchsort=${searchsort}&searchtext=${searchtext}&curPage=${paging.curPage }";
	});
	$(".sortresult").children().eq(2).click(function(){
		location.href = "./best?sort=2&searchsort=${searchsort}&searchtext=${searchtext}&curPage=${paging.curPage }";
	});
	$(".sortresult").children().eq(3).click(function(){
		location.href = "./best?sort=3&searchsort=${searchsort}&searchtext=${searchtext}&curPage=${paging.curPage }";
	});
	
	$(".suchsortbutton").click(function(){
		$(this).next("div").toggleClass("hide")
	});
	
	$(".suchsortresult").children().eq(0).click(function(){
		$(".searchsort").val(0);
		$(".suchsortresult").toggleClass("hide")
		$(".suchsortbutton").children().eq(0).html("제목")
	});
	$(".suchsortresult").children().eq(1).click(function(){
		$(".searchsort").val(1);
		$(".suchsortresult").toggleClass("hide")
		$(".suchsortbutton").children().eq(0).html("카테고리")
	});
	$(".suchsortresult").children().eq(2).click(function(){
		$(".searchsort").val(2);
		$(".suchsortresult").toggleClass("hide")
		$(".suchsortbutton").children().eq(0).html("모임")
	});
	$(".suchsortresult").children().eq(3).click(function(){
		$(".searchsort").val(3);
		$(".suchsortresult").toggleClass("hide")
		$(".suchsortbutton").children().eq(0).html("작성자")
	});
	$('input:button[name=reset]').click(function(){
		$('input:text[name=searchtext]').val("");
		$('input:text[name=searchsort]').val("");
		$(".suchsortbutton").children().eq(0).html("제목");
	});
});
</script>

<div class="rightbox1">
	<div class="suchsortbutton">
		<div style="line-height: 25px; width: 80px; margin-left: 7px;">
			<c:if test="${searchsort eq 0}">제목</c:if>
			<c:if test="${searchsort eq 1}">카테고리</c:if>
			<c:if test="${searchsort eq 2}">모임</c:if>
			<c:if test="${searchsort eq 3}">작성자</c:if>
		</div>
		<img style="width: 25px;" src="/resources/diary/arrow_drop_down_FILL0_wght400_GRAD0_opsz48.png">
	</div>
	<div class="suchsortresult hide">
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">제목</div>
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">카테고리</div>
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">모임</div>
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">작성자</div>
	</div>
	<form action="./best" method="get">
	<input class="searchsort" name="searchsort" type="text" value="${searchsort }" style="display: none;">
	<input class="sort" name="sort" type="text" value="${sort }" style="display: none;">
	&nbsp;<input type="text" class="searchtext" name="searchtext" value="${searchtext }">
		<button style="height: 27px;">검색</button>
		<input type="button" value="초기화" name="reset" style="height: 27px;">
	</form>
</div>
<div class="rightbox2">
	<div style="font-size: 1.2em; font-weight:600;">나의글</div>
	<div class="sortbutton">
		<div style="line-height: 25px; width: 80px; margin-left: 7px;">
			<c:if test="${sort eq 0}">날짜순</c:if>
			<c:if test="${sort eq 1}">카테고리순</c:if>
			<c:if test="${sort eq 2}">모임순</c:if>
			<c:if test="${sort eq 3}">작성자순</c:if>
		</div>
		<img style="width: 25px;" src="/resources/diary/arrow_drop_down_FILL0_wght400_GRAD0_opsz48.png">
	</div>
	<div class="sortresult hide">
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">날짜순</div>
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">카테고리순</div>
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">모임순</div>
		<div style="cursor: pointer; padding-left: 5px; padding-top: 5px; padding-bottom: 5px; border: 1px solid #C7D1CA;">작성자순</div>
	</div>
	<br><br>
	<table class="table table-striped table-hover table-condensed">
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 15%;">모임</th>
		<th style="width: 15%;">카테고리</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 15%;">글쓴이</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 5%;">조회수</th>
		<th style="width: 5%;">추천수</th>
	</tr>
	<c:forEach items="${list }" var="data">
	<tr>
		<td>${data.diaryNo }</td>
		<td>${data.roomName }</td>
		<td>${data.diaryCateName }</td>
		<td><a href="./view?diaryNo=${data.diaryNo }">${data.diaryTitle }</a></td>
		<td>${data.userName }</td>
		<td>${data.diaryDate }</td>
		<td>${data.diaryHit }</td>
		<td>${data.diaryRecommend }</td>
	</tr>
	</c:forEach>
	</table>		
</div>
<div class="rightbox3">
</div>

<jsp:include page="./bestpaging.jsp" flush="true" />

<jsp:include page="./footer.jsp" flush="true" />