<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./header.jsp" flush="true" />

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 스마트 에디터2 설치 -->
<script type="text/javascript" src="/resources/diary/se2/js/service/HuskyEZCreator.js"></script>

<style type="text/css">
#header, #footer {
	text-align: center;
	background: #f6f;
}
#header h1 a {
	text-decoration: none;
	color: #333;
}
table {
	border-collapse: separate;
  	border-spacing: 0 10px;
}
th, td {
	text-align: left;
	font-weight: 600;
}
.info {
	width: 160px;
}
/* td:nth-child(2) {
	text-align: justify;
} */
.selectdiaryCateNo:hover {
	background-color: #EFEBF0;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼
	$("#btnWrite").click(function() {
		
		if($(".cateresult").text() == "없음"){
			alert("카테고리를 선택해주세요.");
			return false;
		}
		
		if($("#title").val() == ""){
			alert("제목을 입력해주세요.");
			return false;
		}
		
		if(!$('input:radio[name=publicresult]').is(':checked')){
			alert("공개 여부를 선택해주세요.");
			return false;
		}
		
		//작성된 내용을 <textarea>에 적용하기
		updateContents()

		$("form").submit();
	})
	
	//취소버튼
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
	$(".catebutton").click(function() {
		
		var listVar = $('input[name=diaryCateNo]:checked').val();
		console.log(listVar);
		
		$.ajax({
			type: "get"
			, url: "./selectcate"
			, data: {
				n1 : listVar
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".cateresult").html( res )
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
		
		$.ajax({
			type: "get"
			, url: "./selectcate2"
			, data: {
				n1 : listVar
			}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$(".diaryCateNo2").attr("value", res );
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})		
		
		modal2Off();
		
	})
	
})

function modal2Off() {
    	    modal2.style.display = "none"
}

function updateContents() {
	
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
	
}

</script>

<br><br><br><br>
<div style="font-weight: 600; font-size: 1.1em;">글쓰기</div>
<br>
<hr>

<div class="container">

	<form action="./write" method="post" enctype="multipart/form-data">
	<input type="text" value="${roomInfo.roomNo }" name="writeroomNo" style="display: none;">
	<input type="text" value="ef" name="diaryCateNo2" class="diaryCateNo2" style="display: none;">
	<table class="table table-bordered" style="width: 100%">
	<tr><td class="info">모임</td><td><span style="font-weight: 500;">${roomInfo.roomName }</span></td></tr>
	<tr><td class="info">카테고리</td><td><input type="button" value="카테고리 선택" id="btn-cate"><span style="font-weight: 500;">&nbsp;선택한 게시판 : </span><span class="cateresult" style="font-weight: 500;">없음</span></td></tr>
	<tr><td class="info">제목</td><td><input type="text" id="title" name="title" placeholder="제목을 입력하세요" style="width:99.2%; height: 20px;"></td></tr>
	<tr><td colspan="3"><textarea id="content" name="content" style="width: 100%; height:400px;"></textarea></td></tr>
	</table>
	
	<div style="float: right;">
	공개<input type='radio' name='publicresult' value='1' />
	비공개<input type='radio' name='publicresult' value='0' />
	</div>
	
	<br>
	첨부파일<br><br>
	<input type="file" name="file">
	
	</form>
	
	<div class="text-center" style="display: flex; float: right;">
		<button id="btnWrite" class="btn btn-primary" style="margin-right: 5px;">작성</button>
		<button id="btnCancel" class="btn btn-danger" style="margin-left: 5px;">취소</button>
	</div>
	
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기
		sSkinURI: "/resources/diary/se2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	})
	</script>

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
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 310px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal2 .title {
            padding-left: 10px;
            display: inline;
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
            font-weight: 600;
            color: black;
        }
        
        #modal2 .content {
            margin-top: 20px;
            padding: 0px 10px;
            font-weight: 600;
            color: black;
            height: 76%;
            background-color: white;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
    </style>
    
    <script type="text/javascript">
    window.addEventListener('load', function() {
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
    	const btnmodal2 = document.getElementById("btn-cate")
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
            <h2>카테고리 선택</h2>
            </div>
            <div class="close-area" style="display: none;">X</div>
			<div class="content">
				<ul>
					<c:forEach items="${categoryList }" var="data">
						<label for='select${data.diaryCateNo }'><div style="width: 100%; cursor: pointer; margin-top: 5px; margin-bottom: 5px;" class="selectdiaryCateNo"><input type='radio' name='diaryCateNo' id='select${data.diaryCateNo }' value='${data.diaryCateNo }' />&nbsp;${data.diaryCateName }</div></label>
					</c:forEach>
				</ul>
            </div>
            <br>
            <input type="button" class="catebutton" value="확인" style="float: right; width: 60px; height: 30px; margin-top: -7px;">
        </div>
    </div>

<jsp:include page="./footer.jsp" flush="true" />