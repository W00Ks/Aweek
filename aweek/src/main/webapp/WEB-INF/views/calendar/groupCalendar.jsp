

<%@page import="calendar.util.Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="calendar.dto.groupCalDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<groupCalDto> gCalList = (List)request.getAttribute("gropCalList"); %>
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

<!-- Noto Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- Noto Fonts End -->

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
			$("#startDateInput").datepicker({
				dateFormat: 'yy-mm-dd'
			})
		})
	
		
		//일정 작성 유효성 검사
		$("#calTitleInput").blur(function(){
			if($("input[name=calTitle]").val() ==""){
				console.log("제목을 입력해주세요");
				
				$(".calTitle").append("<p class='warn_message title_warn_message'>제목을 입력해주세요!</p>");
				
			}else{
				$(".title_warn_message").remove();
			}
		})
		
		$("#calTitleInput").focus(function(){
			$(".title_warn_message").remove();
		})
		
		
		$("#startDateInput").blur(function(){
			if($("input[name=startDate]").val() ==""){
				console.log("제목을 입력해주세요");
				
				$(".startDate").append("<p class='warn_message date_warn_message'>날짜를 입력해주세요!</p>");
				return false;
			}else{
				$(".date_warn_message").remove();
			}
		})
		
		$("#startDateInput").focus(function(){
			$(".date_warn_message").remove();
		})
	
		
		$("#write_form").submit(function(){
			console.log("유효성검사")
			
			var calTitle_val = $("input[name=calTitle]").val();
			
			var startDate_val = $("input[name=startDate]").val();
			if(calTitle_val =="" && startDate_val ==""){
				$(".calTitle").append("<p class='warn_message title_warn_message'>제목을 입력해주세요!</p>");
				$(".startDate").append("<p class='warn_message date_warn_message'>날짜를 입력해주세요!</p>")
				
				return false;
			
			} else if(startDate_val ==""){
				console.log("날짜를 입력해주세요");
				
				$(".startDate").append("<p class='warn_message date_warn_message'>날짜를 입력해주세요!</p>")
				return false;
			} else if(calTitle_val ==""){
				console.log("제목을 입력해주세요");
				
				$(".calTitle").append("<p class='warn_message title_warn_message'>제목을 입력해주세요!</p>");
				
				return false;
			} else{
			return true;
			}
		})
		//일정작성 유효성 검사 END
		
		//일정쓰기 모달창 생성
		function createModal() {

			//화면의 높이와 너비
			var windowHeight = $(document).height();
			var windowWidth = $(document).width();

			console.log(windowHeight);
			console.log(windowWidth);

			$(".modal").css({
				'width' : windowWidth,
				'height' : windowHeight
			});

			$(".modal").fadeTo("slow", 0.8);

			$(".create_modal").show();
		}

		$(function() {
			$(".open_modal").click(function(e) {

				console.log("모달창 열기");
				e.preventDefault();
				createModal();

			})

			//검은 부분 클릭하면 모달창 닫히게
			$(".modal").click(function() {
				$(this).hide();
				$(".create_modal").hide();
				$(location).attr("href","");
			})
			
			
		})
		//일정쓰기 모달창 생성 END
		
		//일정상세보기 클릭 함수
		$(".schedule_detail_req").click(function(e){
			
			
			
			console.log("일정 상세보기");
			console.log(e);
			//ajax로 상세정보 가져오기
			var gcalNo = e.target.id;
			
			console.log(gcalNo);
			$.ajax({
				url : '/calendar/gcalView?gcalNo=' + gcalNo,
				type : 'get',
				dataType : 'text',
				success : function(res){
					console.log("응답성공");
					$(".schedule_detail").append(res);
				
				},
				error : function(request , status, error){
					console.log("응답실패");
				}
				
				
						
			})
			
			var windowHeight = $(document).height();
			var windowWidth = $(document).width();

			console.log(windowHeight);
			console.log(windowWidth);
			
			
			$(".schedule_detail_modal").css({
				'width' : windowWidth,
				'height' : windowHeight
			});
			
			$(".schedule_detail_modal").fadeTo("fast", 0.1);
			var divTop = e.clientY;
			var divLeft = e.clientX;
			
			console.log(divTop,divLeft);
			
			//마우스 좌표에 따라 창 위치 조정
			if(divTop>750 && divLeft>1445){
				$(".schedule_detail_wrap").css({
					"top": divTop -315,
					"left" : divLeft-470
					
				}).show();
			
				
			}else if(divLeft>1445){
				$(".schedule_detail_wrap").css({
					"top": divTop,
					"left" : divLeft-470
					
				}).show();
			}else if(divTop>615){
				$(".schedule_detail_wrap").css({
					"top": divTop -315,
					"left" : divLeft
					
				}).show();
			}else{
				$(".schedule_detail_wrap").css({
					"top": divTop +7 ,
					"left" : divLeft
					
				}).show();
			}
			

			
			
				
		}) 
		
		$(".schedule_detail_modal").click(function(){
			$(this).hide();
			$(".schedule_detail_wrap").hide();
			$(location).attr("href", "");
		})
		//일정 상세보기 클릭 함수 END
		
		//날짜 클릭 시 해당 날짝 입력된 상태로 작성 폼 띄우기
		$(".day").click(function(e){
		console.log(e);
		
		var day =e.target.childNodes[1].innerText;
		//day 한 자릿수면 0추가 (ex 1 -> 01)
		if(day.length<2){
			day="0"+day;
		}
		console.log(day);
		
		var year = String(<%=year %>);
		console.log("year : " + year);
		
		//month 한 자릿수면 0추가
		var month = String(<%= month %>);
		if(month.length<2){
			month = "0"+month;
		}
		createModal();
		
		$("#startDateInput").val(year+"-"+month+"-"+day);
		
		}) 
		
		$("#importance").change(function(){
			if($(this).is(":checked")==true){
				console.log("체크됨");
				$("#checkboxImg").css({"background-image":"url(/resources/img/checkedStarIcon.png)"});
			} else if($(this).is(":checked")==false){
				$("#checkboxImg").css({"background-image":"url(/resources/img/starIcon.png)"});
			}
		})
		var tr_length = $(".calendar_body tr").length
		console.log(tr_length);
		
		if(tr_length>7){
			$(".next-month-day").remove();
		}
})
</script>
<!-- Noto Fonts -->
<style> @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap'); </style>
<!-- Noto Fonts End -->

