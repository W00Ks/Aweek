<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="./layout/adminheader.jsp" />

<style type="text/css">

.list {
	width: 300px;
    margin: 0 auto;
    border: 1px solid;
    margin-top: 30px;
    border-radius: 2.1em;
    margin-bottom: 50px;
}

</style>

<div class="list">
	<h1 style="margin: 0 auto; font-size: 30px; padding: 10px;">통계</h1>
</div>

<div style="width: 600px; height: 500px; margin: 0 auto;">
	<!--차트가 그려질 부분-->
	<canvas id="myChart"></canvas>
</div>

<script type="text/javascript">
	var context = document
	.getElementById('myChart')
	.getContext('2d');
		var myChart = new Chart(context, {
			type: 'line', // 차트의 형태
			data: { // 차트에 들어갈 데이터
					labels: [
					// x 축
						'일요일','월요일','화요일','수요일','목요일','금요일','토요일'
                    ],
					datasets: [
						{ // 데이터
						label: '회원가입', // 차트 제목
						fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data: [
								10, 15, 20, 10, 15, 20, 10 // x축 label에 대응되는 데이터 값
                            ],
							backgroundColor: [
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
                            borderWidth: 1 // 경계선 굵기
                        },
                        {
                        	label: '개설된 방',
							fill: false,
							data: [
								30, 25, 20, 30, 25, 20, 30
							],
							backgroundColor: 'rgb(157, 109, 12)',
							borderColor: 'rgb(157, 109, 12)'
						}
					]
				},
				options: {
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
	</body>
</html>