<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!--Google Material Icons new ver.-->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<script type="text/javascript">
$(document).ready(function () {
	
	const t1 = document.querySelector('.top_1');
	const t2 = document.querySelector('.top_2');
	const t3 = document.querySelector('.top_3');
	const t4 = document.querySelector('.top_4');
	const t5 = document.querySelector('.top_5');
	const t6 = document.querySelector('.top_6');
	const l1 = document.querySelector('.l_1');
	const l2 = document.querySelector('.l_2');
	const l3 = document.querySelector('.l_3');
	const l4 = document.querySelector('.l_4');
	const l5 = document.querySelector('.l_5');
	const l6 = document.querySelector('.l_6');
	
	if( window.location.href.indexOf("calendar") > -1 ) {
		t1.classList.add("choose");
		l1.classList.add("choose");
	}
	
	if( window.location.href.indexOf("diary") > -1 ) {
		t2.classList.add("choose");
		l2.classList.add("choose");
	}
	
	if( window.location.href.indexOf("info") > -1 ) {
		t3.classList.add("choose");
		l3.classList.add("choose");
	}
	
	if( window.location.href.indexOf("room") > -1 ) {
		t4.classList.add("choose");
		l4.classList.add("choose");
	}
	
	if( window.location.href.indexOf("chat") > -1 ) {
		t5.classList.add("choose");
		l5.classList.add("choose");
	}
	
	if( window.location.href.indexOf("myInquiry") > -1 ) {
		t6.classList.add("choose");
		l6.classList.add("choose");
	}
	
})
</script>

<style type="text/css">

:root{
	--text-color: #fff;
    --background-color: #f4b0b0;
    --deepPink-color: #cb7070;
    --accent-color: #594B4B;
    --light-color: #f8f1f1;
    --border-color: #d3c3c3;
    --shadow--color: #f1ecec;
    --point-color: #93d2cb;
}

a {
	text-decoration: none;
}

.top_menu {
	display: flex;
	align-items: center;
	justify-content: center;
	padding-left: 0;
}

.top_menu span {
	font-size: 30px;
}

.top_menu li {
	list-style: none;
	padding: 10px;
}

.top_menu li a {
	color: var(--accent-color);
}
.top_menu li a.choose {
	color: var(--background-color);
}
.top_menu li.choose {
    border: 3px solid var(--background-color);
    border-radius: 5px;
    padding: 3px 3px 1px 3px;
}
.top_menu li a:hover {
	color: var(--background-color);
}

</style>

<ul class="top_menu">
	<li class="l_1">
		<a href="<%=request.getContextPath() %>/calender/main" class="top_1" id="top_calendar">
		<span class="material-icons">calendar_month</span></a>
	</li>
	<li class="l_2">
		<a href="<%=request.getContextPath() %>/diary/main" class="top_2" id="top_diary">
		<span class="material-icons">note_alt</span></a>
	</li>
	<li class="l_3">
		<a href="<%=request.getContextPath() %>/member/info" class="top_3" id="top_info">
		<span class="material-icons">person</span></a>
	</li>
	<li class="l_4">
		<a href="<%=request.getContextPath() %>/room/main" class="top_4" id="top_room" title="모임">
		<span class="material-icons">info</span></a>
	</li>
	<li class="l_5">
		<a href="<%=request.getContextPath() %>/chat/main" class="top_5" id="top_chat">
		<span class="material-icons">forum</span></a>
	</li>
	<li class="l_6">
		<a href="<%=request.getContextPath() %>/member/myInquiry" class="top_6" id="top_myInquiry">
		<span class="material-icons">email</span></a>
	</li>
</ul>