<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="../layout/roomHeader.jsp" flush="true" />
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

<style type="text/css">
p {
	line-height: 1.5;
}

#container {
	display: flex;
	justify-content: center;
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
    height: 8%;
    margin: auto;
    padding-top: 13px
}

#charge_kakao {
	margin: auto;
}

#paymentfree {
	border: 1px solid #ccc;
	text-align: center;
	margin: auto;
	width: 140%;
	height: 490px;
	margin-top: 70px;
	border-radius: 10px;
}

.payemntCacao {
	border: 1px solid #ccc;
	text-align: center;
	margin: auto;
	width: 110%;
	height: 490px;
	margin-top: 70px;
	border-radius: 10px;
}

.payemntCacao:hover {
	background-color: #ccc;
	transition-duration: 1s;
	border: 3px solid #cb7070;
}

#paymentfree:hover {
	background-color: #ccc;
	transition-duration: 1s;
	border: 2px solid #cb7070;
}

</style>
</head>
<body>

<h1>결제하기</h1>
<hr>

<div id=container>
	<div id=mainContainer>
	<div id=paymentfree>
		<p style="font-weight: bold; font-size: x-large; color: #f4b0b0; padding: 15px;">FREE</p>
		<p>개인/소모임 특화</p><br>
		<div id="amountContainer">
			<p style="font-weight: bold">FREE</p>	
		</div>
		<p style="color: #594B4B; margin-top: 30px">공용용량 : 10G <br>최대 이용자 수 : 10명 <br></p><br>
		<hr style="width: 45%;"><br>
		<p style="color: #594B4B;">기본기능<br>캘린더<br>다이어리<br>채팅</p><br><br>
			<a href="/aweek/member/join"><button type="button" class="btn btn-lg btn-block  btn-custom" style="margin: auto;">가 입 하 기</button></a>
	</div>
	</div>
	
	<div id="mainContainer">
	<div class="payemntCacao">
		<p style="font-weight: bold; font-size: x-large; color: #f4b0b0; padding: 15px;">PREMIUM</p>
		<p>단체 모임에 특화</p><br>
		<div id="amountContainer">
			<p style="font-weight: bold">3000 원</p>	
		</div><br>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>Premium 1달</span></label>
			<label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>Premium 정기결제</span></label>
			
		<p style="color: #594B4B; margin-top: 30px">공용용량 : 100G <br>최대 이용자 수 : 100명 <br></p><br>
		<hr style="width: 45%;"><br>
		<p style="color: #594B4B;">Free 기본기능 + <br> 공용 용량 UP! <br> 최대 이용자 수 UP!</p><br><br>
			<button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">구 독 하 기</button>
	 </div>
	 </div>
 </div>
 
 <script>
    $('#charge_kakao').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp37645307');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'kakao',
            merchant_uid: 'merchant_' + new Date().getTime(),

            name: '주문명 : 주문명 설정',
            amount: money,
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "GET", 
                    url: "/user/mypage/charge/point", //충전 금액값을 보낼 url 설정
                    data: {
                        "amount" : money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            document.location.href="/user/mypage/home"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>

</body>
</html>