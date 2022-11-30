<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
 	width: 1100px;
	margin: 0 auto;
}
#content-left {
	border: 1px solid red;
	width: 40%;
	height: 600px;
  	float: left;
	box-sizing: border-box;
	text-align: center;
}
#content-right {
	border: 1px solid blue;
	width: 60%;
	height: 600px;
 	float: right;
	box-sizing: border-box;
}
#btnRoomCreat {
	margin-top: 25px;
    width: 345px;
    height: 46px;
}
#searchWrap {
	margin-top: 10px;  
}
#searchBar {
	width: 278px;
    height: 21px;
}
#chatList {
	border: 1px solid #ccc;
    width: 96%;
    margin: 7px auto;
    height: 469px;
}
</style>
</head>
<body>

<div id="container">

<div id="content-left">
	<a href="./create"><button id="btnRoomCreat">메시지방 만들기</button></a><br>
	<div id="searchWrap">
		<button>검색</button>
		<input id="searchBar" type="text" placeholder="메시지방, 메시지 검색"><br>
	</div>
	<div id="chatList">
	
	</div>	
</div>

<div id="content-right">
	
</div>

</div>

</body>
</html>