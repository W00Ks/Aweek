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
.qna-title {
	width: 100%;
	text-align: center;
}
.qna-title h2 {
	padding: 60px;
    border-bottom: 1px solid var(--shadow-gray);
    font-size: 30px;
    font-weight: 400;
}
.place {
	display: flex;
	float: right;
    margin: 30px 15%;
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

.qna-table {
	margin: 70px 15%;
}

.qna-table .qnaCategoryName {
	display: flex;
	width: 100%;
	margin: 70px 0px;
	justify-content: space-between;
}
.qna-table .qnaCategoryName li {
	padding: 10px 3%;
    border-radius: 29px;
    text-align: center;
    color: var(--soft-black);
    border: 1px solid var(--deep-gray);
    font-weight: 700;
    box-sizing: border-box;
    white-space: nowrap;
    font-size: 14px;
    cursor: pointer;
}
.qna-table .qnaCategoryName li:first-child {
    color: var(--baby-pink);
}
.qna-table .qnaCategoryName li a {
	color: var(--soft-black);
}
.qna {
    padding: 0 40px;
    margin: 15px 0;
	border: 1px solid var(--deep-gray);
    border-radius: 5px;
    font-size: 14px;
}
.qna .qnaTitle-wrap,
.qna .qnaContent-wrap {
    padding: 15px 0;
    display: flex;
    align-items: center;
}
.qna .qnaContent-wrap {
	border-top: 2px solid var(--shadow-gray);
 	display: none;
}
.qna .qnaContent-wrap.active {
	display: flex;
 	align-items: flex-start;
}
.qna .qnaTitle-wrap .qnaTitle,
.qna .qnaContent-wrap .qnaContent {
	white-space: break-spaces;
    line-height: 2.2em;
    padding-left: 20px;
}
.qna .qnaTitle-wrap .qnaTitle {
	cursor: pointer;
}
.qna .qMark,
.qna .aMark {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 20px;
	height: 20px;
	font-size: 15px;
	font-weight: 700;
	border-radius: 50%;
	margin: 5px;
	padding: 10px;
	background-color: var(--baby-pink);
	color: var(--soft-black);
}
.qna .aMark {
	background-color: var(--soft-black);
	color: var(--text-color);
}


</style>



<section>
	<div class="qna-title">
		<h2>???????????? ??????</h2>
	</div>
	
	<div class="place">
		<a href="/aweekHome"><span class="material-symbols-outlined">home</span></a>
		<a href="/cs/notice">????????????</a>
		<a href="/cs/notice">???????????? ??????</a>
	</div>
	
	<div class="qna-table">
		<ul class="qnaCategoryName">
			<li><a href="/cs/qna">??????</a></li>
			<c:forEach items="${qnaCategoryList }" var="category">
				<li onclick="viewDetail(${category.qnaCategoryNo })" id="linkColor">${category.qnaCategoryName }</li>
			</c:forEach>		
		</ul>
		
		<c:forEach items="${qnaList }" var="qna">
			<input type="hidden" name="qnaNo" value="${qna.qnaNo }"/>
			<ul class="qna">
				<li class="qnaTitle-wrap">
					<p class="qMark">Q.</p>
					<p class="qnaTitle" onclick="toggle(${qna.qnaNo })">${qna.qnaTitle }</p>
				</li>
				<li class="qnaContent-wrap" id="${qna.qnaNo }">
					<p class="aMark">A.</p>
					<p class="qnaContent">${qna.qnaContent }</p>
				</li>
			</ul>
		</c:forEach>
		<ul id="pagingul">
		
		
		
		</ul>
	</div>
	
</section>


<script defer type="text/javascript">

function toggle(qnaNo) {
	
	const qnaContentEl = document.getElementById(qnaNo);
	
	qnaContentEl.classList.toggle('active')
}

function viewDetail(qnaCategoryNo) {
	location.href = "/cs/qnaDetail?qnaCategoryNo=" + qnaCategoryNo;
}

/* function colorChange() {
	
	let linkColorEl = document.getElementById(linkColor);
	
	for( var i=1; i<=8; i++) {
	   	if( window.location.href.indexOf(i) > -1) {
	   		
	   		linkColorEl.classList.add("colorChange");
	   	}
	}
};

window.onload =  function() {
	colorChange();
} */

</script>


<script defer type="text/javascript">

let totalData; //??? ????????? ???
let dataPerPage; //??? ???????????? ????????? ??? ???
let pageCount = 10; //???????????? ????????? ????????? ???
let globalCurrentPage=1; //?????? ?????????

$(document).ready(function () {
 //dataPerPage ????????? ????????????
 dataPerPage = $("#dataPerPage").val();
 
 $.ajax({ // ajax??? ????????? ????????????
	method: "GET",
	url: "/noticeList?" + noticeNo,
	dataType: "json",
	success: function (d) {
	   //totalData ?????????
	   totalData = d.data.length;
 });
 
 //??? ?????? ?????? ?????? (????????? ??????)
 displayData(1, dataPerPage);
 
 //????????? ?????? ??????
 paging(totalData, dataPerPage, pageCount, 1);
});

function paging(totalData, dataPerPage, pageCount, currentPage) {
	  console.log("currentPage : " + currentPage);

	  totalPage = Math.ceil(totalData / dataPerPage); //??? ????????? ???
	  
	  if(totalPage<pageCount){
	    pageCount=totalPage;
	  }
	  
	  let pageGroup = Math.ceil(currentPage / pageCount); // ????????? ??????
	  let last = pageGroup * pageCount; //????????? ????????? ????????? ????????? ??????
	  
	  if (last > totalPage) {
	    last = totalPage;
	  }

	  let first = last - (pageCount - 1); //????????? ????????? ????????? ????????? ??????
	  let next = last + 1;
	  let prev = first - 1;

	  let pageHtml = "";

	  if (prev > 0) {
	    pageHtml += "<li><a href='#' id='prev'> ?????? </a></li>";
	  }

	 //????????? ?????? ?????? 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
	    }
	  }

	  if (last < totalPage) {
	    pageHtml += "<li><a href='#' id='next'> ?????? </a></li>";
	  }

	  $("#pagingul").html(pageHtml);
	  let displayCount = "";
	  displayCount = "?????? 1 - " + totalPage + " ????????? / " + totalData + "???";
	  $("#displayCount").text(displayCount);


	  //????????? ?????? ?????? ????????? 
	  $("#pagingul li a").click(function () {
	    let $id = $(this).attr("id");
	    selectedPage = $(this).text();

	    if ($id == "next") selectedPage = next;
	    if ($id == "prev") selectedPage = prev;
	    
	    //??????????????? ????????? ????????? ????????? ?????????...
	    globalCurrentPage = selectedPage;
	    //????????? ?????? ?????????
	    paging(totalData, dataPerPage, pageCount, selectedPage);
	    //??? ?????? ?????? ?????????
	    displayData(selectedPage, dataPerPage);
	});
}

//?????? ?????????(currentPage)??? ???????????? ??? ??????(dataPerPage) ??????
function displayData(currentPage, dataPerPage) {

  let chartHtml = "";

//Number??? ???????????? ????????? ???????????? +??? ??? ?????? ????????? ????????? ????????????.. 
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
  } //dataList??? ????????? ????????????.. ??? ????????? ?????? ????????? ???????????? ???...
  $("#dataTableBody").html(chartHtml);
}

$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //?????? ????????? ?????? globalCurrent ?????? ???????????? ????????? ???????????? ??? ???????????? ?????? 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
});


</script>

<c:import url="../layout/mainFooter.jsp" />