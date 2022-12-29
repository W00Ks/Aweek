<%@page import="diary.dto.DiaryFavorite"%>
<%@page import="room.dto.Room"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./roomHeader.jsp" flush="true" />

<% List<DiaryFavorite> diaryFavorite = (List) request.getAttribute("diaryFavorite"); %>
<% List<Room> userRoom = (List) request.getAttribute("userRoom"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
html, body {
	height: 95%;
}
.fullmenu {
	display: flex;
	height: 100%;
	width: 100%;
}
.leftmenu {
	overflow: scroll;
	position: fixed;
	border-right: 1px solid #C7D1CA;
	height: 96%;
	width: 265px;
	background-color: white;
	z-index: 1;
}
.leftbox1 {
	display:flex;
	border-bottom: 1px solid #C7D1CA;
	height: 75px;
	width: 250px;
	justify-content: center;
	align-items: center;
}
.leftbox2 {
	display:flex;
	border-bottom: 1px solid #C7D1CA;
	height: 80px;
	width: 250px;
	justify-content: center;
	align-items: center;
}
.leftbox3 {
	border-bottom: 1px solid #C7D1CA;
	width: 250px;
	min-height: 60px;
}
.writeDiary {
	display: flex;
	font-weight:600;
	/* background-color: #f4b0b0; */
	background-color: black;
	color: white;
	height: 45px;
	width: 220px;
	margin: auto;
	border-radius: 3px / 3px;
	justify-content: center; /* 수평 정렬*/
	align-items: center; /* 수직 정렬*/
}
.writeDiary:hover {
	/* background-color: #DB9E9E; */
	background-color: black;
}
.hide {
	display: none;
}
.menublock2 {
	margin: 10px 20px 10px 20px;
	height: 20px;
}
.menublock2:hover {
	background-color: #EFEBF0;
}
.menublock2:hover>a>img:nth-child(1) {
	display: none;
}
.menublock2>a>img:nth-child(2) {
	display: none;
}
.menublock2:hover>a>img:nth-child(2) {
	display: block;
}
.menu>div {
	cursor: pointer;
}
.rightmenu {
	flex: 1;
	display: flex;
	width: 100%;
	height: 100%;
	padding: 15px;
	justify-content: center; /* 수평 정렬*/
}
.sidebox1, .sidebox3 {
	width: 205px;
}
.selectroomNo:hover {
	background-color: #EFEBF0;
}
.normalcate:hover {
	background-color: #EFEBF0;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$(".menu>div").click(function(){
		$(this).next("ul").toggleClass("hide")
	});
	
	$("#favorite").click(function(){
		$.ajax({
			type: "get"
			, url: "./favorite"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".sidebox1").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
	})
	
	$(".writediary1").click(function(){
		if(!$('input:radio[name=diaryNo]').is(':checked')){
			alert("모임을 선택해 주세요.");
			return false;
		}
		
		$(".writediary2").submit();
	});
});

function viewsetting() {
	
	const width = 800;
	const height = 550;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
	const popup = window.open('<%=request.getContextPath() %>/mydiary/setting', 'viewsetting', 'width='+ width +',height='+ height +',left='+ left +',top='+ tops);
	
}

<%-- function writesetting() {
	
	const width = 400;
	const height = 260;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let tops = (document.body.offsetHeight / 2) - (height / 2);
	left += window.screenLeft;
	const popup = window.open('<%=request.getContextPath() %>/diary/writesetting', 'writesetting', 'width='+ width +',height='+ height +',left='+ left +',top='+ tops);
	
} --%>

<%-- var deleteCookie = function(name) { // 쿠키 삭제
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;domain=localhost;path=/;';
}

window.addEventListener('load', function() {
	
	// 배열 생성
	const arr = new Array(<%=diaryFavorite.size() %> + <%=userRoom.size() %>);
	
	// 쿠키값이 없을 경우
	if(document.cookie == "") {
		
		deleteCookie('bHideResizeNotice');
		
		// 배열 0으로 초기화, 쿠키 생성
		for(let k=1; k<=arr.length; k++) {
			arr[k-1] = 0;
			document.cookie = "favcount" + k + "=" + arr[k-1] + ";path=/;"
		}
		
	} else {
		
		deleteCookie('bHideResizeNotice');
		
		// 쿠키값이 있을 경우
		let cookies = document.cookie.split(";");
		
		console.log(cookies) // 쿠키는 순서가 계속 뒤죽박죽으로 바뀌어서 배열에 담는 코드가 필요함..
		
		// 뒤죽박죽인 쿠키를 배열에 순서대로 집어넣는 코드 
 		for(let j=1; j<=arr.length; j++) {
			for(let l=1; l<=arr.length; l++) {
				if(cookies[l-1].search("favcount"+j) != -1) {
					arr[j-1] = cookies[l-1].substring(cookies[l-1].indexOf("=")+1)
				}
			}
		}
		
	}
	
	// 모임 클릭 시 마다 쿠키 카운트 증가(배열에서 기존값 가져옴)
	<% for(int i=1; i<=diaryFavorite.size() + userRoom.size(); i++) { %>
  	
		document.querySelector('.favcount<%=i %>').addEventListener("click", function() {
			document.cookie = "favcount<%=i %>=" + ++arr[<%=i-1 %>] + ";path=/;"
		})

	<% } %>
	
	console.log(arr)
	
	for(let m=1; m<=arr.length; m++) {
		if(arr[m-1] % 2 != 0) {
			document.getElementsByClassName('favcount'+m)[0].nextElementSibling.classList.remove('hide');
		}
	}
	
}) --%>
</script>