<style type="text/css">

.container{
	display: flex;
}

.calendar{
	background-color:#f8f1f1;
	width: 100%;
	position: relative;
	
}
.calendar_body{
	width: 100%;
	border: 1px solid white;
	border-collapse: collapse;
	table-layout: fixed;
	
	
}
.calendar_body a:link{
	color:#000000;
}
.calendar_body th{
	background-color:#edc7c7;
	width:80px;
	border: 2px solid #d3c3c3;
	font-weight: bold;
/* 	font-family: 'Noto Sans KR', sans-serif;  */
	font-family: 'NanumSquareNeo-Variable';
}
.calendar_body td{
	background-color:white;
	width: 80px;
	height: 120px;
	border: 2px solid #d3c3c3;
	text-align: left;
	vertical-align: top;
	font-weight: bold;	
	border-left: none;
	font-family: 'NanumSquareNeo-Variable';
}
.day:hover{
	background-color : #ccc;
}
.side-bar{
	display: flex;
    flex: 0 0 auto;
    flex-direction: column;
    height: 917px;
    border-right: 2px solid #d3c3c3;
}
.write-button{
	display: inline-block;
    padding: 55px 12px 49px;
    border-bottom: 2px solid #d3c3c3;

}

.write-button a{
	display: block;
	font-weight:bold;
    background-color: #fde6e7;
    border: 2px solid #d3c3c3;
    height: 75px;
    text-align: center;
    width: 244px;
    line-height: 4.4;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
    font-family: 'NanumSquareNeo-Variable';
}

.modal{
	position: absolute;
	z-index: 10;
	background-color: #000;
	top: 0;
	display: none;
	
}

.create_modal{
	display: none;
	position: fixed;
    z-index: 10000;
    background-color: white;
    left: 35%;
    top: 16%;
    width: 650px;
    height: 660px;
	border-radius: 15px;
}

.modal_header{
	height: 80px;
	background-color: #f4b0b0;
	border-top-right-radius: 10px;
    border-top-left-radius: 10px;
}

.modal_header h2{
	font-size: 50px;
    padding-top: 10px;
    text-align: center;
    color: white;
    font-weight: bold;
}
.write_form table{
	margin-top:70px;
	margin-left: 70px;
}
.write_form td{
	padding: 0px 20px 25px 10px;
	font-family: 'NanumSquareNeo-Variable';
}
#startTimeInput{
	width: 100%;
	text-align: center;
}

