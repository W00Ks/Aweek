<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
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
        #modal2 .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal2 .title h2 {
            display: inline;
        }
        #modal2 .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal2 .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
    </style>
    
    <script type="text/javascript">
    window.addEventListener('load', function() {
    	const loremIpsum = document.getElementById("lorem-ipsum")
    	fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
    	    .then(response => response.text())
    	    .then(result => loremIpsum.innerHTML = result)
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
    	const btnmodal2 = document.getElementById("btn-room")
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
<!--         <h2>Lorem Ipsum</h2>
        <button id="btn-modal2">모달 창 열기 버튼</button>
        <div id="lorem-ipsum"></div> -->
    </div>
    <div id="modal2" class="modal2-overlay">
        <div class="modal2-window">
            <div class="title">
                <h2>모임 선택</h2>
            </div>
            <div class="close-area">X</div>
            <div class="content">

            </div>
        </div>
    </div>
    