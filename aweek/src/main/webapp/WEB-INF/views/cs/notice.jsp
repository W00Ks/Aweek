<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/mainHeader.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#pagingul {
    text-align: center;
    display: inline-block;
    border: 1px solid #ccc;
    border-right: 0;
}

#pagingul li {
    text-align: center;
    float: left;
}

#pagingul li a {
    display: block;
    font-size: 14px;
    padding: 9px 12px;
    border-right: solid 1px #ccc;
    box-sizing: border-box;
}

#pagingul li.on {
    background: #eda712;
}

#pagingul li.on a {
    color: #fff;
}

body {
    font-family: 'NanumSquareNeo-Variable';
}
.title {
	width: 100%;
	text-align: center;
}
.title h2 {
	padding: 60px;
    border-bottom: 1px solid var(--shadow-gray);
    font-size: 30px;
    font-weight: 400;
}
.place {
	display: flex;
	float: right;
    margin: 30px 15% 0 0;
    font-size: 13px;
}
.place a {
	color: var(--deep-gray);
	display: flex;
	align-items: center;
}
.place a::before {
	content: '>';
	color: var(--deep-gray);
	margin: 0 6px;
}
.place a:first-child::before {
	display: none;
}
.place a .material-symbols-outlined {
	font-size: 18px;
}

.notice-table {
	margin: 70px 15%;
}
.notice-table .notice-table__title {
	display: flex;
	margin: 5px 0 20px 0;
    padding: 15px 0;
    white-space: nowrap;
    font-weight: 400;
    background-color: var(--baby-pink);
    text-align: center;
    white-space: nowrap;
    word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
    border-top: 2px solid var(--soft-black);
    border-bottom: 1px solid var(--soft-black);
}
.notice-table .notice-table__title li {
    padding: 0 15px;

}
.notice-table .notice-table__content {
	display: flex;
	white-space: nowrap;
	word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
	margin: 0;
}
.notice-table .notice-table__content li {
	border-bottom: 2px solid var(--shadow-gray);
	padding: 15px;
}
.notice-table .notice-table__content li a {
	color: var(--soft-black);
}
.notice-table .noticeNo {
	width: 5%;
	text-align: center;
}
.notice-table .noticeTitle {
	width: 80%;
}
.notice-table .noticeDate {
	width: 10%;
	text-align: center;
}
.notice-table .noticeHit {
	width: 5%;
	text-align: center;
}


</style>


<section>
	<div class="title">
		<h2>공지사항</h2>
	</div>
	
	<div class="place">
		<a href="/aweekHome"><span class="material-symbols-outlined">home</span></a>
		<a href="/cs/notice">고객센터</a>
		<a href="/cs/notice">공지사항</a>
	</div>
	
	<div class="notice-table">
		<ul class="notice-table__title">
			<li class="noticeNo">NO</li>
			<li class="noticeTitle">제목</li>
			<li class="noticeDate">날짜</li>
			<li class="noticeHit">조회수</li>
		</ul>
	
		<c:forEach items="${noticeList }" var="notice">
			<ul class="notice-table__content">
				<li class="noticeNo">${notice.noticeNo }</li>
				<li class="noticeTitle"><a href="/cs/noticeView?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></li>
				<li class="noticeDate"><fmt:formatDate value="${notice.noticeDate }" /></li>
				<li class="noticeHit">${notice.noticeHit }</li>
			</ul>
		</c:forEach>
	</div>
	
<c:import url="/WEB-INF/views/layout/paging.jsp" />
	
</section>

</body>
</html>