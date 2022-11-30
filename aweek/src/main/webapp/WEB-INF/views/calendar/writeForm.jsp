<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- Datepicker End -->
<script>
$(document).ready(function () {
	<%-- Datepicker script --%>
	$('#startDate').datepicker({
		controlType:'select',
		oneLine:true,
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    minDate: 0
	});
	 
	$('#startDate').val($.datepicker.formatDate('yy-mm-dd', new Date()));

	$('#endDate').datepicker({
	    controlType:'select',
	    oneLine:true,
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    minDate: 0
	});
	$('#endDate').datepicker("option", "onClose", function ( selectedDate ) {
	    $("#startDate").datepicker( "option", "maxDate", selectedDate );
	});
	<%-- Datepicker script end --%>
});
</script>
</head>
<body>
<form action="/calendar/writeForm" method="post">
제목 <input type="text" name="calTitle"><br>
일시 <input type="text" name="startDate" id="startDate">  ~ <input type="text" name="endDate" id="endDate"><br>
장소 <input type="text" name="calPlace"><br>
메모 <textarea name="calMemo"></textarea><br>

<select name="startTime">
<c:forEach var="i" begin="0" end="11">
	<option>오전 ${i }시</option>
</c:forEach>
</select>
<input type="submit" value="작성">
</form>
</body>
</html>