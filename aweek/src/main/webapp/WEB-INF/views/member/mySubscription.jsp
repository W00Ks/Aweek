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

/* subscription별 영역 전체 */
.ssc_div {
	width: 350px;
    margin: 0 7px;
    height: 550px;
    border: 1px solid #ccc;
	cursor: default;
}

/* subscription 상태 */
.subInfo_on {
	border: 5px solid var(--background-color);
}
.subInfo_on_middle {
	border-bottom: 5px solid var(--background-color);
}

/* subscription 구분 텍스트 */
.ssc_top_guideTxt {
    height: 90px;
    width: 350px;
    font-size: 25px;
    color: #555555;
    border-bottom: 1px solid #ccc;
}

/* subscription 구분 텍스트 첫번째 p태그 */
.ssc_top_guideTxt p:first-child {
	font-weight: 600;
	line-height: 55px;
}

/* subscription 구분 텍스트 두번째 p태그 */
.ssc_top_guideTxt p:nth-child(2) {
	font-size: 20px;
}

/* 금액 div */
.ssc_price_div {
    height: 70px;
    width: 350px;
    font-size: 20px;
    font-weight: 600;
    color: #555555;
    border-bottom: 1px solid #ccc;
}

/* 금액 div 첫번째 p태그 */
.ssc_price_div p:first-child {
	height: 30px;
    line-height: 70px;
    font-size: 20px;
    font-weight: 600;
}

/* 월간, 연간 구독 금액 div 첫번째 p태그 */
#sscMonthContainer .ssc_price_div p:first-child, #sscYearContainer .ssc_price_div p:first-child {
	color: #575cff;
}

/* 금액 div 2번째 p태그 */
.ssc_price_div p:nth-child(2){
    font-size: 12px;
    font-weight: 600;
    line-height: 55px;
}

/* FREE 이용 서비스 영역 div */
.ssc_free_content_div {
    line-height: 40px;
    padding-top: 10px;
    font-size: 21px;
}

/* FREE 서비스 영역 기본 기능 텍스트 */
.ssc_free_content_div p:nth-child(4) {
	font-weight: 600;
}

/* FREE 서비스 영역 타이틀 */
.ssc_free_content_div p:nth-child(5), .ssc_free_content_div p:nth-child(6), .ssc_free_content_div p:nth-child(7) {
    font-size: 22px;
    position: relative;
    margin-right: 40px;
    line-height: 50px;
}

/* FREE 서비스 영역 아이콘 */
.my_sub_icon {
    font-size: 32px !important;
    position: absolute;
    top: 8px;
    margin-left: 10px;
    color: #594B4B;
}

/* 유료 이용 서비스 영역 div */
.ssc_content_div {
    line-height: 42px;
    padding-top: 10px;
    font-weight: 600;
    font-size: 22px;
}

/* 유료 이용 서비스 영역 첫번째, 두번째 p태그 */
.ssc_content_div p:nth-child(1), .ssc_content_div p:nth-child(2) {
	color: #575cff;
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
    cursor: pointer;
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
    cursor: pointer;
}

/* 연간구독 버튼 div */
.ssc_year_btn_div {
	display: inline-grid;
	margin: 10px 0;
}

/* 연간구독 구독하기 버튼 */
.ssc_year_sub_btn {
    margin: 5px 0;
    width: 130px;
    height: 40px;
    background-color: var(--background-color);
    color: var(--text-color);
    font-weight: 600;
    font-size: 16px;
    border: 1px solid var(--background-color);
    border-radius: 10px;
    cursor: pointer;
}

/* 연간구독 구독취소 버튼 */
.ssc_year_cancel_btn {
    margin: 5px 0;
    width: 130px;
    height: 40px;
    background-color: var(--text-color);
    color: var(--background-color);
    font-weight: 600;
    font-size: 16px;
    border: 1px solid var(--background-color);
    border-radius: 10px;
    cursor: pointer;
}

/* 남은 구독일, 만료일 div */
.remainingPeriod {
	line-height: 20px;
}

/* 남은 구독일, 만료일 */
.remainingPeriod em {
	font-weight: 600;
	color: #fd5b5b;
}

</style>

<c:import url="../layout/mainHeader.jsp" />

<c:import url="../layout/mypageTop.jsp" />

