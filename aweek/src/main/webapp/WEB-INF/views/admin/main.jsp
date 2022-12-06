<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/adminheader.jsp" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,200,0,200" />

<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 200,
  'GRAD' 200,
  'opsz' 24
}
</style>

<c:if test="${ not empty adminLogin }">
	<h1>회원 검색</h1>
		<div>
			<input type="text" name="userId" id="userId" placeholder="아이디" style="width: 200px;">
			<span class="material-symbols-outlined">search</span>
	</div>
</c:if>

<c:import url="../layout/adminfooter.jsp" />