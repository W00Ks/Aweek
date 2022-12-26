<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

</script>

<style>

</style>

<c:if test="${ not empty adminLogin }">

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 20%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/memberlist"  style="color:black;">
						<c:out value="${ fn:length(memberlist) }"/>
					</a>
				</div>
			<div class="text-muted">MEMBER</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 20%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/roomlist"  style="color:black;">
						<c:out value="${ fn:length(room) }"/>
					</a>
				</div>
			<div class="text-muted">ROOM</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 20%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/noticelist"  style="color:black;">
						<c:out value="${ fn:length(notice) }"/>
					</a>
				</div>
			<div class="text-muted">NOTICE</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 20%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/inquirylist"  style="color:black;">
						<c:out value="${ fn:length(inquiry) }"/>
					</a>
				</div>
			<div class="text-muted">INQUIRY</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 20%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/qnalist"  style="color:black;">
						<c:out value="${ fn:length(qna) }"/>
					</a>
				</div>
			<div class="text-muted">Q&A</div>
		</div>
	</div>
</div>

<div class="SearchMember">
	<form action="/admin/memberlist" method="post" name="search" id="searchForm">
		<select name="type" id="type">
			<option value="userId" <c:out value="${ paging.type eq 'userId' ? 'selected' :'' }" /> >아이디</option>
			<option value="userName" <c:out value="${ paging.type eq 'userName' ? 'selected' :'' }" /> >이름</option>
		</select>
			
		<input id="searchText" type="text" name="keyword" id="keyword" value="${ paging.keyword }" placeholder="검색어를 입력하세요.">
		<button type="submit" id="searchIcon"><i class="fas fa-search">검색</i></button>
	</form>
</div>

</c:if>

</body>
</html>