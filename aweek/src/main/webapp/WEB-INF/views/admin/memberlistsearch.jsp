<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {

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

<div>
	<select name="searchType">
		<option value="userName" <c:if test="${ searchType eq 'userName' }" selected</c:if>>이름</option>
		<option value="userId" <c:if test="${ searchType eq 'userId' }" selected</c:if>>아이디</option>
	</select>
	
	<input type="text" name="keyword" value="${ keyword }">
	
	<button type="button" id="searchBtn">검색</button>
</div>

<c:import url="/WEB-INF/views/admin/layout/memberpaging.jsp" />

</c:if>