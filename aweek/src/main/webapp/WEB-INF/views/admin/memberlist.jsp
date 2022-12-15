<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(() => {

	$("#btnClick").click(() => {
		
		console.log("#btnClick")
	})
})

function search() {
	let searchForm = document.searchForm;
	let memberSearch = document.getElementById('memberSearch').value;
	
	if(memberSearch == "") {
		alert("검색어를 입력해주세요.");
		return;
	}
}

</script>

<style type="text/css">

table {
	table-layout: fixed;
}

table, th {
	text-align: center;
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

<form action="/admin/membersearch" method="post" name="searchForm">
	<div>
		<h2>회원 검색</h2>
		<select name="memberSelect">
			<option value="userNo"<c:if test="${ memberSelect eq 'userNo' }">selected</c:if>>
			번호</option>
			<option value="userId">아이디</option>
			<option value="userName">이름</option>
		</select>
		<input type="text" name="memberSearch" id="memberSearch" class="search-input" placeholder="search ~.~" value="${ map.keyword }">
		<!-- <input type="submit" name="" class="into-btn"> -->
			<button class="" id="btnClick" onclick="search()" type="submit">
				<i class="glyphicon glyphicon-search" aria-hidden="true"></i>
			</button>
	</div>
</form>

<!-- <script>
$(document).ready(function() {
	$("#btnClick").click(function() {
		$.ajax({
			url: "/admin/memberlist"
			, type: "get"
			, data: $("#searchForm").serialize()
			, success: function(res) {
				console.log(res);
			}
			, error: function(e) {
				console.log(e);
			}
		})
	})
})
</script> -->

<table style="margin: 0 auto;">
	<thead>
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 275px;">아이디</th>
			<th style="width: 275px;">이름</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${ memberlist }" var="member">
		<tr>
			<td>${ member.userNo }</td>
			<td><a href="/admin/memberdetail?userNo=${ member.userNo }">${ member.userId }</a></td>
			<td>${ member.userName }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<c:import url="/WEB-INF/views/admin/layout/memberpaging.jsp" />

</c:if>