<div class="mySubscriptionTxt" style="position:relative;">
	<span>나의 구독</span>
</div>

<div class="ssc_container">
	<div class="ssc_div" id="sscFreeContainer">
		<div class="ssc_top_guideTxt" id="sscFreeTopGuideTxt">
			<p>FREE</p>
			<p>개인/소모임에 특화</p>
		</div>
		<div class="ssc_price_div" id="sscFreePriceDiv">
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
	<div class="ssc_div" id="sscMonthContainer">
		<div class="ssc_top_guideTxt" id="sscMonthTopGuideTxt">
			<p>PREMIUM (월간 구독)</p>
			<p>단체 모임에 특화</p>
		</div>
		<div class="ssc_price_div" id="sscMonthPriceDiv">
			<p>3,000원</p>
			<p>(매월 정기 결제)</p>
		</div>
		<div class="ssc_content_div">
			<p>공용 용량 : 100GB</p>
			<p>최대 이용자 수 : 100명</p>
			<br>
			<p>+++ FREE 기본 기능 포함 +++</p>
			<p>① 공용 용량(100GB) up</p>
			<p>② 최대 이용자 수(100명) up</p>
		</div>
		<div class="ssc_month_btn_div">
			<c:choose>
				<c:when test="${subInfo.productNo eq 2}">
					<button class="ssc_month_cancel_btn" onclick="">구독 취소</button>
				</c:when>
				<c:otherwise>
					<button class="ssc_month_sub_btn" onclick="">구독하기</button>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${subInfo.productNo eq 2}">
		<div class="remainingPeriod">
			<p>남은 구독 기간 : <em>${subDDay}</em>일</p>
			<p>(만료일 : <em>${subMonthEd}</em>)</p>
		</div>
		</c:if>
	</div>
	<div class="ssc_div" id="sscYearContainer">
		<div class="ssc_top_guideTxt" id="sscYearTopGuideTxt">
			<p>PREMIUM (연간 구독)</p>
			<p>단체 모임에 특화</p>
		</div>
		<div class="ssc_price_div" id="sscYearPriceDiv">
			<p>25,200원</p>
			<p>12개월(36,000원) → 25,200원(30% 할인)</p>
		</div>
		<div class="ssc_content_div">
			<p>공용 용량 : 100GB</p>
			<p>최대 이용자 수 : 100명</p>
			<br>
			<p>+++ FREE 기본 기능 포함 +++</p>
			<p>① 공용 용량(100GB) up</p>
			<p>② 최대 이용자 수(100명) up</p>
		</div>
		<div class="ssc_year_btn_div">
			<c:choose>
				<c:when test="${subInfo.productNo eq 3}">
					<button class="ssc_year_cancel_btn" onclick="">구독 취소</button>
				</c:when>
				<c:otherwise>
					<button class="ssc_year_sub_btn" onclick="">구독하기</button>
				</c:otherwise>
			</c:choose>
		</div>
		<c:if test="${subInfo.productNo eq 3}">
		<div class="remainingPeriod">
			<p>남은 구독 기간 : <em>${subDDay}</em>일</p>
			<p>(만료일 : <em>${subYearEd}</em>)</p>
		</div>
		</c:if>
	</div>
</div>

</body>
</html>

<script type="text/javascript">
$(document).ready(function() {
	
	if('${subInfo.productNo}' == 1) {
		$("#sscFreeContainer").addClass('subInfo_on');
// 		$("#sscFreeTopGuideTxt").css('border-bottom', '5px solid var(--background-color)');
// 		$("#sscFreePriceDiv").css('border-bottom', '5px solid var(--background-color)');
	} else if ('${subInfo.productNo}' == 2) {
		$("#sscMonthContainer").addClass('subInfo_on');
// 		$("#sscMonthTopGuideTxt").css('border-bottom', '5px solid var(--background-color)');
// 		$("#sscMonthPriceDiv").css('border-bottom', '5px solid var(--background-color)');
	} else if ('${subInfo.productNo}' == 3) {
		$("#sscYearContainer").addClass('subInfo_on');
// 		$("#sscYearTopGuideTxt").css('border-bottom', '5px solid var(--background-color)');
// 		$("#sscYearPriceDiv").css('border-bottom', '5px solid var(--background-color)');
	}
	
})
</script>