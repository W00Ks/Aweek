<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

</script>

<style>

</style>

<c:if test="${ not empty adminLogin }">

<div>
	<span><a href="/admin/noticelist">공지사항</a></span>
</div>

<div>
	<span><a href="/admin/inquirylist">1:1 문의</a></span>
</div>

<div>
	<span><a href="/admin/qnalist">자주 묻는 질문</a></span>
</div>

<div>
	<span><a href="/admin/memberlist">회원 목록</a></span>
</div>

<div>
	<span><a href="/admin/roomlist">방 목록</a></span>
</div>

<form action="/admin/memberlist" method="get">

	<select name="search">
		<option value="userId" <c:out value="${ member.userId eq userId }" />>아이디</option>
		<option value="userName">이름</option>
	</select>

	<input type="text" name="keyword" placeholder="검색어를 입력해주세요.">

	<button type="submit">검색</button>

</form>

</c:if>