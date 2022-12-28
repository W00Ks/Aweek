<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {

	// 검색어가 빈 칸일시 alert
	$("#searchIcon").click(function() {
		if($.trim($("#keyword").val()) == '' ) {
			console.log("false")
			alert("검색어를 입력해주세요.");
			("#keyword").focus();
			return false;
		}
	})

	// 검색 입력창에 focus
	$("input").eq(0).focus()
	
	// 검색 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#searchIcon").click();
		}
	})
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

<div class="container">
	<div class="list">
		<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">회원 목록</h1>
	</div>

	<c:choose>
		<c:when test="${ empty paging.keyword }">
			<div style="margin: 30px;">
				<span>Aweek의 회원수는 ${ paging.totalCount }명 입니다.</span>
			</div>
		</c:when>
		
		<c:when test="${ not empty memberlist }">
			<div style="margin: 30px;">
				<span>일치하는 회원수는 ${ paging.totalCount }명 입니다.</span>
			</div>
		</c:when>
	</c:choose>
	
	<table style="margin: 0 auto;">
		<thead>
			<tr>
				<th style="width: 100px;">회원 번호</th>
				<th style="width: 300px;">회원 아이디</th>
				<th style="width: 150px;">회원 이름</th>
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${ empty memberlist }">
				<tr>
					<td colspan="5" style="padding-top: 50px;"><span>일치하는 결과가 없습니다.</span></td>
				</tr>
			</c:if>
		
			<c:if test="${ not empty memberlist }">
				<c:forEach items="${ memberlist }" var="member">
					<tr id="searchResult">
						<td>${ member.userNo }</td>
						<td><a href="/admin/memberdetail?userNo=${ member.userNo }">${ member.userId }</a></td>
						<td>${ member.userName }</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

	<c:if test="${ not empty memberlist }">
		<div class="text-center" style="margin-top: 100px;">
			<ul class="pagination">
				<%-- 첫 페이지로 이동 --%>
				<c:if test="${ paging.curPage ne 1 }">
					<li><a href="/admin/memberlist">처음</a></li>	
				</c:if>
				
				<%-- 이전 페이징 리스트로 이동 --%>
				<c:choose>
				<c:when test="${ paging.startPage ne 1 }">
					<li><a href="/admin/memberlist?curPage=${ paging.startPage - paging.pageCount }">&laquo;</a></li>
				</c:when>
				<c:when test="${ paging.startPage eq 1 }">
					<li class="disabled"><a>&laquo;</a></li>
				</c:when>
				</c:choose>
				
				<%-- 이전 페이지로 가기 --%>
				<c:if test="${ paging.curPage > 1 }">
					<li><a href="/admin/memberlist?curPage=${ paging.curPage - 1 }">&lt;</a></li>
				</c:if>
				
				<%-- 페이징 리스트 --%>
				<c:forEach begin="${ paging.startPage }" end="${ paging.endPage }" var="i">
				<c:if test="${ paging.curPage eq i }">
					<li class="active"><a href="/admin/memberlist?curPage=${ i }">${ i }</a></li>
				</c:if>
				<c:if test="${ paging.curPage ne i }">
					<li><a href="/admin/memberlist?curPage=${ i }">${ i }</a></li>
				</c:if>
				</c:forEach>
				
				<%-- 다음 페이지로 가기 --%>
				<c:if test="${ paging.curPage < paging.totalPage }">
					<li><a href="/admin/memberlist?curPage=${ paging.curPage + 1 }">&gt;</a></li>
				</c:if>
				
				<%-- 다음 페이징 리스트로 이동 --%>
				<c:choose>
				<c:when test="${ paging.endPage ne paging.totalPage }">
					<li><a href="/admin/noticelist?curPage=${ paging.startPage + paging.pageCount }">&raquo;</a></li>
				</c:when>
				<c:when test="${ paging.endPage eq paging.totalPage }">
					<li class="disabled"><a>&raquo;</a></li>
				</c:when>
				</c:choose>
				
				<%-- 끝 페이지로 이동 --%>
				<c:if test="${ paging.curPage ne paging.totalPage }">
					<li><a href="/admin/memberlist?curPage=${ paging.totalPage }" >&rarr;</a></li>	
				</c:if>
			</ul>
		</div>
	</c:if>

	<div class="SearchMember" style="margin-top: 50px;">
		<form action="/admin/memberlist" method="post" name="search" id="searchForm">
			<select id="type" name="type">
				<option value="userId" <c:out value="${ paging.type eq 'userId' ? 'selected' :'' }" /> >아이디</option>
				<option value="userName" <c:out value="${ paging.type eq 'userName' ? 'selected' :'' }" /> >이름</option>
			</select>
				
			<input type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${ paging.keyword }">
			<input type="submit" id="searchIcon" name="searchIcon" value="검색">
		</form>
	</div>
</div>