.write_form textarea{
	width: 380px;
	height: 135px;
}
.write_form input[type="text"]{
	width: 380px;
}

.warn_message{
	font-size: 12px;
	color: red;
}
.cal_nav{
	text-align: center;
    margin-top: 22px;
    margin-bottom: 57px;
}
.cal_nav a{
	padding: 10px;
	font-weight: bold;
	font-family: 'NanumSquareNeo-Variable';
	text-decoration: none;
}

.cal_nav a:hover{
	color: red;
}

.cal_nav a:link{
	color:#000000;
}
.year_month{
	font-family: 'NanumSquareNeo-Variable';
	font-size: 25px;
}

.group-list{
	height: 100%;
    border-bottom: 2px solid #d3c3c3;
    padding-top: 7px;
    font-size: 22px;
}
.group-list span{
	font-family: 'NanumSquareNeo-Variable';
}
.Dday-list{
	height: 920px;
	padding-top: 7px;
    font-size: 22px;
}
.Dday-list span{
	font-family: 'NanumSquareNeo-Variable';
}
.schedule_detail_modal{
	position: absolute;
	z-index: 10;
	background-color: #fff;
	top: 0;
	display: none;
}
.schedule_detail_wrap{
	display: none;
	position: fixed;
    z-index: 10000;
    background-color: white;
/*     left: 35%; */
/*     top: 16%; */
    width: 460px;
    height: 308px;
	border-radius: 2px;
	border: 1px solid #989898;
}

.next_month_day{
	color: #ccc;
}
.day p {
	font-family: 'NanumSquareNeo-Variable';
	padding-bottom: 3px;
}
.day a:hover{
	color: red;
}
label{
	background-image: url("/resources/img/starIcon.png");
	display: inline-block;
	width: 15px;
    height:17px;
    margin-left: 15px;
}
#importance{
	display:none;
}
.room_name{
	text-align: center;
	margin-top: 45px;
	font-family: 'NanumSquareNeo-Variable';
}
.room-name{
	font-size:18px;
}
.room-name:hover{
	font-weight: bold;
}
</style>
</head>

<%	
// 	//달력의 날짜를 바꾸기 위해 전달된 year와 month 파라미터를 받는다.
// 	String paramYear = request.getParameter("year");
// 	String paramMonth = request.getParameter("month");
	

// 	Calendar cal = Calendar.getInstance();
// 	int year = cal.get(Calendar.YEAR); //현재 년도
// //	int month = cal.get(Calendar.MONTH); //현재 월 (0부터 시작) 0월 -> 1월
// 	int month = cal.get(Calendar.MONTH)+1;

// 	if(paramYear!=null){
// 		year = Integer.parseInt(paramYear);
// 	}
	
// 	if(paramMonth!=null){
// 		month = Integer.parseInt(paramMonth);
// 	}
	
// 	if(month>12){
// 		month=1;
// 		year++;
// 	}
	
// 	if(month<1){
// 		month=12;
// 		year--;
// 	}
// 	//현재 월의 1일에 대한 요일: 1~7 반환  1:일요일, 2:월요일 ....
// 	cal.set(year, month-1, 1);
// 	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
// 	//현재 월의 마지막 날 
// 	int lastDay= cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
%>

<body>
<jsp:include page="../layout/roomHeader.jsp"></jsp:include> 
<div class="container">

<div class="side-bar">
	<div class="write-button">
	<a href="" class="open_modal" ><span>일정쓰기</span></a>
	</div>
	
	<div class="group-list">
		<span>모임목록</span><br>
		<c:forEach items="${loginUserRoomsInfo }" var="loginUserRoomsInfo">
		
		<span class="room-name">>&nbsp;<a href="/calendar/gCal?roomNo=${loginUserRoomsInfo.roomNo }" style="color:black;">${loginUserRoomsInfo.roomName }</a></span><br>
		
		</c:forEach>
	</div>
	
	<div class="Dday-list">
		<span>D-day</span><br>
		
<%-- 		<%Date date = new Date(); %> --%>
<%-- 		<% int curYear=date.getYear()+1900; %> --%>
<%-- 		<% int curMonth = date.getMonth()+1; %> --%>
<%-- 		<% int curDay = date.getDate(); %> --%>
<%-- 		<% int curTotal = curYear+curMonth+curDay; %> --%>
		
