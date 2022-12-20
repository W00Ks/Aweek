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

#container {
	padding-top: 55px;
}
#container .slide_wrap {
	margin-top: 50px;
	position: relative;
	max-width: 1200px;
	margin: auto;
	padding-bottom: 30px;
}
#container .slide_wrap .slide_box {
	width: 100%;
	margin: auto;
	overflow-x: hidden;
}
#container .slide_wrap .slide_box .slide_list {

}
#container .slide_wrap .slide_box .slide_list .slide_content {
	display: table;
	float: left;
	max-width: 1200px;
	height: 400px;
}
#container .slide_wrap .slide_box .slide_list .slide_content img {
	max-width: 1200px;
	border-radius: 25px;
}


.slide_btn_box .slide_btn_prev {
	background-color: var(--soft-black);
    opacity: 20%;
    border: none;
    border-radius: 100px;
    width: 40px;
    height: 40px;
    color: var(--text-color);
    position: absolute;
    top: 200px;
    left: 120px;
    font-size: 25px;
}
.slide_btn_box .slide_btn_next {
    background-color: var(--soft-black);
    opacity: 20%;
    border: none;
    border-radius: 100px;
    width: 40px;
    height: 40px;
    color: var(--text-color);
    position: absolute;
    top: 200px;
    right: 120px;
    font-size: 25px;
}

.slide_pagination {
    position: absolute;
    left: 50%;
    bottom: 0;
    list-style: none;
    margin: 0;
    padding: 0;
    transform: translateX(-50%);
}

.slide_pagination .dot {
    display: inline-block;
    width: 15px;
    height: 15px;
    margin: 0 5px;
    overflow: hidden;
    background: var(--baby-pink);
    border-radius: 50%;
    transition: 0.3s;
}
.slide_pagination .dot.dot_active {
    background: var(--soft-black);
}
.slide_pagination .dot a {
    display: block;
    width: 100%;
    height: 100%;
}


