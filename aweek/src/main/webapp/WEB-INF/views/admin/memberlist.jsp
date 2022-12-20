<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	let moveForm = $("#moveForm");
	$(".move")
		.on(
			"click",
			function(e) {
				e.preventDefault();
				moveForm.empty();
				moveForm
						.append("<input type='hidden' name='userNo' value='"
								+ $(this).attr("href") + "'>");
				moveForm.attr("action", "/admin/memberlist");
				moveForm.submit();
			});
	
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/admin/memberlist");
		moveForm.submit();
	});
	
	$(".search_area button").on("click", function(e) {
		e.preventDefault();
		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();
		if (!keyword) {
			alert("키워드를 입력하세요.");
			return false;
		}
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});
})

</script>

<style type="text/css">

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

th, td {
	padding: 5px;
}

th {
    border: 1px solid #ccc;
    border-collapse: collapse;
   	text-align: center;
   	width: 200px;
   	background: #43c446;
   	padding: 5px;
   	font-size: 15px;
   	font-weight: 400;
}

.list {
	width: 300px;
    margin: 0 auto;
    border: 1px solid;
    margin-top: 30px;
    border-radius: 2.1em;
    margin-bottom: 50px;
}

</style>

<c:if test="${ not empty adminLogin }">

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">회원 목록</h1>
</div>

<div class="search_wrap">
	<div class="search_area">
		<select name="type" id="type">
			<option value="userName" <c:out value="${ pageMaker.search.type eq 'userName'?'selected':'' }"/>>이름</option>
			<option value="userId" <c:out value="${ pageMaker.search.type eq 'userId'?'selected':'' }"/>>아이디</option>
		</select> 
				
			<input id="searchText" type="text" name="keyword" value="${ pageMaker.search.keyword }" placeholder="search...">
		<button id="searchIcon"><i class="fas fa-search">검색</i></button>
	</div>
</div>

<div class="pageInfo_wrap">
	<div class="pageInfo_area">
		<ul id="pageInfo" class="pageInfo">
			<c:if test="${ pageMaker.prev }">
				<li class="pageInfo_btn previous"><a href="${ pageMaker.startPage - 1 }">Previous</a></li>
			</c:if>
			<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
				<li class="pageInfo_btn ${ pageMaker.search.pageNum == num ? "active":"" }"></li>
			</c:forEach>
			<c:if test="${ pageMaker.next }">
				<li class="pageInfo_btn next"><a href="${ pageMaker.endPage + 1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
</div>

<form id="moveForm" method="get">
	<input type="hidden" id="userNo" name="userNo" value='<c:out value="${ pageInfo.userNo }"/>'>
	<input type="hidden" name="pageNum" value="${ pageMaker.search.pageNum }">
	<input type="hidden" name="amount" value="${ pageMaker.search.amount }">
	<input type="hidden" name="keyword" value="${ pageMaker.search.keyword }">
	<input type="hidden" name="type" value="${ pageMaker.search.type }">
</form>





<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 275px;">아이디</th>
			<th style="width: 275px;">이름</th>
		</tr>
	</thead>
	
	<tbody>
<%-- 	<c:forEach items="${ search }" var="search">
		<tr id="searchResult">
			<td>${ search.userNo }</td>
			<td><a href="${ path }/admin/memberdetail?userNo=${ search.userNo }">${ search.userId }</a></td>
			<td>${ search.userName }</td>
		</tr>
	</c:forEach> --%>
	<c:forEach items="${ memberlist }" var="member">
		<tr>
			<td>${ member.userNo }</td>
			<td><a href="/admin/memberdetail?userNo=${ member.userNo }">${ member.userId }</a></td>
			<td>${ member.userName }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<%-- <form action="/admin/memberlist" method="get">

<select name="search">
	<option value="userId" <c:out value="${ member.userId eq userId }" />>아이디</option>
	<option value="userName">이름</option>
</select>

<input type="text" name="keyword" placeholder="검색어를 입력해주세요.">

<button type="submit">검색</button>

</form> --%>



<c:import url="/WEB-INF/views/admin/layout/memberpaging.jsp" />

</c:if>