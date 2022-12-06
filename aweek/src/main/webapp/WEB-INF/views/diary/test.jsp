<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.fullbox {
	display: flex;
	background-color: black;
	width: 1000px;
	height: 500px;
}
.box1 {
	background-color: red;
	width: 100px;
	height: 100px;
}
.box2 {
	flex: 1;
	background-color: blue;
	width: 100%;
	/* 1. 왜 box2가 100%같은 가변길이로 설정되면 겹치는 영역이 발생하는지 */
	/* 2. 해당 상황에서 box2에 flex: 1을 적용하면 왜 겹치는 영역이 사라지는지 */
	height: 100px;
}
</style>

</head>
<body>

<div class="fullbox">
	<div class="box1">
	</div>
	<div class="box2">
	</div>
</div>

</body>
</html>