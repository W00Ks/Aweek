<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/mainHeader.jsp"/>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#pagingul {
    text-align: center;
    display: inline-block;
    border: 1px solid #ccc;
    border-right: 0;
}

#pagingul li {
    text-align: center;
    float: left;
}

#pagingul li a {
    display: block;
    font-size: 14px;
    padding: 9px 12px;
    border-right: solid 1px #ccc;
    box-sizing: border-box;
}

#pagingul li.on {
    background: #eda712;
}

#pagingul li.on a {
    color: #fff;
}

body {
    font-family: 'NanumSquareNeo-Variable';
}
.title {
	width: 100%;
	text-align: center;
}
.title h2 {
	padding: 60px;
    border-bottom: 1px solid var(--shadow-gray);
    font-size: 30px;
    font-weight: 400;
}
.place {
	display: flex;
	float: right;
    margin: 30px 15% 0 0;
    font-size: 13px;
}
.place a {
	color: var(--deep-gray);
	display: flex;
	align-items: center;
}
.place a::before {
	content: '>';
	color: var(--deep-gray);
	margin: 0 6px;
}
.place a:first-child::before {
	display: none;
}
.place a .material-symbols-outlined {
	font-size: 18px;
}

.notice-table {
	margin: 70px 15%;
}
.notice-table .notice-table__title {
	display: flex;
	margin: 5px 0 20px 0;
    padding: 15px 0;
    white-space: nowrap;
    font-weight: 400;
    background-color: var(--baby-pink);
    text-align: center;
    white-space: nowrap;
    word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
    border-top: 2px solid var(--soft-black);
    border-bottom: 1px solid var(--soft-black);
}
.notice-table .notice-table__title li {
    padding: 0 15px;

}
.notice-table .notice-table__content {
	display: flex;
	white-space: nowrap;
	word-break: keep-all;
    text-overflow: ellipsis;
    overflow: hidden;
	margin: 0;
}
.notice-table .notice-table__content li {
	border-bottom: 2px solid var(--shadow-gray);
	padding: 15px;
}
.notice-table .notice-table__content li a {
	color: var(--soft-black);
}
.notice-table .noticeNo {
	width: 5%;
	text-align: center;
}
.notice-table .noticeTitle {
	width: 80%;
}
.notice-table .noticeDate {
	width: 10%;
	text-align: center;
}
.notice-table .noticeHit {
	width: 5%;
	text-align: center;
}


</style>


<section>
	<div class="title">
		<h2>공지사항</h2>
	</div>
	
	<div class="place">
		<a href="/aweekHome"><span class="material-symbols-outlined">home</span></a>
		<a href="/cs/notice">고객센터</a>
		<a href="/cs/notice">공지사항</a>
	</div>
	
	<div class="notice-table">
		<ul class="notice-table__title">
			<li class="noticeNo">NO</li>
			<li class="noticeTitle">제목</li>
			<li class="noticeDate">날짜</li>
			<li class="noticeHit">조회수</li>
		</ul>
	
		<c:forEach items="${noticeList }" var="notice">
			<ul class="notice-table__content">
				<li class="noticeNo">${notice.noticeNo }</li>
				<li class="noticeTitle"><a href="/cs/noticeView?noticeNo=${notice.noticeNo }">${notice.noticeTitle }</a></li>
				<li class="noticeDate"><fmt:formatDate value="${notice.noticeDate }" /></li>
				<li class="noticeHit">${notice.noticeHit }</li>
			</ul>
		</c:forEach>
			<ul id="pagingul">
			
			</ul>
	</div>
	
</section>

<script defer type="text/javascript">

let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지

$(document).ready(function () {
 //dataPerPage 선택값 가져오기
 dataPerPage = $("#dataPerPage").val();
 
 $.ajax({ // ajax로 데이터 가져오기
	method: "GET",
	url: "/noticeList?" + noticeNo,
	dataType: "json",
	success: function (d) {
	   //totalData 구하기
	   totalData = d.data.length;
 });
 
 //글 목록 표시 호출 (테이블 생성)
 displayData(1, dataPerPage);
 
 //페이징 표시 호출
 paging(totalData, dataPerPage, pageCount, 1);
});

function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);

	  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
	  
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
	  }

	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
	    }
	  }

	  if (last < totalPage) {
	    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
	  }

	  $("#pagingul").html(pageHtml);
	  let displayCount = "";
	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	  $("#displayCount").text(displayCount);


	  //페이징 번호 클릭 이벤트 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //전역변수에 선택한 페이지 번호를 담는다...
	    globalCurrentPage = selectedPage;
	    //페이징 표시 재호출
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	    //글 목록 표시 재호출
	    displayData(selectedPage, dataPerPage);
	});
}

//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  
  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++
  ) {
    chartHtml +=
      "<tr><td>" +
      dataList[i].d1 +
      "</td><td>" +
      dataList[i].d2 +
      "</td><td>" +
      dataList[i].d3 +
      "</td></tr>";
  } //dataList는 임의의 데이터임.. 각 소스에 맞게 변수를 넣어주면 됨...
  $("#dataTableBody").html(chartHtml);
}

$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
});


</script>


</body>
</html>