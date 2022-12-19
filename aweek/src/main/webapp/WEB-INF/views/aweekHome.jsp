<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="./layout/mainHeader.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

html {
	height: 100vh;	
}
html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
	font-family: 'NanumSquareNeo-Variable';
}

.promotion {
	display: flex;
	justify-content: center;
}
.promotion .swiper-container {
	
}
.promotion .swiper-container .swiper-wrapper {
	display: flex;
}

.promotion .swiper-container .swiper-wrapper .swiper-slide {
}
.promotion .swiper-container .swiper-wrapper .swiper-slide img {
	width: 600px;
}


.feature {
	display: flex;
	flex-direction: column;
	margin: 200px 0;
}
.feature .inner {
	display: flex;
}
.feature .inner .new-event {
	font-size: 40px;
    font-weight: 600;
    margin: 60px auto;
}
.feature .inner .feature-box {
    width: 500px;
    height: 300px;
    background-color: #fff6f6;;
    border-radius: 50px;
    margin: 50px 50px 0 0;
    transform: translate(0, 100px);
    transition: .7s;
	opacity: 0;
}
.feature .inner .left .feature-box.show,
.feature .inner .right .feature-box.show {
	transform: translate(0, 0);
	opacity: 1;
}
.feature .inner .left .feature-box:nth-child(2) {
	background-color: #f9fff6;
}
.feature .inner .right .feature-box {
    height: 650px;
    background-color: var(--shadow-gray);
}
.feature .inner .feature-box .box-inner {
	padding: 50px;
}
.feature .inner .feature-box .box-inner .bedge {
	width: 17%;
    text-align: center;
    padding: 5px;
    margin: 10px 0;
    background-color: #c8e2d1;
    border-radius: 15px;
    font-size: 12px;
}
.feature .inner .feature-box .box-inner .bedge.tnk {
	width: 23%;
	background-color: var(--shadow-gray);
}
.feature .inner .feature-box .box-inner .bedge.up {
	background-color: #b6d2ec;
}
.feature .inner .feature-box .box-inner .feature-content {
	font-size: 30px;
    white-space: break-spaces;
    margin: 15px 0;
    line-height: 1.5em;
}
.feature .inner .feature-box .box-inner .btn.detail {
    margin-top: 60px;
}

</style>

<script defer type="text/javascript">

/* new Swiper('.promotion .swiper-container', {
	  // direction: 'horizontal', // 수평 슬라이드
	  autoplay: { // 자동 재생 여부
	    delay: 5000 // 5초마다 슬라이드 바뀜
	  },
	  loop: true, // 반복 재생 여부
	  slidesPerView: 3, // 한 번에 보여줄 슬라이드 개수
	  spaceBetween: 10, // 슬라이드 사이 여백
	  centeredSlides: true, // 1번 슬라이드가 가운데 보이기
	  pagination: { // 페이지 번호 사용 여부
	    el: '.promotion .swiper-pagination', // 페이지 번호 요소 선택자
	    clickable: true // 사용자의 페이지 번호 요소 제어 가능 여부
	  },
	  navigation: { // 슬라이드 이전/다음 버튼 사용 여부
	    prevEl: '.promotion .swiper-prev', // 이전 버튼 선택자
	    nextEl: '.promotion .swiper-next' // 다음 버튼 선택자
	  }
	})
 */
window.addEventListener('load', function() {

	const io = new IntersectionObserver( (entries) => {
		entries.forEach( (entry) => {
			
			if(entry.isIntersecting) {
				entry.target.classList.add('show')
			}
		})
	})
	
	const featureEls = document.querySelectorAll('.feature-box')
	featureEls.forEach( (el) => {
		io.observe(el)
	})


});
 

</script>


<section>
	<div class="promotion">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img alt="어위크 크리스마스 이벤트" src="/resources/img/aweek_christmas.png">
				</div>
				<div class="swiper-slide">
					<img alt="어위크 공부 이벤트" src="/resources/img/aweek_study.png">
				</div>
				<div class="swiper-slide">
					<img alt="어위크 연말 이벤트" src="/resources/img/aweek_year_end.png">
				</div>
				<div class="swiper-slide">
					<img alt="어위크 발렌타인데이 이벤트" src="/resources/img/aweek_event2(white).png">
				</div>
			</div>
		</div>
	
	
		<!-- <div class="swiper-pagination"></div>
		
		<div class="swiper-prev">
			<span class="material-icons">arrow_back</span>
		</div>
		<div class="swiper-next">
		 	<span class="material-icons">arrow_forward</span>
		</div> -->
	</div>
</section>


<section>
	<div class="feature">
		<div class="inner">
			<div class="new-event">어위크 새로운 소식</div>
		</div>
		<div class="inner">
			<div class="left">
				<div class="feature-box">
					<div class="box-inner">
						<p class="bedge new">NEW</p>
						<p class="feature-content new">다양한 사람들과 일정, 대화, 다이어리를 공유할 수 있어요.</p>
						<p class="btn detail">자세히 보기</p>
					</div>
				</div>
				<div class="feature-box">
					<div class="box-inner">
						<p class="bedge tnk">Thanks 2022</p>
						<p class="feature-content tnk">2022 연말감사제 어위크 사용료를 20% 할인해 드려요.</p>
						<p class="btn detail">자세히 보기</p>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="feature-box">
					<div class="box-inner">
						<p class="bedge up">UPDATE</p>
						<p class="feature-content up">채팅 이모티콘 기능이 업데이트 되었어요.</p>
						<p class="btn detail">자세히 보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


</body>
</html>