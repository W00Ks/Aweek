<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">



</script>

<style type="text/css">

/* 회원가입 텍스트 */
.infoTxt {
    text-align: center;
    color: #555555;
    font-size: 30px;
    font-weight: bold;
    margin: 20px auto 30px;
}

</style>

<c:import url="../layout/mainHeader.jsp" />

<c:import url="../layout/mypageTop.jsp" />

<div class="infoTxt" style="position:relative;">
	<span>나의 1:1 문의</span>
</div>


<div class="container">

<h1>게시판 리스트</h1>
<hr>

<table class="">
<thead>
	<tr>
		<th style="width: 10%;">글번호</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 15%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="board">
	<tr>
		<td>${board.boardNo }</td>
		<td><a href="./view?boardNo=${board.boardNo }">${board.title }</a></td>
		<td>${board.writerNick }</td>
		<td>${board.hit }</td>
		<td><fmt:formatDate value="${board.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<%-- <c:import url="../layout/myPaging.jsp" /> --%>

</div><!-- .container -->


</body>
</html>