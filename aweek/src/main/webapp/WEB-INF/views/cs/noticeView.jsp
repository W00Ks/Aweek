<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/mainHeader.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

.detail-wrap {
	margin: 70px 15%;
}

.detail {
	
}
.detail .title {

}
.detail .date {

}
.detail .hit {

}
.detail .content {

}

</style>

<script defer type="text/javascript">

</script>

<section>
	<div class="detail-wrap">
		<div class="detail">
			<p class="title">${notice.noticeTitle }</p>
			<p class="date"><fmt:formatDate value="${notice.noticeDate }" /></p>
			<p class="hit">${notice.noticeHit }</p>
			<p class="content">${notice.noticeContent }</p>
		</div>
	</div>
</section>

</body>
</html>