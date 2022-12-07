

<%@page import="calendar.dto.CalDto"%>

<%@page import="java.util.List"%>
<%@page import="calendar.util.Util"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<CalDto> clist =(List) request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	function wrapCreateBoardByMask() {
		// 화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		console.log(maskHeight)
		var maskWidth = $(window).width();
		console.log(maskWidth)

		// 마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask_board_create').css({
		'width' : maskWidth,
		'height' : maskHeight
		});

		$('#mask_board_create').fadeTo("slow", 0.8);

		$('.board_create_modal').show();
		}

		$(function() {
		//검은 막 띄우기
		//기본 모달창
		$('.openMask_board_create').click(function(e) {
		//클릭 시 이벤트
		console.log("모달 켭니다.");
		e.preventDefault();
		wrapCreateBoardByMask();
		});

		//닫기 버튼을 눌렀을 때
		$('.board_create_modal .close').click(function(e) {
		//링크 기본동작은 작동하지 않도록 한다.
		e.preventDefault();
		$('#mask_board_create, .board_create_modal').hide();
		});

		//검은 막을 눌렀을 때
		$('#mask_board_create').click(function() {
		$(this).hide();
		$('.board_create_modal').hide();
		});

		});
	
})
</script>
<style type="text/css">
.calendar{
	width: 80%;
	margin-left: 320px;
}
.calendar_body{
	width: 100%;
	border: 1px solid white;
	border-collapse: collapse;
	
}

.calendar_body th{
	background-color:#f4b0b0;
	width:80px;
	border: 1px solid white;
	font-weight: bold;
}
.calendar_body td{
	background-color:#EFEFEF;
	width: 80px;
	height: 120px;
	border: 1px solid white;
	text-align: left;
	vertical-align: top;
	font-weight: bold;	
}
.side-bar{
	position: relative;
	height: 100%;
	display: flex;
	flex-direction: column;
}
.write-button{
	display: inline-block;
	padding: 16px 12px 14px;
}

.write-button a{
	display: block;
	font-weight:bold;
    background-color: #f4b0b0;
    height: 75px;
    text-align: center;
    width: 244px;
    margin-top: 23px;
    line-height: 4;
    border-top-left-radius: 3px;
    border-bottom-left-radius: 3px;
    border-top-right-radius: 3px;
    border-bottom-right-radius: 3px;
}

#mask_board_create {
position: absolute;
z-index: 9000;
background-color: #000;
display: none;
left: 0;
top: 0;
}

.board_create_modal {
display: none;
position: fixed;
z-index: 10000;
left: 50%;
top: 50%;
margin-left: -250px;
margin-top: -100px;
width: 500px;
height: 500px;
border-radius: 12px;
background-color: white;
}

.board_create_modal .top{
background-color: black; 
width:100%; height:30%; 
border-radius:12px 12px 0px 0px;
}

.board_create_modal .top .close {
float: right;
cursor: pointer;
color: white;
font-size: 25px;
font-weight: bold;
padding-top: 5px;
padding-right: 20px;
}

.board_create_modal .top .subject{
float:left;
margin-left:10px;
margin-top:20px;
font-size:20px;
font-weight:bold;
color:white;
padding-left: 20px;
}

.board_create_modal .bottom{
width:100%; 
height:15%; 
vertical-align: middle;

}

.board_create_modal .bottom .info{
padding:10px 15px 10px 15px;
text-align: right;
color: red;
}

.board_create_modal .bottom .contents{
margin:15px 20px 15px 35px;
width:100%;
text-align: center;
}

.board_create_modal .bottom .contents th{
text-align: right;
}

.board_create_modal .bottom .contents .board_name{
width:236px;
height:28px;
}

.board_create_modal .bottom .contents .board_select{
width:240px;
height:35px;
font-size:15px;
}

.board_create_modal .bottom .board_insert_button {
width:375px;
height:40px;
font-size:15px;
background-color:gray;
color:white;
}
.board_create_modal .bottom .center{
margin-left:60px;
}
</style>
</head>

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
<body>
<jsp:include page="../layout/roomHeader.jsp"></jsp:include> 
<div class="container">

<div class="side-bar">
	<div class="write-button">
	<a href="./writeForm" class="openMask_board_create" ><span>일정쓰기</span></a>
	</div>
</div>


<div class="calendar">
<table border="1" class="calendar_body">
	<caption>
	
		<a href="/calendar/myCal?year=<%=year-1 %>&month=<%=month %>">◁</a>
		<a href="/calendar/myCal?year=<%=year %>&month=<%=month-1 %>">◀</a>
		<%= year %>년 <%= month %>월
		<a href="/calendar/myCal?year=<%=year %>&month=<%=month+1 %>">▶</a>
		<a href="/calendar/myCal?year=<%=year+1 %>&month=<%=month %>">▷</a>
		
	</caption>
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
			
			//날짜 출력하는 for문
			for(int i=1; i<=lastDay; i++){
				%>
				<td>
					<span style="color:<%=Util.fontColor(dayOfWeek, i)%>;"><%=i %></span>
					
					<%// 해당 날짜에 일정 존재하면 일정 제목 출력 %>
					<%for(CalDto calDto : clist){ %>
					<% if(Integer.parseInt(calDto.getStartDate().substring(8, 10))==i&&Integer.parseInt(calDto.getStartDate().substring(5, 7))==month){ %>
					<p><%= calDto.getCalTitle() %></p>
					<%} %>
					<% } %>
				</td>				
				<% 
				
				//공백 수 + 일 수 ==7 토요일
				if((dayOfWeek-1+i)%7==0){
					out.print("</tr><tr>"); //개행
				}
				
			}
			//나머지 공백 출력하는 for문
			int countNbsp =(7-(dayOfWeek-1 + lastDay)%7)%7;
			for(int i=0; i<countNbsp; i++){
				out.print("<td>&nbsp</td>");
			}
		%>
	</tr>
</table>
</div>
</div>


<!--  어두워지는 부분 -->
<div id="mask_board_create"></div>
<!--  어두워지는 부분 ENd-->
<!--  아랫부분 모달 부분 -->
<div class="board_create_modal">

<div class="top" style="">
<div class="close" >

</div>
<div class="subject">
일정 작성
</div>
</div>

<div class="bottom">
<form action="/calendar/writeForm" name="board_create_insert_form" method="POST">
<table class="contents">
<tr>
<th>제목</th>
<td><input type="text" name="calTitle"/></td>
</tr>
<tr>
<th>날짜</th>
<td>
<input type="text" name="startDate"/>
</td>
</tr>

<tr>
<th>장소</th>
<td><input type="text" name="calPlace"></td>

<tr>

</tr>
</table>

<div class="center">
<input type="submit" value="작성">
</form>

</div>

</div>

</div>

</body>
</html>