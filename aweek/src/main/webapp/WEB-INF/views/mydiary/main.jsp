<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.rightbox1 {
	height: 70px;
}
.rightbox2 {
	height: 200px;
}
.rightbox3 {
	height: 200px;
}
.rightbox4 {
	height: 200px;
}
.rightbox5 {
	height: 200px;
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
	text-align: center;
}
th {
	border-bottom: 1px solid #C7D1CA;
	border-bottom-width: thick;
	font-weight: 600;
}
td {
	border-top: 1px solid #C7D1CA;
}
</style>
		
<div class="rightbox1">
</div>
<div class="rightbox2">
	<div style="font-size: 1.2em; font-weight:600;">새소식</div>
</div>
<div class="rightbox3">
	<div style="font-size: 1.2em; font-weight:600;">공지사항<a href="./notice?userNo=${data.userNo }" style="cursor: pointer;"><div style="float: right; font-size: 0.7em; font-weight:400; color: black;">더보기<img alt="" src="/resources/diary/submenu1.PNG" style="float: right; margin: 0px 3px;"></div></a></div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 15%;">카테고리</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 5%;">조회수</th>
		<th style="width: 5%;">추천수</th>
	</tr>
	<c:forEach items="${diaryNotice }" var="Notice" end="3">
	<tr>
		<td>${Notice.diaryNo }</td>
		<td>공지사항</td>
		<td><a href="./view?diaryNo=${Notice.diaryNo }">${Notice.diaryTitle }</a></td>
		<td>${Notice.diaryDate }</td>
		<td>0</td>
		<td>0</td>
	</tr>
	</c:forEach>
	</table>		
</div>
<div class="rightbox4">
	<div style="font-size: 1.2em; font-weight:600;">추천글<a href="./best?userNo=${data.userNo }" style="cursor: pointer;"><div style="float: right; font-size: 0.7em; font-weight:400; color: black;">더보기<img alt="" src="/resources/diary/submenu1.PNG" style="float: right; margin: 0px 3px;"></div></a></div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 15%;">카테고리</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 5%;">조회수</th>
		<th style="width: 5%;">추천수</th>
	</tr>
	<c:forEach items="${diaryRecomm }" var="Recomm" end="3">
	<tr>
		<td>${Recomm.diaryNo }</td>
		<td>공지1</td>
		<td><a href="./view?diaryNo=${Recomm.diaryNo }">${Recomm.diaryTitle }</a></td>
		<td>${Recomm.diaryDate }</td>
		<td>0</td>
		<td>0</td>
	</tr>
	</c:forEach>
	</table>
</div>
<div class="rightbox5">
	<div style="font-size: 1.2em; font-weight:600;">전체글<a href="./entire?userNo=${data.userNo }" style="cursor: pointer;"><div style="float: right; font-size: 0.7em; font-weight:400; color: black;">더보기<img alt="" src="/resources/diary/submenu1.PNG" style="float: right; margin: 0px 3px;"></div></a></div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<tr>
		<th style="width: 5%;">번호</th>
		<th style="width: 15%;">카테고리</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 20%;">작성일자</th>
		<th style="width: 5%;">조회수</th>
		<th style="width: 5%;">추천수</th>
	</tr>
	<%int testtest = 0; %>
	<c:forEach items="${diaryCurrent }" var="Current" end="3">
	<tr>
		<td>${Current.diaryNo }</td>
		<td>카테고리<%=testtest++ %></td>
		<td><a href="./view?diaryNo=${Current.diaryNo }">${Current.diaryTitle }</a></td>
		<td>${Current.diaryDate }</td>
		<td>0</td>
		<td>0</td>
	</tr>
	</c:forEach>
	</table>
</div>
			
<jsp:include page="./footer.jsp" flush="true" />