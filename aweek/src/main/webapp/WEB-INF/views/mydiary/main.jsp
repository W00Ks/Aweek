<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.rightbox1 {
	height: 35px;
}
.rightbox2 {
	height: 200px;
}
.rightbox3 {
	height: 200px;
}
.rightbox4 {
	height: 200px;
}
.rightbox5 {
	height: 200px;
}
table {
	width: 100%;
	margin-top:	-10px;
}
th, td {
	text-align: center;
	padding-top: 5px;
	padding-bottom: 5px;
}
td:nth-child(4) {
	text-align: center;
}
th {
	border-bottom: 1px solid #C7D1CA;
	border-bottom-width: thick;
	font-weight: 600;
}
td {
}
tr {
	width: 585px;
	height: 50px;
	margin-right: 15px;
	border-bottom: 1px solid #C7D1CA;
	line-height: 50px;
	font-size: 0.9em;
}
</style>
		
<div class="rightbox1">
</div>
<div class="rightbox2">
	<div style="font-size: 1.2em; font-weight:600;">도움말</div><br>
	<div style="width: 100%; height:75%; border: 1px solid #C7D1CA; display: flex;">
		<div style="width: 570px; height: 60px; display: inline-block; margin: 45px;">
		<span>게시판은 어떤 곳 인가요?</span><br><br>
		<span style="font-size: 1.5em; font-weight: 600;">중요 정보를 구성원과 공유할 수 있는 서비스 입니다.</span>
		</div>
		<div style="display: inline-block; margin-left: 70px;">
		<img alt="" src="/resources/diary/help3.png" style="float: right; margin: 17px; cursor: pointer;" id="help3";>
		<img alt="" src="/resources/diary/help2.png" style="float: right; margin: 17px; cursor: pointer;" id="help2";>
		<img alt="" src="/resources/diary/help1.png" style="float: right; margin: 17px; cursor: pointer;" id="help1";>
		</div>
	</div>
</div>
<div class="rightbox1">
</div>
<br>
<div class="rightbox3">
	<div style="font-size: 1.2em; font-weight:600;">공지사항<a href="./notice?userNo=${data.userNo }" style="cursor: pointer;"><div style="float: right; font-size: 0.7em; font-weight:400; color: black;">더보기<img alt="" src="/resources/diary/submenu1.PNG" style="float: right; margin: 0px 3px;"></div></a></div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<c:forEach items="${diaryNotice }" var="Notice" end="3">
	<tr onclick="location.href='./view?diaryNo=${Notice.diaryNo }'" style="display: inline-block; cursor: pointer;">
		<td style="width: 90px;">${Notice.diaryNo }</td>
		<td style="width: 25%; font-weight: 600;">${Notice.diaryTitle }</td>
		<td style="width: 90px;"><fmt:formatDate value="${Notice.diaryDate }" pattern="yyyy-MM-dd"/></td>
		<td style="width: 90px;">조회수 0</td>
		<td style="width: 90px;">추천수 0</td>
	</tr>
	</c:forEach>
	</table>		
</div>
<div class="rightbox4">
	<div style="font-size: 1.2em; font-weight:600;">추천글<a href="./best?userNo=${data.userNo }" style="cursor: pointer;"><div style="float: right; font-size: 0.7em; font-weight:400; color: black;">더보기<img alt="" src="/resources/diary/submenu1.PNG" style="float: right; margin: 0px 3px;"></div></a></div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<c:forEach items="${diaryRecomm }" var="Recomm" end="3">
	<tr onclick="location.href='./view?diaryNo=${Recomm.diaryNo }'" style="display: inline-block; cursor: pointer;">
		<td style="width: 90px;">공지1</td>
		<td style="width: 25%; font-weight: 600;">${Recomm.diaryTitle }</td>
		<td style="width: 90px;"><fmt:formatDate value="${Recomm.diaryDate }" pattern="yyyy-MM-dd"/></td>
		<td style="width: 90px;">조회수 0</td>
		<td style="width: 90px;">추천수 0</td>
	</tr>
	</c:forEach>
	</table>
</div>
<div class="rightbox5">
	<div style="font-size: 1.2em; font-weight:600;">전체글<a href="./entire?userNo=${data.userNo }" style="cursor: pointer;"><div style="float: right; font-size: 0.7em; font-weight:400; color: black;">더보기<img alt="" src="/resources/diary/submenu1.PNG" style="float: right; margin: 0px 3px;"></div></a></div>
	<hr>
	<table class="table table-striped table-hover table-condensed">
	<%int testtest = 0; %>
	<c:forEach items="${diaryCurrent }" var="Current" end="3">
	<tr onclick="location.href='./view?diaryNo=${Current.diaryNo }'" style="display: inline-block; cursor: pointer;">
		<td style="width: 90px;">카테고리<%=testtest++ %></td>
		<td style="width: 25%; font-weight: 600;">${Current.diaryTitle }</td>
		<td style="width: 90px;"><fmt:formatDate value="${Current.diaryDate }" pattern="yyyy-MM-dd"/></td>
		<td style="width: 90px;">조회수 0</td>
		<td style="width: 90px;">추천수 0</td>
	</tr>
	</c:forEach>
	</table>
