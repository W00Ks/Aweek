<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
$(function(){
	$("#updateStartDateInput").datepicker({
		dateFormat: 'yy-mm-dd'
	})
})
//일정쓰기 모달창 생성
function createModal() {

	//화면의 높이와 너비
	var windowHeight = $(document).height();
	var windowWidth = $(document).width();

	console.log(windowHeight);
	console.log(windowWidth);

	$(".update_modal").css({
		'width' : windowWidth,
		'height' : windowHeight
	});

	$(".update_modal").fadeTo("slow", 0.8);

	$(".update_create_modal").show();
}

$(function() {
	$("#update_button").click(function(e) {
		
		$(".schedule_detail_modal").css("display", "none");
		
		console.log("모달창 열기");
		e.preventDefault();
		createModal();
		
		

	})

	//검은 부분 클릭하면 모달창 닫히게
	$(".update_modal").click(function() {
		$(this).hide();
		$(".update_create_modal").hide();
		$(location).attr("href","");
	})
	
	
})

})
//일정쓰기 모달창 생성 END
</script>

<style type="text/css">
.schedule_detail_header{
	position: absolute;
    top: 0;
    left: 0;
    right: 0;
    padding: 23px 70px 15px 23px;
}
.schedule_detail{
	padding: 60px 0 23px;
    background: #fff;
    box-sizing: border-box;
}
.schedule_detail_content{
	padding-top: 10px;
}
.schedule_detail_footer{
	text-align: right;
	padding-right: 18px;
}
#calTitle{
	font-size: 25px;
    line-height: 22px;
    font-weight: bold;
    display: flex;
}
dl{
	position: relative;
}

dt{
	position: absolute;
    font-weight: bold;
    color: #222;
    line-height: 20px;
    padding-left: 23px;
}
dd{
	padding-left: 143px;
    color: #222;
    line-height: 20px;
    padding-bottom: 24px;
}
button{
	font-size: 14px;
    padding: 9px 11px 9px;
    background: #fff;
    border: 1px solid #c5c5c6;
    margin-right: 10px;
    border-radius: 2px;
}
.update_modal{
	position: fixed;
	z-index: 10000;
	background-color: #000;
	top: 0;
	left: 0;
	display: none;
	
}

.update_create_modal{
	display: none;
	position: fixed;
    z-index: 10001;
    background-color: white;
    left: 35%;
    top: 16%;
    width: 650px;
    height: 660px;
	border-radius: 15px;
}

.update_modal_header{
	height: 80px;
	background-color: #f4b0b0;
	border-top-right-radius: 10px;
    border-top-left-radius: 10px;
}

.update_modal_header > h2{
	font-size: 50px;
    padding-top: 10px;
    text-align: center;
    color: white;
    font-weight: bold;
}
.update_write_form table{
	margin-top:70px;
	margin-left: 70px;
}
.update_write_form td{
	padding: 0px 20px 25px 0px;
}
#startTimeInput{
	width: 100%;
	text-align: center;
}

.update_write_form textarea{
	width: 380px;
	height: 135px;
}
.update_write_form input{
	width: 380px;
}

</style>
</head>
<body>
<div class="schedule_detail_header">

<h2 id="calTitle">${viewCal.calTitle }</h2>
</div>
<div class="schedule_detail_content">
<dl>
<dt>일시</dt>
<dd><span>${viewCal.startDate }</span></dd>


<dt>시간</dt>
<c:choose>
	<c:when test="${empty viewCal.startTime }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewCal.startTime }">
	<dd><span>${viewCal.startTime }</span></dd>
	</c:when>
</c:choose>
<dt>장소</dt>
<c:choose>
	<c:when test="${empty viewCal.calPlace }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewCal.calPlace }">
	<dd><span>${viewCal.calPlace }</span></dd>
	</c:when>
</c:choose>
<dt>메모</dt>
<c:choose>
	<c:when test="${empty viewCal.calMemo }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewCal.calMemo }">
	<dd><span>${viewCal.calMemo }</span></dd>
	</c:when>
</c:choose>
</dl>
</div>

<div class="schedule_detail_footer">
<button id="update_button" style="cursor:pointer">수정</button>
<button onclick="location.href='/calendar/delete?calNo=${viewCal.calNo }'" style="cursor:pointer">삭제</button>
</div>

<div class="update_modal"></div>
	<div class="update_create_modal">
		<div class="update_modal_header">
			<h2>Add Schedule</h2>
		</div>
		<div style="text-align: center">
			<span style="color: red; font-size: 12px"> *제목과 날짜는 필수입력사항입니다*</span>
		</div>
		<div class="update_write_form">
			<form action="/calendar/update" method="post" id="update_form" >
				<input type="hidden" name="calNo" value="${viewCal.calNo }">
				<table>
					<tr>
					<td>제목</td>
					<td class="calTitle"><input type="text" name="calTitle" id="calTitleInput" value="${viewCal.calTitle }"></td>
					</tr>
					
					<tr>
					<td>날짜</td>
					<td class="startDate"><input type="text" name="startDate" id="updateStartDateInput" readonly="readonly" value="${viewCal.startDate }"></td>
					</tr>
					<tr>
					
					<td>시간</td>
					<td class="startTime">
					<select name="startTime" id="startTimeInput">
					<option>오전 12시</option>
					<c:forEach begin="1" end="11" var="i">
					<option>오전 ${i }시</option>
					</c:forEach>
					<option>오후 12시</option>
					<c:forEach begin="1" end="11" var="j">
					<option>오후 ${j }시</option>
					</c:forEach>
					</select>
					</td>
					</tr>
					
					<tr>
					<td>장소</td>
					<td><input type="text" name="calPlace" value="${viewCal.calPlace }"></td>
					</tr>
					
					<tr>
					<td style="vertical-align: top">메모</td>
					<td><textarea rows="" cols="" name="calMemo" value="${viewCal.calMemo }"></textarea></td>
					</tr>
					
					<tr>
					
					<td><button>수정</button></td>
					
					</tr>
				</table>
			
			
			</form>
		
		
		
		</div>
	
	</div>
</body>
</html>