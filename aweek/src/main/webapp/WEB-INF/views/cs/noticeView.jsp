<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/mainHeader.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

body {
    font-family: 'NanumSquareNeo-Variable';
}

.detail-wrap {
	margin: 70px 15%;
}

.detail-wrap .detail {
	
}
.detail-wrap .detail .title {
	font-size: 26px;
    padding: 30px 0;
}
.detail-wrap .detail .title-detail {
	display: flex;
    padding: 15px 0px;
    margin: 15px 0;
    border-bottom: 2px solid var(--shadow-gray);
    justify-content: space-between;
    font-size: 14px;
}
.detail-wrap .detail .title-detail .date {
    flex-grow: 1;
}
.detail-wrap .detail .title-detail .hit-title {
	padding: 0 10px;
}
.detail-wrap .detail .title-detail .hit {

}
.detail-wrap .detail .content {
	margin: 70px 0;
	white-space: break-spaces;
    line-height: 2.2em;
}


.place {
	display: flex;
	justify-content: flex-end;
    margin: 30px 15%;
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

</style>

<script defer type="text/javascript">

</script>

<section>
	<div class="place">
		<a href="/aweekHome"><span class="material-symbols-outlined">home</span></a>
		<a href="/cs/notice">고객센터</a>
		<a href="/cs/notice">공지사항</a>
	</div>
	
	<div class="detail-wrap">
		<div class="detail">
			<p class="title">${notice.noticeTitle }</p>
				<div class="title-detail">
					<p class="date"><fmt:formatDate value="${notice.noticeDate }" /></p>
					<p class="hit-title">조회수</p>
					<p class="hit">${notice.noticeHit }</p>
				</div>
			<p class="content">${notice.noticeContent }</p>
		</div>
	</div>
</section>

<c:import url="../layout/mainFooter.jsp" />