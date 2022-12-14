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
	padding-top: 2px;
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
    resize: none;
}
.inquiry-content .object .roomPublic-section {
	width: 65%;

}
.inquiry-content .object .roomPublic-section .agree {

}

.inquiry-content .error-msg {
	display: none;
    margin: -6px 0 6px 34%;
    font-size: 12px;
    color: var(--deepPink-color);
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
function back() {
	window.history.back();
}

window.addEventListener('load', function(){
	openCheck()
});

//?????? ??? ????????? ?????? ??????
function openCheck() {
	
	let inquiryTitle = document.getElementById("inquiryTitle"); 
	let inquiryEmail = document.getElementById("inquiryEmail"); 
	let inquiryContent = document.getElementById("inquiryContent"); 
	let agree = document.getElementById("agree"); 
	
	
	inquiryTitle.addEventListener('blur', function() {
		let eMsg = document.getElementById("inquiryTitle-error"); 
		if( inquiryTitle.value == "" ) {
			eMsg.style.display = "block"
			return false;
		} else {
			eMsg.style.display = "none"
			return true;
		}
	})
	inquiryEmail.addEventListener('blur', function() {
		let eMsg = document.getElementById("inquiryEmail-error"); 
		if( inquiryEmail.value == "" ) {
			eMsg.style.display = "block"
			return false;
		} else {
			eMsg.style.display = "none"
			return true;
		}
	})
  	inquiryContent.addEventListener('blur', function() {
		let eMsg = document.getElementById("inquiryContent-error");
		if( inquiryContent.value == ""  ) {
			eMsg.style.display = "block"
			return false;
		} else {
			eMsg.style.display = "none"
			return true;
		}
	})
	
	let eMsg = document.getElementById("agree-error");
	if( agree.checked == false ) {
		eMsg.style.display = "block"
		return false;
	} else {
		eMsg.style.display = "none"
		return true;
	}
	
}

//?????? ?????? ????????? ?????? ?????? ??? alert??? ?????????
function submit() {
	
	let inquiryTitle = document.getElementById("inquiryTitle"); 
	let inquiryEmail = document.getElementById("inquiryEmail"); 
	let inquiryContent = document.getElementById("inquiryContent"); 
	let agree = document.getElementById("agree");
	
	if( inquiryTitle.value == "" ) {
		swal("???????????? ????????? ??????????????????","", "warning").then(function(){
        	$("input").eq(1).focus();
       	});
		return;
	}
	if( inquiryEmail.value == "" ) {
		swal("????????? ?????? ????????? ?????? ???????????? ??????????????????","", "warning").then(function(){
        	$("input").eq(2).focus();
       	});
		return;
	}
	if( inquiryContent.value == "" ) {
		swal("?????? ????????? ??????????????????","", "warning").then(function(){
        	$("input").eq(3).focus();
       	});
		return;
	}
	if( agree.checked == false  ) {
		swal("???????????? ?????? ????????? ???????????? ??????????????? ????????? ??? ????????????","", "warning").then(function(){
        	$("input").eq(3).focus();
       	});
		return;
	}
	
		
	document.getElementById('form').submit()
	
}

</script>

<section>
	<div class="inquiryTitle">
		<h2>1???1 ?????? ??????</h2>
	</div>
	
	<div class="place">
		<a href="/aweekHome"><span class="material-symbols-outlined">home</span></a>
		<a href="/cs/notice">????????????</a>
		<a href="/cs/inquiry">1???1 ??????</a>
	</div>
		
	<form action="/cs/inquiry" method="post" id="form">
		<div class="inquiry-content">
			<input type="hidden" name="userNo" class="userNo" value="${userNo }">
			<div class="object">
		    	<p>??????</p>
		    	<input type="text" id="inquiryTitle" name="inquiryTitle" placeholder="?????? ????????? ???????????????!" maxlength='40'>
		    </div>
		    <span class="error-msg" id="inquiryTitle-error">?????? ?????? ???????????????</span>
			<div class="object">
		    	<p>?????????</p>
		    	<input type="text" id="inquiryEmail" name="inquiryEmail" placeholder="????????? ?????? ???????????? ???????????????!" maxlength='40'>
		    </div>
		    <span class="error-msg" id="inquiryEmail-error">?????? ?????? ???????????????</span>
		    <div class="object">
		    	<p>????????????</p>
		    	<textarea cols="30" rows="1" id="inquiryContent" name="inquiryContent" 
		     	placeholder="??????????????? ???????????????!" maxlength='200'></textarea>
		    </div>
		    <span class="error-msg" id="inquiryContent-error">?????? ?????? ???????????????</span>
			<div class="object"> 
		    	<p>???????????? ??????</p>
		    	<div class="roomPublic-section">
			    	<input type="checkBox" id="agree" class="agree" >
			    	<span>??????</span>
		    	</div>
		    </div>
		    <span class="error-msg" id="agree-error" style="display: block;">?????? ??? ??????????????? ????????? ??? ????????????</span>
		    
		    <div class="btnsection">
		    	<a class="btn btn--brown wide" onclick="submit()">??????</a>
		    	<a class="btn btn--brown wide" onclick="back()">??????</a>
		    </div>
		</div>
	</form>
</section>

<c:import url="../layout/mainFooter.jsp" />