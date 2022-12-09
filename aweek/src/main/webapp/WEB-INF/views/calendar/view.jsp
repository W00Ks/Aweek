<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>일정 상세조회</h1>
${viewCal.calTitle }<br>
${viewCal.startDate }<br>
${viewCal.startTime }<br>
${viewCal.calPlace }<br>
${viewCal.calMemo }<br>

<a href="/calendar/update?calNo=${viewCal.calNo }"><button>수정</button></a>
<a href="/calendar/delete?calNo=${viewCal.calNo }"><button>삭제</button></a>
</body>
</html>