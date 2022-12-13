

<%@page import="calendar.dto.CalDto"%>

<%@page import="java.util.List"%>
<%@page import="calendar.util.Util"%>
<%@page import="java.util.Calendar"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<CalDto> clist =(List) request.getAttribute("list"); %>
<% CalDto viewCal = (CalDto) request.getAttribute("viewCal"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
		$("#calTitleInput").blur(function(){
			if($("input[name=calTitle]").val() ==""){
				console.log("제목을 입력해주세요");
				
				$(".calTitle").append("<p class='warn_message title_warn_message'>제목을 입력해주세요!</p>");
				
			}else{
				$(".title_warn_message").remove();
			}
		})
		
		$("#startDateInput").blur(function(){
			if($("input[name=startDate]").val() ==""){
				console.log("제목을 입력해주세요");
				
				$(".startDate").append("<p class='warn_message date_warn_message'>날짜를 입력해주세요!</p>");
				
			}else{
				$(".date_warn_message").remove();
			}
		})
	
		//일정 작성 유효성 검사
		$("#write_form").submit(function(){
			console.log("유효성검사")
			
			var calTitle_val = $("input[name=calTitle]").val();
			
			var startDate_val = $("input[name=startDate]").val();
			
			if(calTitle_val ==""){
				console.log("제목을 입력해주세요");
				
				$(".calTitle").append("<p class='warn_message title_warn_message'>제목을 입력해주세요!</p>");
				
				return false;
			} else if(startDate_val ==""){
				console.log("날짜를 입력해주세요");
				
				$(".startDate").append("<p class='warn_message date_warn_message'>날짜를 입력해주세요!</p>")
				return false;
			}
			return true;
		})
		
		//모달창 생성
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
				$(location).attr("href","/calendar/myCal");
			})
			
			
		})

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
}


.write_form textarea{
	width: 380px;
	height: 135px;
}
.write_form input{
	width: 380px;
}

.warn_message{
	font-size: 12px;
	color: red;
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
	<a href="" class="open_modal" ><span>일정쓰기</span></a>
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
					<p><a href="/calendar/view?calNo=<%=calDto.getCalNo() %>"><%= calDto.getCalTitle() %></a></p>
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

<div class="modal"></div>
	<div class="create_modal">
		<div class="modal_header">
			<h2>Add Schedule</h2>
		</div>
		<div style="text-align: center">
			<span style="color: red; font-size: 12px"> *제목과 날짜는 필수입력사항입니다*</span>
		</div>
		<div class="write_form">
			<form action="/calendar/writeForm" method="post" id="write_form" >
				<table>
					<tr>
					<td>제목</td>
					<td class="calTitle"><input type="text" name="calTitle" id="calTitleInput"></td>
					</tr>
					
					<tr>
					<td>날짜</td>
					<td class="startDate"><input type="text" name="startDate" id="startDateInput"></td>
					</tr>
					
					<tr>
					<td>장소</td>
					<td><input type="text" name="calPlace"></td>
					</tr>
					
					<tr>
					<td style="vertical-align: top">메모</td>
					<td><textarea rows="" cols=""></textarea></td>
					</tr>
					
					<tr>
					
					<td><button>작성</button></td>
					<td><button class="cancel">취소</button></td>
					</tr>
				</table>
			
			
			</form>
		
		
		
		</div>
	
	</div>




</body>
</html>