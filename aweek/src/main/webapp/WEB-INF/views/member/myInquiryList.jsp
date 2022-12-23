<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

body {
	font-family: 'NanumSquareNeo-Variable';
}

/* 나의 1:1 문의 텍스트 */
.myInquiryTxt {
    text-align: center;
    color: #555555;
    font-size: 30px;
    font-weight: bold;
    margin: 20px auto 40px;
    cursor: default;
}

/* 테이블 전체 */
.myInquiry_table {
	text-align: center;
    width: 1000px;
    margin: 0 auto;
    line-height: 30px;
}

/* 테이블 thead 영역 */
.myInquiry_thead {
	height: 40px;
    font-size: 18px;
    font-weight: 600;
    border-bottom: 1px solid #ccc;
    cursor: default;
}

/* 테이블 중간 여백 */
.tableMiddle {
	height: 10px;
}

/* 테이블 td 텍스트 */
.myInquiry_tbody, .myInquiry_tbody a {
	font-size: 16px;
	color: #555555;
    line-height: 40px;
    cursor: default;
}

/* 테이블 td 상단 margin */
.myInquiry_tbody tr:first-child {
	margin-top: 10px;
}

/* 테이블 하단 밑줄 */
.myInquiry_tbody tr:last-child {
	border-bottom: 1px solid #ccc;
}

/* 테이블 td hover */
.myInquiry_tbody tr:hover, .myInquiry_tbody tr:hover a {
	font-size: 19px;
    background-color: #594B4B;
    color: white;
}

/* 테이블 td content hover */
.myInquiry_tbody tr:hover a {
	color: #ffd877;
	cursor: pointer;
}

/* 테이블 하단 여백 */
.tableBottom {
	height: 10px;
}

/* 1:1 문의 작성하기 버튼 영역 */
.inquiryWriteDiv {
    width: 1000px;
    position: relative;
    margin: 10px auto;
}

/* 1:1 문의 작성하기 버튼 */
.inquiryWriteBtn {
	width: 115px;
    height: 35px;
    border-radius: 20px;
    font-size: 15px;
    font-weight: 600;
    background-color: #594B4B;
    border: 1px solid #594B4B;
    color: #ffffff;
    cursor: pointer;
    position: absolute;
    right: 30px;
	text-align: center;
	line-height: 35px;
    font-family: 'NanumSquareNeo-Variable';
}

/* 작성글 없음 - 안내 텍스트 */
.notInquiryDiv {
    margin: 100px auto 20px;
    text-align: center;
    line-height: 50px;
    font-size: 25px;
    color: #555555;
    padding: 30px 20px;
    font-family: 'NanumSquareNeo-Variable';
    cursor: default;
}

/* 작성글 없음 - 1:1 문의하기 버튼 영역 */
.inquiryWriteDiv2 {
	text-align: center;
}

/* 작성글 없음 - 1:1 문의하기 버튼 */
.inquiryWriteBtn2 {
    width: 250px;
    height: 60px;
    border-radius: 30px;
    font-size: 30px;
    font-weight: 600;
    background-color: #594B4B;
    border: 1px solid #594B4B;
    color: #ffffff;
    cursor: pointer;
    text-align: center;
    line-height: 60px;
    font-family: 'NanumSquareNeo-Variable';
    display: inline-block;
}

.member_footer {
	position: absolute;
	bottom: -80;
    width: 100%;
}

</style>

<c:import url="../layout/mainHeader.jsp" />

<c:import url="../layout/mypageTop.jsp" />

<div class="myInquiryTxt" style="position:relative;">
	<span>나의 1:1 문의</span>
</div>

<c:choose>
	<c:when test="${not empty list }">
	<table class="myInquiry_table">
		<thead class="myInquiry_thead">
		<tr>
			<th style="width: 10%;">글번호</th>
			<th style="width: 20%;">제목</th>
			<th style="width: 40%;">내용</th>
			<th style="width: 15%;">작성일</th>
		</tr>
		</thead>
	
		<tr class="tableMiddle"></tr>
		
		<tbody class="myInquiry_tbody">
		<c:forEach items="${list }" var="myInquiry">
		<tr>
			<td>${myInquiry.inquiryNo }</td>
			<c:choose>
				<c:when test="${fn:length(myInquiry.inquiryTitle) > 11 }">
					<td>${fn:substring(myInquiry.inquiryTitle, 0, 10)}...</td>
				</c:when>
				<c:otherwise>
					<td>${myInquiry.inquiryTitle }</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${fn:length(myInquiry.inquiryContent) > 21 }">
					<td><a onclick="window.open('./myInquiryView?inquiryNo=${myInquiry.inquiryNo}', 'window_name', 'width=600, height=700, top=200, left=1000, location=no, status=no, scrollbars=yes');">
							${fn:substring(myInquiry.inquiryContent, 0, 20) }...</a></td>
				</c:when>
				<c:otherwise>
					<td><a onclick="window.open('./myInquiryView?inquiryNo=${myInquiry.inquiryNo}', 'window_name', 'width=700, height=700, top=200, left=1000, location=no, status=no, scrollbars=yes');">
							${myInquiry.inquiryContent }</a></td>
				</c:otherwise>
			</c:choose>
			<td><fmt:formatDate value="${myInquiry.inquiryDate }" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
		<tr class="tableBottom"></tr>
		</tbody>
	</table>
	
	<div class="inquiryWriteDiv">
		<a class="inquiryWriteBtn" href="/cs/inquiry">1:1 문의 작성</a>
	</div>
	
	<c:import url="../layout/myInquiryPaging.jsp" />
	</c:when>
	<c:otherwise>
		<div class="notInquiryDiv">
			<p>1:1 문의 내역이 존재하지 않습니다.</p>
			<p>궁금하신 내용이 있다면 아래의 1:1 문의 작성 버튼을 눌러 문의해주세요!</p>
		</div>
		<div class="inquiryWriteDiv2">
			<a class="inquiryWriteBtn2" href="/cs/inquiry">1:1 문의 작성</a>
		</div>
		
	</c:otherwise>
</c:choose>

<div class="member_footer">
	<c:import url="../layout/mainFooter.jsp" />
</div>