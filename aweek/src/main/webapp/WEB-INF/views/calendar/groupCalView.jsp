<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%	
	//달력의 날짜를 바꾸기 위해 전달된 year와 month 파라미터를 받는다.
	String paramYear = request.getParameter("year");
	String paramMonth = request.getParameter("month");
	

	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR); //현재 년도
//	int month = cal.get(Calendar.MONTH); //현재 월 (0부터 시작) 0월 -> 1월
	int month = cal.get(Calendar.MONTH)+1;

	if(paramYear!=null){
		year = Integer.parseInt(paramYear);
	}
	
	if(paramMonth!=null){
		month = Integer.parseInt(paramMonth);
	}
	
	if(month>12){
		month=1;
		year++;
	}
	
	if(month<1){
		month=12;
		year--;
	}
	//현재 월의 1일에 대한 요일: 1~7 반환  1:일요일, 2:월요일 ....
	cal.set(year, month-1, 1);
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	//현재 월의 마지막 날 
	int lastDay= cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
$.datepicker.setDefaults({
        dateFormat: 'yymmdd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
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
	
	$("#upimportance").change(function(){
	if($(this).is(":checked")==true){
	console.log("체크됨");
	$("#upCheckboxImg").css({"background-image":"url(/resources/img/checkedStarIcon.png)"});
	} else if($(this).is(":checked")==false){
	console.log("체크해제");
	$("#upCheckboxImg").css({"background-image":"url(/resources/img/starIcon.png)"});
		}
	})
})
//일정쓰기 모달창 생성 END
</script>

<style type="text/css">
@font-face {
    font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
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
	font-family: 'NanumSquareNeo-Variable';
}
#calTitle{
	font-size: 25px;
    line-height: 22px;
    font-weight: bold;
    display: flex;
    font-family: 'NanumSquareNeo-Variable';
}
dl{
	position: relative;
	font-family: 'NanumSquareNeo-Variable';
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
.updateDeleteBtn{
	font-size: 14px;
    padding: 9px 11px 9px;
    background: #fff;
    border: 1px solid #c5c5c6;
    margin-right: 10px;
    border-radius: 2px;
    font-family: 'NanumSquareNeo-Variable';
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
	margin-top:43px;
	margin-left: 70px;
}
.update_write_form td{
	padding-left : 10px !important;
	padding: 0px 20px 25px 0px;
	font-family: 'NanumSquareNeo-Variable';
}
#startTimeInput{
	width: 388px;
	text-align: center;
	height: 27px;
}

.update_write_form textarea{
	width: 380px;
	height: 135px;
}
.update_write_form input[type="text"]{
	width: 380px;
	height: 21px;
}
span{
	font-family: 'NanumSquareNeo-Variable';
}

label{
	background-image: url("/resources/img/starIcon.png");
	display: inline-block;
	width: 15px;
    height:17px;
    margin-left: 15px;
}
.updateInput{
	padding-left: 10px;
}
.updateBtn{
	width: 388px;
	margin-left: 155px;
}
#upimportance{
	width: 0  !important;
	height: 0;
}
</style>
</head>
<body>
<div class="schedule_detail_header">

<h2 id="calTitle">${viewGroupCal.gcalTitle }</h2>

</div>
<div class="schedule_detail_content">



<dl>
<dt>일시</dt>
<dd><span>${viewGroupCal.gcalStartDate }</span></dd>


<dt>시간</dt>
<c:choose>
	<c:when test="${empty viewGroupCal.gcalStartTime }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewGroupCal.gcalStartTime }">
	<dd><span>${viewGroupCal.gcalStartTime }</span></dd>
	</c:when>
</c:choose>
<dt>장소</dt>
<c:choose>
	<c:when test="${empty viewGroupCal.gcalPlace }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewGroupCal.gcalPlace }">
	<dd><span>${viewGroupCal.gcalPlace }</span></dd>
	</c:when>
</c:choose>
<dt>메모</dt>
<c:choose>
	<c:when test="${empty viewGroupCal.gcalMemo }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewGroupCal.gcalMemo }">
	<dd><span>${viewGroupCal.gcalMemo }</span></dd>
	</c:when>
