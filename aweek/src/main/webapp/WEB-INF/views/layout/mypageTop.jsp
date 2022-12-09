<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--Google Material Icons new ver.-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

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
/*   align-items: center; */
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
  color: var(--accent-color);
}
.top_menu li a:hover {
  color: var(--background-color);
}

</style>

<ul class="top_menu">
	<li>
		<a href="<%=request.getContextPath() %>/calender/main" class="top_a" id="top_calendar">
		<span class="material-icons">calendar_month</span></a>
	</li>
	<li>
		<a href="<%=request.getContextPath() %>/diary/main" class="top_a" id="top_diary">
		<span class="material-icons">note_alt</span></a>
	</li>
	<li>
		<a href="<%=request.getContextPath() %>/member/info" class="top_a" id="top_info">
		<span class="material-icons">person</span></a>
	</li>
	<li>
		<a href="<%=request.getContextPath() %>/room/main" class="top_a" id="top_room" title="모임">
		<span class="material-icons">info</span></a>
	</li>
	<li>
		<a href="<%=request.getContextPath() %>/chat/main" class="top_a" id="top_chat">
		<span class="material-icons">forum</span></a>
	</li>
	<li>
		<a href="<%=request.getContextPath() %>/inquiry/main" class="top_a" id="top_inquiry">
		<span class="material-icons">email</span></a>
	</li>
</ul>