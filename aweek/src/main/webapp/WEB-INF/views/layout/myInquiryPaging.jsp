<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">

body {
	font-family: 'NanumSquareNeo-Variable';
}

.pagingDiv {
    text-align: center;
    margin: 30px auto;
    display: table;
}

.pagingDiv li {
	float: left;
    margin-left: 5px;
    width: 25px;
    line-height: 25px;
    padding: 2px;
}

.pagingDiv li:hover {
    border: 1px solid #594B4B;
    background-color: #594B4B;
    font-weight: 600;
}

.pagingDiv li:hover > a {
    color: white;
}

.pagingDiv li.active {
    border: 1px solid #594B4B;
    background-color: #594B4B;
    font-weight: 600;
}

.pagingDiv li.active a {
	color:white;
}

.pagingDiv a {
	color: black;
	font-size: 16px;
	cursor: pointer;
}

</style>

<div class="pagingDiv">
	<ul>

	<%-- 첫 페이지로 이동 --%>
	<c:if test="${paging.curPage ne 1 }">
		<li><a href="/member/myInquiryList">&lsaquo;&lsaquo;&lsaquo;</a></li>	
	</c:if>
	
	<%-- 이전 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.startPage ne 1 }">
		<li><a href="/member/myInquiryList?curPage=${paging.startPage - paging.pageCount }">&lsaquo;&lsaquo;</a></li>
	</c:when>
	<c:when test="${paging.startPage eq 1 }">
		<li style="display:none;"><a>&lsaquo;&lsaquo;</a></li>
	</c:when>
	</c:choose>
	
	<%-- 이전 페이지로 가기 --%>
	<c:if test="${paging.curPage > 1 }">
		<li><a href="/member/myInquiryList?curPage=${paging.curPage - 1 }">&lsaquo;</a></li>
	</c:if>
	
	
	
	<%-- 페이징 리스트 --%>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
	<c:if test="${paging.curPage eq i }">
		<li class="active"><a href="/member/myInquiryList?curPage=${i }">${i }</a></li>
	</c:if>
	<c:if test="${paging.curPage ne i }">
		<li><a href="/member/myInquiryList?curPage=${i }">${i }</a></li>
	</c:if>
	</c:forEach>

	
	
	<%-- 다음 페이지로 가기 --%>
	<c:if test="${paging.curPage < paging.totalPage }">
		<li><a href="/member/myInquiryList?curPage=${paging.curPage + 1 }">&rsaquo;</a></li>
	</c:if>
	
	<%-- 다음 페이징 리스트로 이동 --%>
	<c:choose>
	<c:when test="${paging.endPage ne paging.totalPage }">
		<li><a href="/member/myInquiryList?curPage=${paging.startPage + paging.pageCount }">&rsaquo;&rsaquo;</a></li>
	</c:when>
	<c:when test="${paging.endPage eq paging.totalPage }">
		<li style="display:none;"><a>&rsaquo;&rsaquo;</a></li>
	</c:when>
	</c:choose>

	<%-- 끝 페이지로 이동 --%>
	<c:if test="${paging.curPage ne paging.totalPage }">
		<li><a href="/member/myInquiryList?curPage=${paging.totalPage }">&rsaquo;&rsaquo;&rsaquo;</a></li>	
	</c:if>
	
	</ul>
</div>