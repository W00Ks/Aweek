<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainFooter.css" type="text/css" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<style type="text/css">

span {
	margin: 10px;
}

.list {
	width: 300px;
    margin: 0 auto;
    border: 1px solid;
    margin-top: 30px;
    border-radius: 2.1em;
    margin-bottom: 50px;
}

.total {
	width: 520px;
	margin: 0 auto;
}

.text-muted {
	font-size: 12px;
}

</style>

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">통계</h1>
</div>

<div class="total">

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 85px;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/memberlist"  style="color:black;">
						<span>${ memberCount }</span>
					</a>
				</div>
			<div class="text-muted">회원</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 85px;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/roomlist"  style="color:black;">
						<span>${ roomCount }</span>
					</a>
				</div>
			<div class="text-muted">모임</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 85px;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/paymentlist"  style="color:black;">
						<span>${ paymentCount }</span>
					</a>
				</div>
			<div class="text-muted">결제</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 85px;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/noticelist"  style="color:black;">
						<span>${ noticeCount }</span>
					</a>
				</div>
			<div class="text-muted">공지사항</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 85px;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/qnalist"  style="color:black;">
						<span>${ qnaCount }</span>
					</a>
				</div>
			<div class="text-muted">자주 묻는 질문</div>
		</div>
	</div>
</div>

<div class="col-xs-6 col-md-3 col-lg-3 no-padding" style="width: 85px;">
	<div class="panel panel-teal panel-widget border-right">
		<div class="row no-padding">
			<em class="fa fa-xl fa-user  color-teal"></em>
				<div class="large color-black">
					<a href="/admin/inquirylist"  style="color:black;">
						<span>${ inquiryCount }</span>
					</a>
				</div>
			<div class="text-muted">1:1 문의</div>
		</div>
	</div>
</div>

</div>

<%-- <div>
	<span>회원 : ${ memberCount }</span>
	<span>모임 : ${ roomCount }</span>
	<span>결제 : ${ paymentCount }</span>
	<span>공지사항 : ${ noticeCount }</span>
	<span>Q&A : ${ qnaCount }</span>
	<span>1:1 문의 : ${ inquiryCount }</span>
</div> --%>

<div style="width: 600px; height: 500px; margin: 0 auto;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>

<script type="text/javascript">

var context = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(context, {
	type: 'bar',	// 차트의 형태
	data: {			// 차트에 들어갈 데이터
	// x축
	labels: [ '회원', '모임', '결제', '공지사항', 'Q&A', '1:1 문의'],
	datasets: [
				{	// 데이터
				label: 'total',		// 차트 제목
				fill: false,		// line 형태일 때, 선 안쪽을 채우는지 안채우는지 확인
				// x축 label에 대응되는 데이터 값
				data: [ '${ memberCount }', '${ roomCount }', '${ paymentCount }', '${ noticeCount }', '${ qnaCount }', '${ inquiryCount }'
				], backgroundColor: [
				// 색상
				'rgba(255, 99, 132, 0.2)',
				'rgba(54, 162, 235, 0.2)',
				'rgba(255, 206, 86, 0.2)',
				'rgba(75, 192, 192, 0.2)',
				'rgba(153, 102, 255, 0.2)',
				'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
				// 경계선 색상
				'rgba(255, 99, 132, 1)',
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)',
				'rgba(75, 192, 192, 1)',
				'rgba(153, 102, 255, 1)',
				'rgba(255, 159, 64, 1)'
				],
				// 경계선 굵기
				borderWidth: 1
			}
		]
	},
	options: {
		legend: {
			display: false
		},
		scales: {
			yAxes: [
				{
					ticks: {
						beginAtZero: true
					}
				}
			]
		}
	}
});

</script>

<c:import url="../layout/mainFooter.jsp" />