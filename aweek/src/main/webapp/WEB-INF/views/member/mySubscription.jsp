<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
body {
	font-family: 'NanumSquareNeo-Variable';
}

/* 나의 구독 텍스트 */
.mySubscriptionTxt {
    text-align: center;
    color: #555555;
    font-size: 30px;
    font-weight: bold;
    margin: 20px auto 40px;
    cursor: default;
    font-family: 'NanumSquareNeo-Variable';
}

/* container 전체 */
.ssc_container {
	width: 1100px;
	margin: 0 auto;
	text-align: center;
	font-family: 'NanumSquareNeo-Variable';
	display: flex;
	color: #555555;
}

/*  */
.ssc_div {
	width: 350px;
    margin: 0 7px;
    height: 600px;
    border: 1px solid #ccc;
}

/* FREE div 영역 */
.ssc_free_container {
	
}

/* PREMIUM_month div 영역 */
.ssc_month_container {

}

/* PREMIUM_month year 영역 */
.ssc_year_container {

}

/* subscription 구분 텍스트 */
.ssc_top_guideTxt {
    height: 90px;
    width: 350px;
    font-size: 25px;
    color: #555555;
    border-bottom: 1px solid #ccc;
}

.ssc_top_guideTxt p:first-child {
	font-weight: 600;
	line-height: 55px;
}

.ssc_top_guideTxt p:nth-child(2) {
	font-size: 20px;
}

/* 가격 div */
.ssc_price_div {
    height: 70px;
    width: 350px;
    font-size: 20px;
    font-weight: 600;
    color: #555555;
    border-bottom: 1px solid #ccc;
}

.ssc_price_div p:first-child {
	height: 35px;
    line-height: 70px;
    font-size: 20px;
    font-weight: 600;
}

.ssc_year_container .ssc_price_div p:first-child {
	color: #575cff;
}

.ssc_price_div p:nth-child(2), .ssc_price_div p:nth-child(3) {
    font-size: 12px;
    font-weight: 600;
    line-height: 45px;
}

/* FREE 이용 서비스 영역 div */
.ssc_free_content_div {
    line-height: 35px;
    padding-top: 10px;
    font-size: 20px;
}

/* 아이콘 */
.my_sub_icon {
    font-size: 32px !important;
    position: absolute;
    top: 8px;
    margin-left: 10px;
    color: #594B4B;
}

.ssc_free_content_div p:nth-child(4) {
	font-weight: 600;
}

.ssc_free_content_div p:nth-child(5), .ssc_free_content_div p:nth-child(6), .ssc_free_content_div p:nth-child(7) {
    font-size: 22px;
    position: relative;
    margin-right: 40px;
    line-height: 50px;
}

/* 유료 이용 서비스 영역 div */
.ssc_content_div {
    line-height: 45px;
    padding-top: 10px;
    color: #575cff;
    font-weight: 600;
    font-size: 25px;
}

/* 월간구독 버튼 div */
.ssc_month_btn_div {
	display: inline-grid;
	margin: 10px 0;
}

/* 월간구독 구독하기 버튼 */
.ssc_month_sub_btn {
    margin: 5px 0;
    width: 130px;
    height: 40px;
    background-color: var(--background-color);
    color: var(--text-color);
    font-weight: 600;
    font-size: 16px;
    border: 1px solid var(--background-color);
    border-radius: 10px;
}

/* 월간구독 구독취소 버튼 */
.ssc_month_cancel_btn {
    margin: 5px 0;
    width: 130px;
    height: 40px;
    background-color: var(--text-color);
    color: var(--background-color);
    font-weight: 600;
    font-size: 16px;
    border: 1px solid var(--background-color);
    border-radius: 10px;
}


</style>

<c:import url="../layout/mainHeader.jsp" />

<c:import url="../layout/mypageTop.jsp" />

<div class="mySubscriptionTxt" style="position:relative;">
	<span>나의 구독</span>
</div>

<div class="ssc_container">
	<div class="ssc_div ssc_free_container">
		<div class="ssc_top_guideTxt">
			<p>FREE</p>
			<p>개인/소모임에 특화</p>
		</div>
		<div class="ssc_price_div">
			<p>무료</p>
		</div>
		<div class="ssc_free_content_div">
			<p>공용 용량 : 10GB</p>
			<p>최대 이용자 수 : 10명</p>
			<br>
			<p>- - - - - 기본 기능 - - - - -</p>
			<p>캘린더 <span class="material-icons my_sub_icon" id="my_subscription_cal">calendar_month</span></p>
			<p>다이어리 <span class="material-icons my_sub_icon" id="my_subscription_diary">note_alt</span></p>
			<p>채팅 <span class="material-icons my_sub_icon" id="my_subscription_chat">forum</span></p>
		</div>
	</div>
	<div class="ssc_div ssc_month_container">
		<div class="ssc_top_guideTxt">
			<p>PREMIUM (월간 구독)</p>
			<p>단체 모임에 특화</p>
		</div>
		<div class="ssc_price_div">
			<p>3,000원</p>
			<p>(매월 정기 결제)</p>
		</div>
		<div class="ssc_content_div">
			<p>공용 용량 : 100GB</p>
			<p>최대 이용자 수 : 100명</p>
			<br>
			<p>FREE 기본 기능 포함</p>
			<p>① 공용 용량(100GB) up</p>
			<p>② 최대 이용자 수(100명) up</p>
		</div>
		<div class="ssc_month_btn_div">
			<button class="ssc_month_sub_btn">구독하기</button>
			<button class="ssc_month_cancel_btn">구독 취소</button>
		</div>
	</div>
	<div class="ssc_div ssc_year_container">
		<div class="ssc_top_guideTxt">
			<p>PREMIUM (연간 구독)</p>
			<p>단체 모임에 특화</p>
		</div>
		<div class="ssc_price_div">
			<p>25,200원</p>
			<p>12개월(36,000원) > 30% 할인 → 25,200원</p>
		</div>
		<div class="ssc_content_div">
			<p>공용 용량 : 100GB</p>
			<p>최대 이용자 수 : 100명</p>
			<br>
			<p>FREE 기본 기능 포함</p>
			<p>① 공용 용량(100GB) up</p>
			<p>② 최대 이용자 수(100명) up</p>
		</div>
		<div class="ssc_year_btn_div">
			<button class="ssc_year_sub_btn">구독하기</button>
			<button class="ssc_year_cancel_btn">구독 취소</button>
		</div>
	</div>
</div>

</body>
</html>