<%int favcount = 0; %>

<div class="fullmenu">
	<div class="leftmenu">
		<div class="leftbox1">
			<a style="cursor: pointer;" id="diarywrite">
			<span class="writeDiary">
			글쓰기
			</span>
			</a>
		</div>
<%-- 		<div class="leftbox2">
			<a href="./unreadnotice">
			<span style="color: black; font-size: 0.8em; width: 70px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
				<span style="font-size: 1.5em; color: #029EE4;">
				${noticeCount }
				</span><br>
				<span>
				공지사항
				</span>
			</span>
			</a>
			<a href="./best">
			<span style="color: black; font-size: 0.8em; width: 70px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
				<span style="font-size: 1.5em; color: #029EE4;">
				<img alt="" src="/resources/diary/star_FILL0_wght400_GRAD0_opsz48.png" style="width: 22px; margin-bottom: -1px;">
				</span><br>
				<span>
				추천글
				</span>
			</span>
			</a>
			<a href="./mydiary">
			<span style="color: black; font-size: 0.8em; width: 70px; height: 45px; display: flex; flex-direction: column; justify-content: flex-end; align-items: center;">
				<span style="font-size: 1.5em; color: #029EE4;">
				<img alt="" src="/resources/diary/mydiary.PNG" style="margin-bottom: -4px;">
				</span><br>
				<span>
				나의글
				</span>
			</span>
			</a>
		</div> --%>
		<div class="leftbox3">
			<div style="font-size: 0.9em; font-weight:600; height: 20px; line-height:20px; padding: 20px 20px 0px 20px;">
			== 기본 카테고리==			
			</div>
			<div class="resulttest">
			<div class="menublock2"><a href="./notice?userNo=${data.userNo }"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">공지사항</div></a></div>
			<div class="menublock2"><a href="./best?userNo=${data.userNo }"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">추천글</div></a></div>
			<div class="menublock2"><a href="./entire?userNo=${data.userNo }"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">전체글</div></a></div>
			</div>
		</div>
		<div class="leftbox4">
			<div style="font-size: 0.9em; font-weight:600; height: 20px; line-height:20px; padding: 20px 20px 0px 20px;">
			== 추가 카테고리 ==
			</div>
 			<ul>
				<c:forEach items="${myCateList }" var="data">
					<div class="menublock2"><a href="./entire?userNo=${data.userNo }"><img class="submenu1" alt="" src="/resources/diary/submenu1.PNG" style="float: left; margin-top: 3px;"><img class="submenu2" alt="" src="/resources/diary/submenu2.PNG" style="float: left; margin-top: 3px;"><div style="padding-left: 20px; font-size: 0.9em; color: black; line-height: 19px;">${data.diaryCateName }</div></a></div>
				</c:forEach>
			</ul>
		</div>
		<div style="width: 265px; height: 4%;">
		</div>
	</div>
	<div style="width: 250px; height: 100%;">
	</div>
	<div class="rightmenu">
		<div class="sidebox1"></div>
		<div class="sidebox2" style="width: 1200px; height: 100%;">
		
		
		
	<style>
        #modal1.modal1-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal1 .modal1-window {
            background: var(--baby-pink);
            /* box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ); */
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 300px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal1 .title {
            padding-left: 10px;
            display: inline;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            
        }
        #modal1 .title h2 {
            display: inline;
        }
        #modal1 .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
        }
        
        #modal1 .content {
            margin-top: 20px;
            padding: 0px 10px;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            height: 75%;
            background-color: white;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
    </style>
    
    <script type="text/javascript">
    window.addEventListener('load', function() {
/*     	const loremIpsum = document.getElementById("lorem-ipsum")
    	fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
    	    .then(response => response.text())
    	    .then(result => loremIpsum.innerHTML = result) */
    	const modal1 = document.getElementById("modal1")
    	function modal1On() {
    	    modal1.style.display = "flex"
    	}
    	function ismodal1On() {
    	    return modal1.style.display === "flex"
    	}
    	function modal1Off() {
    	    modal1.style.display = "none"
    	}
    	const btnmodal1 = document.getElementById("diarywrite")
    	btnmodal1.addEventListener("click", e => {
    	    modal1On()
    	})
    	const closeBtn = modal1.querySelector(".close-area")
    	closeBtn.addEventListener("click", e => {
    	    modal1Off()
    	})
    	window.addEventListener("keyup", e => {
    	    if(ismodal1On() && e.key === "Escape") {
    	        modal1Off()
    	    }
    	})
    })
    </script>
    
    <div id="container">
<!--         <h2>Lorem Ipsum</h2>
        <button id="btn-modal1">모달 창 열기 버튼</button>
        <div id="lorem-ipsum"></div> -->
    </div>
    <div id="modal1" class="modal1-overlay">
        <div class="modal1-window">
            <div class="title">
                <h2>모임 선택</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
            	<form action="./write" method="get" class="writediary2">
					<ul>
						<br>
						<c:forEach items="${myCateList }" var="data">
							<label for='select${data.userNo }'><div style="width: 100%; cursor: pointer; margin-bottom: 10px;" class="selectroomNo"><input type='radio' name='diaryNo' id='select${data.userNo }' value='${data.diaryCateNo }' />&nbsp;${data.diaryCateName }</div></label>
						</c:forEach>
					</ul>
				</form>
            </div>
            <br>
            <input type="button" value="확인" style="float: right; width: 60px; height: 30px; margin-top: -7px;" class="writediary1">
        </div>
    </div>