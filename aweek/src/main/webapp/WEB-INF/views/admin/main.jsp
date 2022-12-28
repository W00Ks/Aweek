<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="./layout/adminheader.jsp" />

<script type="text/javascript">

$(document).ready(function() {

	// 검색 입력창 빈 칸시 alert
	$("#searchIcon").click(function() {
		if($.trim($("#keyword").val()) == '' ) {
			console.log("false")
			alert("검색어를 입력해주세요.");
			("#keyword").focus();
			return "/admin/main";
		}
	})

	// 검색 입력창에 focus
	$("input").eq(0).focus()
	
	// 검색 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#searchIcon").click();
		}
	})
})

</script>

<style>



</style>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 33%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/memberlist"  style="color:black;">
						<span>${ memberCount }</span>
					</a>
				</div>
			<div class="text-muted">회원</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 33%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/roomlist"  style="color:black;">
						<span>${ roomCount }</span>
					</a>
				</div>
			<div class="text-muted">모임</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 33%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/paymentlist"  style="color:black;">
						<span>${ paymentCount }</span>
					</a>
				</div>
			<div class="text-muted">결제</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 33%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/noticelist"  style="color:black;">
						<span>${ noticeCount }</span>
					</a>
				</div>
			<div class="text-muted">공지사항</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 33%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/qnalist"  style="color:black;">
						<span>${ qnaCount }</span>
					</a>
				</div>
			<div class="text-muted">자주 묻는 질문</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 33%;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/inquirylist"  style="color:black;">
						<span>${ inquiryCount }</span>
					</a>
				</div>
			<div class="text-muted">1:1 문의</div>
		</div>
	</div>
</div>

</body>
</html>