/* BOX SECTION */
.feature {
	display: flex;
	flex-direction: column;
	margin: 180px 0;
}
.feature .inner {
	display: flex;
}
.feature .inner:first-child {
	flex-direction: column;
}
.feature .inner .check {
	display: flex;
	justify-content: center;
}
.feature .inner .check img {
	width: 26px;
    height: 24px;
    margin: 0 5px;
}
.feature .inner .check p {
	font-size: 22px;
    font-weight: 600;
	color: var(--deep-gray);
	margin: auto 0;
}
.feature .inner .new-event {
	font-size: 40px;
    font-weight: 600;
    margin: 20px auto 40px;
}
.feature .inner .feature-box {
    width: 100%;
    height: 300px;
    background-color: #fff6f6;;
    border-radius: 50px;
    margin: 50px 0;
    transform: translate(0, 100px);
    transition: 1s;
	opacity: 0;
	position: relative;
	cursor: pointer;
}
.feature .inner .left {
	width: 60%;
	margin-right: 50px;
}
.feature .inner .right {
	width: 40%;
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
.feature .inner .left .feature-box img {
	width: 60px;
    position: absolute;
    right: 80px;
    bottom: 60px;
}
.feature .inner .left .feature-box:first-child img {
	top: 45px;
}
.feature .inner .right .feature-box img {
	width: 180px;
    position: absolute;
    right: 115px;
    bottom: 70px;
}
.feature .inner .feature-box .box-inner {
	padding: 50px;
}
.feature .inner .feature-box .box-inner .bedge {
	width: 10%;
    text-align: center;
    padding: 5px;
    margin: 10px 0;
    background-color: #c8e2d1;
    border-radius: 15px;
    font-size: 12px;
}
.feature .inner .feature-box .box-inner .bedge.tnk {
	width: 20%;
	background-color: var(--shadow-gray);
}
.feature .inner .feature-box .box-inner .bedge.up {
	width: 17%;
	background-color: #b6d2ec;
}
.feature .inner .feature-box .box-inner .feature-content {
	font-size: 30px;
    white-space: break-spaces;
    margin: 15px 0;
    line-height: 1.5em;
}
.feature .inner .feature-box .box-inner .btn.detail {
    margin-top: 50px;
}

</style>

<script defer type="text/javascript">

window.addEventListener('load', function() {

	const io = new IntersectionObserver( (entries) => {
		entries.forEach( (entry) => {
			
			if(!entry.isIntersecting) {
				entry.target.classList.remove('show')
				return;
			}
			entry.target.classList.add('show')
		})
	})
	
	const featureEls = document.querySelectorAll('.feature-box')
	featureEls.forEach( (el) => {
		io.observe(el)
	})
	
	

});
 
</script>


<section>

	<div id="container">
		<div class="slide_wrap">
			<div class="slide_box">
				<div class="slide_list clearfix">
					<div class="slide_content slide01">
						<img alt="어위크 연말 이벤트" src="/resources/img/aweek_purple.png">
					</div>
					<div class="slide_content slide02">
						<img alt="어위크 공부 이벤트" src="/resources/img/aweek_study.png">
					</div>
					<div class="slide_content slide03">
						<img alt="어위크 송년 이벤트" src="/resources/img/aweek_night.png">
					</div>
					<div class="slide_content slide04">
						<img alt="어위크 발렌타인데이 이벤트" src="/resources/img/aweek_choco.png">
					</div>
					<div class="slide_content slide05">
						<img alt="어위크 사진 이벤트" src="/resources/img/aweek_photo.png">
					</div>
				</div><!-- // .slide_list -->
			</div><!-- // .slide_box -->
			<div class="slide_btn_box">
				<button type="button" class="slide_btn_prev">&lt;</button>
				<button type="button" class="slide_btn_next">&gt;</button>
			</div><!-- // .slide_btn_box -->
			<ul class="slide_pagination"></ul><!-- // .slide_pagination -->
		</div><!-- // .slide_wrap -->
	</div><!-- // .container -->

</section>


<section>
	<div class="feature">
		<div class="inner">
			<div class="check">
				<img alt="box" src="/resources/img/medal.png">
				<p>필수 체크</p>
			</div>
			<div class="new-event">어위크 새로운 소식</div>
		</div>
		<div class="inner">
			<div class="left">
				<div class="feature-box" onclick="location.href = '/room/main';">
					<div class="box-inner">
						<img alt="community" src="/resources/img/community.png">
						<p class="bedge new">NEW</p>
						<p class="feature-content new">다양한 사람들과 <br/>일정, 대화, 다이어리를 공유할 수 있어요.</p>
						<p class="btn detail">자세히 보기</p>
					</div>
				</div>
				<div class="feature-box" onclick="location.href = '/payment/payment';">
					<div class="box-inner">
						<img alt="money" src="/resources/img/money.png">
						<p class="bedge tnk">Thanks 2022</p>
						<p class="feature-content tnk">2022 연말감사제 어위크 사용료를 50% 할인해 드려요.</p>
						<p class="btn detail">자세히 보기</p>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="feature-box" onclick="location.href = '/chat/main';">
					<div class="box-inner">
						<p class="bedge up">UPDATE</p>
						<p class="feature-content up">채팅 이모티콘 기능이 <br/>업데이트 되었어요.</p>
						<img alt="chat" src="/resources/img/chat.png">						
						<p class="btn detail">자세히 보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>




</body>
</html>

<script type="text/javascript">

(function () {
    const slideList = document.querySelector('.slide_list');  // Slide parent dom
    const slideContents = document.querySelectorAll('.slide_content');  // each slide dom
    const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
    const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
    const pagination = document.querySelector('.slide_pagination');
    const slideLen = slideContents.length;  // slide length
    const slideWidth = 1200; // slide width
    const slideSpeed = 300; // slide speed
    const startNum = 0; // initial slide index (0 ~ 4)
    
    slideList.style.width = slideWidth * (slideLen + 2) + "px";
    
    // Copy first and last slide
    let firstChild = slideList.firstElementChild;
    let lastChild = slideList.lastElementChild;
    let clonedFirst = firstChild.cloneNode(true);
    let clonedLast = lastChild.cloneNode(true);

    // Add copied Slides
    slideList.appendChild(clonedFirst);
    slideList.insertBefore(clonedLast, slideList.firstElementChild);

    // Add pagination dynamically
    let pageChild = '';
    for (var i = 0; i < slideLen; i++) {
      pageChild += '<li class="dot';
      pageChild += (i === startNum) ? ' dot_active' : '';
      pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
    }
    pagination.innerHTML = pageChild;
    const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

    slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

    let curIndex = startNum; // current slide index (except copied slide)
    let curSlide = slideContents[curIndex]; // current slide dom
    curSlide.classList.add('slide_active');

    /** Next Button Event */
    slideBtnNext.addEventListener('click', function() {
      if (curIndex <= slideLen - 1) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
      }
      if (curIndex === slideLen - 1) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = -1;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[++curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** Prev Button Event */
    slideBtnPrev.addEventListener('click', function() {
      if (curIndex >= 0) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
      }
      if (curIndex === 0) {
        setTimeout(function() {
          slideList.style.transition = "0ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = slideLen;
      }
      curSlide.classList.remove('slide_active');
      pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
      curSlide = slideContents[--curIndex];
      curSlide.classList.add('slide_active');
      pageDots[curIndex].classList.add('dot_active');
    });

    /** Pagination Button Event */
    let curDot;
    Array.prototype.forEach.call(pageDots, function (dot, i) {
      dot.addEventListener('click', function (e) {
        e.preventDefault();
        curDot = document.querySelector('.dot_active');
        curDot.classList.remove('dot_active');
        
        curDot = this;
        this.classList.add('dot_active');

        curSlide.classList.remove('slide_active');
        curIndex = Number(this.getAttribute('data-index'));
        curSlide = slideContents[curIndex];
        curSlide.classList.add('slide_active');
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
      });
	});
    
    var ti;
   
    setInterval( () => {
		document.querySelector('.slide_btn_next').click()
	}, 5000)
    
})();


</script>