</c:choose>
<dt>참여원</dt>
<c:choose>
	<c:when test="${empty viewGroupCal.participator }">
	<dd><span>없음</span></dd>
	</c:when>
	
	<c:when test="${not empty viewGroupCal.participator }">
	<dd><span>${viewGroupCal.participator }</span></dd>
	</c:when>
</c:choose>
</dl>
</div>

<div class="schedule_detail_footer">
<c:if test="${writeUserInfo.userNo eq loginUserInfo.userNo }">
<button class= "updateDeleteBtn" id="update_button" style="cursor:pointer">수정</button>

<button class= "updateDeleteBtn" onclick="location.href='/calendar/gcalDelete?roomNo=${viewGroupCal.roomNo }&gcalNo=${viewGroupCal.gcalNo }&year=<%=year %>&month=<%=month %>'" style="cursor:pointer">삭제</button>
</c:if>

<c:if test="${writeUserInfo.userNo != loginUserInfo.userNo }">
<p>작성자 : ${writeUserInfo.userName }</p>
</c:if>
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
			<form action="/calendar/gcalUpdate" method="post" id="update_form" >
				<input type="hidden" name="year" value="<%=year%>">
				<input type="hidden" name="month" value="<%=month%>">
				<input type="hidden" name="gcalNo" value="${viewGroupCal.gcalNo }">
				<input type="hidden" name="roomNo" value="${viewGroupCal.roomNo }">
				<table>
					<tr>
					<td style="padding-left: 0; padding-right: 0;">제목<span>
					<c:if test="${viewGroupCal.importance eq 1 }">
					
					<label for="upimportance" id="upCheckboxImg" style="vertical-align: bottom; margin-left: 15px; background-image: url('/resources/img/checkedStarIcon.png');">
					<input type="checkbox" name="importance" id="upimportance" checked="checked">
					</label></span>
					</td>
					</c:if>
					<c:if test="${viewGroupCal.importance eq 0 }">
					
					<label for="upimportance" id="upCheckboxImg" style="vertical-align: bottom; margin-left: 15px; background-image: url('/resources/img/starIcon.png');">
					<input type="checkbox" name="importance" id="upimportance">
					</label></span>
					</td>
					</c:if>
					<td class="calTitle updateInput" ><input type="text" name="gcalTitle" id="calTitleInput" value="${viewGroupCal.gcalTitle }"></td>
					</tr>
					
					<tr>
					<td>날짜</td>
					<td class="startDate updateInput"><input type="text" name="gcalStartDate" id="updateStartDateInput" readonly="readonly" value="${viewGroupCal.gcalStartDate }"></td>
					</tr>
					<tr>
					
					<td>시간</td>
					<td class="startTime updateInput">
					<select name="gcalStartTime" id="startTimeInput">
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
					<td style="padding-left: 0;">참여원</td>
					<td>
					<select id="participator">
					<c:forEach items="${loginUserRoomsMemberInfo }" var="member">
					<option>${member.userName }</option>
					</c:forEach>
					</select>
					</td>
					</tr>
					 <tr>
					<td>&nbsp;</td>
					<td>
					<c:forEach items="${loginUserRoomsMemberInfo }" var="member">
					<input type="checkbox" value="${member.userName }"  name="participator">${member.userName }
 					</c:forEach>
 					</tr>
					
					<tr>
					<td>장소</td>
					<td class="updateInput"><input type="text" name="gcalPlace" value="${viewGroupCal.gcalPlace }"></td>
					</tr>
					
					<tr>
					<td style="vertical-align: top">메모</td>
					<td class="updateInput"><textarea rows="" cols="" name="gcalMemo" >${viewGroupCal.gcalMemo }</textarea></td>
					</tr>
					
<!-- 					<tr> -->
					
<!-- 					<td><button>수정</button></td> -->
					
<!-- 					</tr> -->
				</table>
					<button class="updateBtn">수정</button>
			
			</form>
		
		
		
		</div>
	
	</div>
</body>
</html>