<%-- 		<% for(CalDto calDto :  clist){ %> --%>
<%-- 		<% int scheduleYear = Integer.parseInt(calDto.getStartDate().substring(0, 4)); %> --%>
<%-- 		<% int scheduleMonth = Integer.parseInt(calDto.getStartDate().substring(5, 7)); %> --%>
<%-- 		<% int scheduleDay = Integer.parseInt(calDto.getStartDate().substring(8, 10)); %> --%>
<%-- 		<% int scheduleTotal = scheduleYear+scheduleMonth+scheduleDay; %> --%>
<%-- 		<% if(scheduleYear ==year&& scheduleMonth==month){ %> --%>
<%-- 		d<%=  curTotal-scheduleTotal %> --%>
<%-- 		<%= calDto.getCalTitle() %><br> --%>
<%-- 		<% } %> --%>
<%-- 		<% } %> --%>
		<%-- <% SimpleDateFormat yyyyMMdd = new SimpleDateFormat("yyyyMMdd"); %>
		<% for(CalDto calDto :  clist){ %>
		<%  String scheduleYear = calDto.getStartDate().substring(0, 4); %>
		<%  String scheduleMonth = calDto.getStartDate().substring(5, 7); %>
		<%  String scheduleDay = calDto.getStartDate().substring(8, 10); %>
		<% String scheduleTotal = scheduleYear + scheduleMonth + scheduleDay; %>
		
		<% Date scheduleDate = yyyyMMdd.parse(scheduleTotal); %>
		<% Date todayDate = new Date(); %>
		<% String todayDay = yyyyMMdd.format(todayDate); %>
		<% long gap = todayDate.getTime()-scheduleDate.getTime()  ; %>
		<% if(Integer.parseInt(scheduleYear)==year&&Integer.parseInt(scheduleMonth)==month
			&&Integer.parseInt(scheduleTotal)>=Integer.parseInt(todayDay)){ %>
		<span class="Dday-list">D<%= gap/(24*60*60*1000)-1 %>&nbsp;<%= calDto.getCalTitle() %></span><br>
		<% } %>
		<% } %> --%>
		
		
	</div>
</div>


<div class="calendar">
<div class="room_name" onclick="location.href='/room/roomInfo?roomNo=${calRoomList.roomNo}'" style="cursor: pointer;">
${calRoomList.roomName }
</div>
<div class="cal_nav">

<a href="/calendar/gCal?roomNo=${calRoomList.roomNo }&year=<%=year-1 %>&month=<%=month %>">&lt;&lt;</a>
		<a href="/calendar/gCal?roomNo=${calRoomList.roomNo }&year=<%=year %>&month=<%=month-1 %>">&lt;</a>
		<span class="year_month"><%= year %>년 <%= month %>월</span>
		<a href="/calendar/gCal?roomNo=${calRoomList.roomNo }&year=<%=year %>&month=<%=month+1 %>">&gt;</a>
		<a href="/calendar/gCal?roomNo=${calRoomList.roomNo }&year=<%=year+1 %>&month=<%=month %>">&gt;&gt;</a>
