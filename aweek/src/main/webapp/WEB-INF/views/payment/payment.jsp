<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../layout/mainHeader.jsp" flush="true" />
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- Noto Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- iamport-->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
	var price = 0;
    $('#one').click(function () {
    	price = $('input[name="cp_item"]:checked').val();
    	console.log(price,"click")
    	$(".quiz-text").text(price + " 원");
    })
    
    $('#two').click(function () {
        price = $('input[name="cp_item"]:checked').val();
    	console.log(price,"click")
    	$(".quiz-text").text(price + " 원");
    })
    
    $('#cssTest').hide();
    
    $('.payemntCacao').hover(function () {
    	$('#cssTest').show(300);
    })
    
    $('#paymentfree').hover(function () {
    	$('#cssTest').hide();
    }) 
}) 	



</script>

<style type="text/css">
body {
	font-family: 'NanumSquareNeo-Variable';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

p {
	line-height: 1.5;
}

#container {
	display: flex;
/* 	justify-content: center; */
	margin-left: 22%;
	margin-top: 40px;
	margin-bottom: 50px;
	gap: 300px;	
}

#maincontainer {
	justify-content: center;

}

#amountContainer {
	border: 1px solid #CCC;
	text-align: center;
	width: 58%;
    height: 6%;
    margin: auto;
    padding-top: 10px;
    padding-left: 5px;
    padding-right: 5px;
    
}

#freeContainer {
	border: 1px solid #CCC;
	text-align: center;
	width: 58%;
    height: 6%;
    margin: auto;
    padding-top: 10px;   
}

#charge_kakao {
	margin: auto;
}

#paymentfree {
	border: 1px solid #ccc;
	text-align: center;
	margin: auto;
	width: 150%;
	height: 550px;
	margin-top: 70px;
	border-radius: 10px;
}

#cssTest {
    border: 1px solid #ccc;
    background-color: #fde6e7;
    text-align: center;
    margin: auto;
    width: 198%;
    height: 340px;
    margin-top: 135px;
    margin-left: -202px;
    padding-left: 20px;
    border-radius: 10px;
}


.payemntCacao {
	border: 1px solid #ccc;
	text-align: center;
	margin: auto;
	width: 110%;
	height: 550px;
	margin-top: 70px;
	border-radius: 10px;
}

.payemntCacao:hover {
	width: 130%;
	height: 550px;
	background-color: #ccc;
	transition-duration: 0.8s;
	border: 2px solid #cb7070;
	font-weight: bold;
}

#paymentfree:hover {
	width: 170%;
	height: 550px;
	background-color: #ccc;
	transition-duration: 0.6s;
	border: 2px solid #cb7070;
	font-weight: bold;
}

.selectBox {
  position: relative;
  width: 240px;
  height: 35px;
  margin: auto;
  border-radius: 4px;
  border: 2px solid lightcoral;
}
.selectBox .select {
  width: 100%;
  height: 100%;
  text-align: center;
  font-size: smaller;
  font-weight: bold;
  outline: 0 none;
  padding: 5px;
  position: relative;
  z-index: 3; // select가 위로 올라와야 함
}
.selectBox .select option {
  background: lightcoral;
  color: #fff;
  padding: 3px 0;
  font-size: 16px;
}
.selectBox .icoArrow {
  position: absolute; 
  top: 0; 
  right: 0; 
  z-index: 1; 
  width: 35px; 
  height: inherit;
  border-left: 2px solid lightcoral;
  display: flex;
  justify-content: center;
  align-items: center;
}

.selectBox .icoArrow img {
  width: 50%;
  transition: .3s; // 부드럽게 회전
}

.selectBox .select:focus + .icoArrow img {
  transform: rotate(180deg);
}

.btn {
  width: 100px;
  padding: 10px;
  border: 1px solid var(--soft-black);
  background-color: var(--baby-pink);
  border-radius: 4px;
  color: var(--soft-black);
  font-size: 12px;
  font-weight: 700;
  text-align: center;
  cursor: pointer;
  box-sizing: border-box;
  display: block;
  transition: .4s;
}
.btn:hover {
  border: 1px solid var(--soft-black);
  background-color: var(--text-color);
  color: var(--soft-black);
}
.btn.btn--reverse {
  background-color: var(--text-color);
  color: var(--accent-color);
}
.btn.btn--reverse:hover {
  background-color: transparent;
  color: var(--text-color);
}
.btn.btn--brown {
  background-color: var(--accent-color);
  color: var(--text-color);
  border-color: var(--border-color);
}
.btn.btn--brown:hover {
  color: var(--accent-color);
  background-color: var(--text-color);
}
.btn.btn--pink {
  background-color: var(--accent-color);
  color: var(--text-color);
  border-color: var(--border-color);
}
.btn.btn--brown:hover {
  color: var(--accent-color);
  background-color: var(--text-color);
}
.btn.wide {
	width: 100%;
    margin: 10px 0;
    padding: 15px 0;
    height: 40px;
    font-size: 14px;
    display: flex;
    align-items: center;
    justify-content: center;
}

</style>
</head>
<body>


