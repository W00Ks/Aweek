<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>

<%-- <c:import url="../layout/header.jsp" /> --%>

<!-- <script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/board/write"
	})
})
</script> -->

<style type="text/css">

th {
	text-align: center;
	border-bottom: 1px solid #C7D1CA;
	 border-bottom-width: thick;
}

td {
	text-align: center;
	border-bottom: 1px solid #C7D1CA;
}

</style>

<div class="container">

<h1>게시판 카테고리</h1>
<hr>
<h5>카테고리는 모임당 최대 10개까지 추가할 수 있습니다.</h5>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 20%;">모임 번호</th>
		<th style="width: 20%;">카테고리 번호</th>
		<th style="width: 60%;">카테고리 제목</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${categoryList }" var="data">
	<tr>
		<td>${data.roomNo }</td>
		<td>${data.diaryCateNo }</td>
		<td>${data.diaryCateName }</td>
<%-- 		<td>${board.hit }</td>
		<td><fmt:formatDate value="${board.writeDate }" pattern="yy-MM-dd HH:mm:ss"/></td> --%>
	</tr>
</c:forEach>
</tbody>
</table>

<!-- <button id="btnWrite" class="btn btn-primary pull-left">글쓰기</button> -->
<%-- <span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div> --%>

<%-- <c:import url="/WEB-INF/views/layout/paging.jsp" /> --%>

</div><!-- .container -->

<%-- <c:import url="../layout/footer.jsp" /> --%>
