<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/mainHeader.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

</style>

<script defer type="text/javascript">

</script>

<section>
	<div class="inquiryTitle">
		<h1>1대1 문의 작성</h1>
	</div>
	
	<form action="/inquiry" method="post" id="form">
		<div class="inquiry-content">
			<input type="hidden" name="userNo" class="userNo" value="${userNo }">
			<div class="object">
		    	<p>이름 * </p>
		    	<input type="text" id="roomName" name="roomName" placeholder="모임 이름를 적어주세요!" maxlength='40'>
		    </div>
			<div class="object">
		    	<p>이메일 * </p>
		    	<input type="text" id="inquiryEmail" name="inquiryEmail" placeholder="모임 이름를 적어주세요!" maxlength='40'>
		    </div>
			<div class="object">
		    	<p>제목 * </p>
		    	<input type="text" id="inquiryTitle" name="inquiryTitle" placeholder="모임 이름를 적어주세요!" maxlength='40'>
		    </div>
		    <div class="object">
		    	<p>문의사항 * </p>
		    	<textarea cols="30" rows="1" id="inquiryContent" name="inquiryContent" 
		     	placeholder="문의사항을 적어주세요!" maxlength='200'></textarea>
		    </div>
			<div class="object"> 
		    	<p>개인정보 동의 * </p>
		    	<div class="roomPublic-section">
			    	<input type="checkBox" name="roomPublic" value="1"  id="roomPublicY" checked>
		    	</div>
		    </div>
		    
		    <div class="btnsection">
		    	<a href="#" class="btn btn--brown wide" onclick="document.getElementById('form').submit();">모임 개설</a>
		    	<a href="#" class="btn btn--brown wide">취소</a>
		    </div>
		</div>
	</form>
</section>

</body>
</html>