<div id=container>
	<div id=mainContainer>
	<div id=paymentfree>
		<p style="font-weight: bold; font-size: x-large; color: #f4b0b0; padding: 15px;">FREE</p>
		<p>개인/소모임 특화</p><br>
		<div id="freeContainer">
			<p style="font-weight: bold">FREE</p>	
		</div>
		<p style="color: #594B4B; margin-top: 30px">첨부파일 용량 : 50MB <br>최대 이용자 수 : 10명 <br></p><br>
		<hr style="width: 45%;"><br>
		<p style="color: #594B4B;">기본기능<br>캘린더<br>다이어리<br>채팅</p><br><br><br><br><br><br>
			<a href="/aweekHome"><button type="button" class="btn btn-lg btn-block  btn-custom" style="margin: auto;">가 입 하 기</button></a>
	</div>
	</div>
	
	<div id="mainContainer">
	<div class="payemntCacao">
		<p style="font-weight: bold; font-size: x-large; color: #f4b0b0; padding: 15px;">PREMIUM</p>
		<p>단체 모임에 특화</p><br>
		<div id="amountContainer">
			<p style="font-weight: bold"><span class="quiz-text">아래 상품을 선택하세요</span></p>	
		</div><br>

			<label class="box-radio-input"><input type="radio" name="cp_item" value="3000" id="one"><span>Premium 1달</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="25200" id="two"><span>Premium 12달</span></label><br><br>

			
		<div style="margin: auto; text-align: center;">	
		<div class="selectBox">
			<select name="payMethod" class="select" id="pay_select">
				<option disabled selected value="null">결제 방법 선택💰</option>
				<option value="kakaopay">카카오페이</option>
				<option value="html5_inicis.INIpayTest">KG이니시스(카드결제)</option>
				<option value="uplus.tvivarepublica2">토스페이</option>
				<option value="payco.PARTNERTEST">페이코</option>
			</select>
		</div>
		</div>
		<p style="color: #594B4B; margin-top: 30px">첨부파일 용량 : 10G <br>최대 이용자 수 : 100명 <br></p><br>
		<hr style="width: 45%;"><br>
		<p style="color: #594B4B;">Free 기본기능 ➕➕ <br> 첨부파일 용량 UP! <br> 최대 이용자 수 UP!</p><br><br>
			<button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">결 제 하 기</button>
	 </div>
	 </div>
	 
	<div id="mainContainer">
	<div id=cssTest style="text-align: left;">
		<p style="font-weight: bold; font-size: x-large; color: #f4b0b0; padding: 15px; text-align: center;">${member.userId}님 결제정보</p>
		<p>이름 : ${member.userName}</p><br>
		<p>아이디 : ${member.userId}</p><br>
		<p>핸드폰 : ${member.userPhone}</p><br>
		<p>주소 : ${member.userAddress}</p><br>
		<p>이메일 : ${member.userEmail}</p><br><br>
		<a href="/member/info"><button type="button" class="btn btn-lg btn-block  btn-custom" style="margin: auto;">수 정 하 기</button></a>
		
	</div>
 	</div>
 	
 </div>
 
 
 <script type="text/javascript">
     $('#charge_kakao').click(function () {
        var IMP = window.IMP;
        IMP.init('imp36337326');
        
        var price = $('input[name="cp_item"]:checked').val();
        var paySelect = $("#pay_select").val();
        var paymentAt = new Date();
        var now = new Date();
        var addMonth = new Date(now.setMonth(now.getMonth() + 1));
        var addYear = new Date(now.setMonth(now.getMonth() + 11));
        var expirationDate;
        var payResult = "Y";
        
        var productNo = 0;
        if(price == 5000) {
        	productNo = 1
        	expirationDate = addMonth
        } else if(price == 25200) {
        	productNo = 2
        	expirationDate = addYear
        }
        
        
        IMP.request_pay({
        	pg: paySelect,
        	pay_method : 'card',
            merchant_uid: 'aweek_' + new Date().getTime(),
            name: 'aweekPremium',
            amount: price,
            buyer_email: '${member.userEmail}',
            buyer_name: '${member.userName}',
            buyer_tel: '${member.userPhone}',
            buyer_addr: '${member.userAddress}',
        }, function (rsp) {
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '${member.userName}';
                msg += price + rsp.paid_amount;
                $.ajax({
                    type: "POST", 
                    url: "/payment/success",
                    data: {
                    	"payNo" : rsp.merchant_uid,
                        "userNo" : '${member.userNo}',
                        "productNo" : productNo,
                        "payMethod" : rsp.pay_method,
                        "price" : price,
                        "payAt" : paymentAt,
                        "payResult" : payResult,
                        "userName" : '${member.userName}',
                        "expirationDate" : expirationDate,
                    },
                });
                window.location.href = "/aweekHome";
            } else {
        		if(price == null) {
        			var msg = "상품을 선택하세요!"
        			alert(msg)
        			document.location.href="/payment/payment";
        		}else if(paySelect == null) {
        			var msg = "결제 방법을 선택하세요!"
        			alert(msg)
        			document.location.href="/payment/payment";
        		}

                var msg = '결제에 실패하였습니다!';
                msg += " : " + rsp.error_msg;
	            alert(msg);
	            document.location.href="/payment/fail";
            }   
            
        });
    });
</script> 

</body>
</html>