</div>
			
<jsp:include page="./footer.jsp" flush="true" />

	<style>
        #modal3.modal3-overlay {
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
        #modal3 .modal3-window {
            background: var(--baby-pink);
            /* box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ); */
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 720px;
            height: 605px;
            position: relative;
            top: -50px;
            padding: 10px;
        }
        #modal3 .title {
            padding-left: 10px;
            display: inline;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            
        }
        #modal3 .title h2 {
            display: inline;
        }
        #modal3 .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
        }
        
        #modal3 .content {
            margin-top: 20px;
            padding: 0px 10px;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            height: 93.5%;
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
    	const modal3 = document.getElementById("modal3")
    	function modal3On() {
    	    modal3.style.display = "flex"
    	}
    	function ismodal3On() {
    	    return modal3.style.display === "flex"
    	}
    	function modal3Off() {
    	    modal3.style.display = "none"
    	}
    	const btnmodal3 = document.getElementById("help3")
    	btnmodal3.addEventListener("click", e => {
    	    modal3On()
    	})
    	const closeBtn = modal3.querySelector(".close-area")
    	closeBtn.addEventListener("click", e => {
    	    modal3Off()
    	})
    	window.addEventListener("keyup", e => {
    	    if(ismodal3On() && e.key === "Escape") {
    	        modal3Off()
    	    }
    	})
    })
    </script>
    
    <div id="container">
    </div>
    <div id="modal3" class="modal3-overlay">
        <div class="modal3-window">
            <div class="title">
                <h2>주요 기능</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
 			<img alt="" src="/resources/diary/helptext2.png" style="width: 700px;">
            </div>
        </div>
    </div>
    
    	<style>
        #modal2.modal2-overlay {
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
        #modal2 .modal2-window {
            background: var(--baby-pink);
            /* box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ); */
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 720px;
            height: 605px;
            position: relative;
            top: -50px;
            padding: 10px;
        }
        #modal2 .title {
            padding-left: 10px;
            display: inline;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            
        }
        #modal2 .title h2 {
            display: inline;
        }
        #modal2 .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
        }
        
        #modal2 .content {
            margin-top: 20px;
            padding: 0px 10px;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            height: 93.5%;
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
    	const modal2 = document.getElementById("modal2")
    	function modal2On() {
    	    modal2.style.display = "flex"
    	}
    	function ismodal2On() {
    	    return modal2.style.display === "flex"
    	}
    	function modal2Off() {
    	    modal2.style.display = "none"
    	}
    	const btnmodal2 = document.getElementById("help2")
    	btnmodal2.addEventListener("click", e => {
    	    modal2On()
    	})
    	const closeBtn = modal2.querySelector(".close-area")
    	closeBtn.addEventListener("click", e => {
    	    modal2Off()
    	})
    	window.addEventListener("keyup", e => {
    	    if(ismodal2On() && e.key === "Escape") {
    	        modal2Off()
    	    }
    	})
    })
    </script>
    
    <div id="container">
    </div>
    <div id="modal2" class="modal2-overlay">
        <div class="modal2-window">
            <div class="title">
                <h2>권리 권한</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
			<img alt="" src="/resources/diary/helptext3.png" style="width: 700px;">
            </div>
        </div>
    </div>
    
    	<style>
        #modal4.modal4-overlay {
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
        #modal4 .modal4-window {
            background: var(--baby-pink);
            /* box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 ); */
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 720px;
            height: 605px;
            position: relative;
            top: -50px;
            padding: 10px;
        }
        #modal4 .title {
            padding-left: 10px;
            display: inline;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            
        }
        #modal4 .title h2 {
            display: inline;
        }
        #modal4 .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
        }
        
        #modal4 .content {
            margin-top: 20px;
            padding: 0px 10px;
            /* text-shadow: 1px 1px 2px gray; */
            font-weight: 600;
            color: black;
            height: 93.5%;
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
    	const modal4 = document.getElementById("modal4")
    	function modal4On() {
    	    modal4.style.display = "flex"
    	}
    	function ismodal4On() {
    	    return modal4.style.display === "flex"
    	}
    	function modal4Off() {
    	    modal4.style.display = "none"
    	}
    	const btnmodal4 = document.getElementById("help1")
    	btnmodal4.addEventListener("click", e => {
    	    modal4On()
    	})
    	const closeBtn = modal4.querySelector(".close-area")
    	closeBtn.addEventListener("click", e => {
    	    modal4Off()
    	})
    	window.addEventListener("keyup", e => {
    	    if(ismodal4On() && e.key === "Escape") {
    	        modal4Off()
    	    }
    	})
    })
    </script>
    
    <div id="container">
    </div>
    <div id="modal4" class="modal4-overlay">
        <div class="modal4-window">
            <div class="title">
                <h2>게시판이란?</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">
			<img alt="" src="/resources/diary/helptext1.png" style="width: 700px;">
            </div>
        </div>
    </div>