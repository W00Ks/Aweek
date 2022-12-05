<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h5>이용권</h5>		
	<table class = pay border="1">
		<tr><td rowspan="2" class="pay_detail">이용권</td><td>월 기본 제공 </td><td><%=%>/5</td></tr>
		<tr><td>남은 구매 이용권 횟수</td><td id = "pay_coupon"><%=%> </td></tr>
	</table>
		
	<div class ="btns">
		<input type="button" id="check1" value="구매">
		<input type="button" id="check2" value="환불">
	</div>

</body>
</html>