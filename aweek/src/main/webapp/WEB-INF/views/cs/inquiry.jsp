<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/mainHeader.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

body {
    font-family: 'NanumSquareNeo-Variable';
}


.place {
	display: flex;
	float: right;
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
	color: var(--deepPink-color);
	margin: 0 6px;
}
.place a:first-child::before {
	display: none;
}
.place a .material-symbols-outlined {
	font-size: 18px;
}

.inquiryTitle {
	width: 100%;
	text-align: center;
}
.inquiryTitle h2 {
	padding: 60px;
    border-bottom: 1px solid var(--shadow-gray);
    font-size: 30px;
    font-weight: 400;
}
.inquiry-content {
    margin: 70px 15%;
    padding: 50px 10%;
    border: 1px solid var(--shadow-gray);
}
.inquiry-content .object {
	display: flex;
	margin: 15px 0;
}
.inquiry-content .object p {
	width: 35%;
}
.inquiry-content .object p::after {
	content: "*";
	color: var(--background-color);
	margin: 0 3px;
}
.inquiry-content .object #inquiryTitle {
    width: 65%;
    border: 1px solid var(--soft-black);
    padding: 10px;
    border-radius: 4px;
}
.inquiry-content .object #inquiryEmail {
	width: 65%;
	border: 1px solid var(--soft-black);
    padding: 10px;
    border-radius: 4px;
}
.inquiry-content .object #inquiryContent {
	width: 65%;
	height: 200px;
	border: 1px solid var(--soft-black);
    padding: 10px;
    border-radius: 4px;
}
.inquiry-content .object .roomPublic-section {
	width: 65%;

}
.inquiry-content .object .roomPublic-section .agree {

}

.btnsection {
	display: flex;
	flex-direction: column;
    align-items: center;
    margin: 60px 0;    
}
.btn {
    width: 100%;
    height: 50px;
    background-color: var(--baby-pink);
    border-radius: 5px;
	border: 2px solid var(--deep-gray);
    color: var(--soft-black);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 10px 0;
    box-sizing: border-box;
}

.btn:hover {
    box-sizing: border-box;
    background-color: var(--text-color);
    color: var(--soft-black);
	border: 2px solid var(--soft-black);
}

</style>

<script defer type="text/javascript">

</script>

<section>
	<div class="inquiryTitle">
		<h2>1대1 문의 작성</h2>
	</div>
	
	<div class="place">
		<a href="/aweekHome"><span class="material-symbols-outlined">home</span></a>
		<a href="/cs/notice">고객센터</a>
		<a href="/cs/inquiry">1대1 질문</a>
	</div>
		
	<form action="/cs/inquiry" method="post" id="form">
		<div class="inquiry-content">
			<input type="hidden" name="userNo" class="userNo" value="${userNo }">
			<div class="object">
		    	<p>제목</p>
		    	<input type="text" id="inquiryTitle" name="inquiryTitle" placeholder="문의 제목을 적어주세요!" maxlength='40'>
		    </div>
			<div class="object">
		    	<p>이메일</p>
		    	<input type="text" id="inquiryEmail" name="inquiryEmail" placeholder="답변을 받을 이메일을 적어주세요!" maxlength='40'>
		    </div>
		    <div class="object">
		    	<p>문의사항</p>
		    	<textarea cols="30" rows="1" id="inquiryContent" name="inquiryContent" 
		     	placeholder="문의사항을 적어주세요!" maxlength='200'></textarea>
		    </div>
			<div class="object"> 
		    	<p>개인정보 동의</p>
		    	<div class="roomPublic-section">
			    	<input type="checkBox" id="agree" class="agree" >
			    	<span>동의</span>
		    	</div>
		    </div>
		    
		    <div class="btnsection">
		    	<a href="#" class="btn btn--brown wide" onclick="document.getElementById('form').submit();">전달</a>
		    	<a href="#" class="btn btn--brown wide">취소</a>
		    </div>
		</div>
	</form>
</section>

</body>
</html>