</div>
<table border="1" class="calendar_body" >
	<!-- <caption>
	
		<a href="/calendar/myCal?year=<%=year-1 %>&month=<%=month %>">◁</a>
		<a href="/calendar/myCal?year=<%=year %>&month=<%=month-1 %>">◀</a>
		<%= year %>년 <%= month %>월
		<a href="/calendar/myCal?year=<%=year %>&month=<%=month+1 %>">▶</a>
		<a href="/calendar/myCal?year=<%=year+1 %>&month=<%=month %>">▷</a>
		
	</caption> -->
	<tr>
		<th style="color:red;">일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th style="color:blue;">토</th>
	</tr>
	<tr>
		<%	
			//달력에 1일 시작 전 공백
			//공백 출력하는 for문
			for(int i=0; i<dayOfWeek-1; i++){
				out.print("<td>&nbsp</td>");
			}
		//"/calendar/view?calNo=<%=calDto.getCalNo()
			//날짜 출력하는 for문
			for(int i=1; i<=lastDay; i++){
				%>
				<td class="day">
					<span style="color:<%=Util.fontColor(dayOfWeek, i)%>;"><%=i %></span>
					<%  for(groupCalDto gCalDto : gCalList){ %>
					<% if(Integer.parseInt(gCalDto.getGcalStartDate().substring(8, 10))==i&&Integer.parseInt(gCalDto.getGcalStartDate().substring(5, 7))==month){ %>
					<p><a href="" onclick="return false" class="schedule_detail_req" id="<%=gCalDto.getGcalNo() %>" >
					<% if(Integer.parseInt(gCalDto.getImportance())==1){ %>
					★
					<%} %>
					<%=gCalDto.getGcalStartTime() %>&nbsp;<%= gCalDto.getGcalTitle() %></a><p>
					<% } %>
					<%} %>
					<%-- <%// 해당 날짜에 일정 존재하면 일정 제목 출력 %>
					for(groupCalDto gCalDto : gCalList){ 
					<% if(Integer.parseInt(gCalDto.getGcalStartDate().substring(8, 10))==i&&Integer.parseInt(gCalDto.getGcalStartDate().substring(5, 7))==month){ %>
					<p><a href="" onclick="return false" class="schedule_detail_req" id="<%=gCalDto.getGcalNo() %>" >
					<% if(Integer.parseInt(gCalDto.getImportance())==1){ %>
					★
					<% } %>
					<%=gCalDto.getGcalStartTime() %>&nbsp;<%= gCalDto.getGcalTitle() %></a><p>
					<%} %>
					<% } %>
					<%if(month==12&&i==25){ %>
					<span>성탄절</span>
					<% } %> --%>
					
				</td>			
				
				<% 
				
				//공백 수 + 일 수 ==7 토요일
				if((dayOfWeek-1+i)%7==0){
					out.print("</tr><tr>"); //개행
				}
				
			}%>
			<%-- //나머지 공백 출력하는 for문--%>
			<% int countNbsp =(7-(dayOfWeek-1 + lastDay)%7);
			for(int i=0; i<countNbsp; i++){%>
				<td class="next_month_day"><%= i+1 %></td>
			<% }%>
		
	</tr>
	
	<tr class="next-month-day" style="color: #ccc">
			<% for( int i=1; i<=7; i++){ %>
			<% int y = countNbsp+1; %>
			<td><%=i+countNbsp %></td>
			<% } %>
	</tr>
</table>
</div>
</div>

<div class="modal"></div>
	<div class="create_modal">
		<div class="modal_header">
			<h2>Add Schedule</h2>
		</div>
		<div style="text-align: center">
			<span style="color: red; font-size: 12px; font-family: 'NanumSquareNeo-Variable';"> *제목과 날짜는 필수입력사항입니다*</span>
		</div>
		<div class="write_form">
			<form action="/calendar/gCal" method="post" id="write_form" >
			<input type="hidden" name="roomNo" value="${calRoomList.roomNo }">
			<input type="hidden" name="year" value="<%=year%>">
			<input type="hidden" name="month" value="<%=month%>">
				<table>
					<tr>
					<td style="padding-left: 0; padding-right: 0;">제목<span><label for="importance" id="checkboxImg" style="vertical-align: bottom; margin-left: 15px;"><input type="checkbox" name="importance" id="importance"></label></span></td>
					<td class="calTitle"><input type="text" name="gcalTitle" id="calTitleInput" placeholder="제목을 입력하세요."></td>
					</tr>
					
					<tr>
					<td style="padding-left: 0;">날짜</td>
					<td class="startDate"><input type="text" name="gcalStartDate" id="startDateInput" readonly="readonly" placeholder="날짜를 선택해주세요."></td>
					</tr>
					<tr>
					
					<td style="padding-left: 0;">시간</td>
					<td class="startTime">
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
					<td style="padding-left: 0;">장소</td>
					<td><input type="text" name="gcalPlace" placeholder="장소를 입력하세요."></td>
					</tr>
					
					<tr>
					<td style="vertical-align: top; padding-left: 0;">메모</td>
					<td><textarea rows="" cols="" name="gcalMemo"></textarea></td>
					</tr>
					
				
				</table>
				
				<button style="width:388px; margin-left:140px; ">작성</button>
			
			</form>
		
		
		
		</div>
	
	</div>
<div class="schedule_detail_modal"></div>
<div class="schedule_detail_wrap">
	<div class="schedule_detail">
	
	

	</div>
	
	
</div>


</body>


</html>