<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- iamport-->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>

<style type="text/css">
#maincontainer {
	justify-content: center;

}


.payemntCacao {
	border: 1px solid #ccc;
	text-align: center;
	margin: auto;

}

</style>


<script>
    $('#charge_kakao').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('TC0ONETIME');
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


</head>
<body>

<div id="mainContainer">
 <div class="payemntCacao">
	<p style="font-weight: bold">카카오페이 현재 사용불가능</p>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>Premium 1달</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>Premium 1년</span></label>
		<label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>Premium 정기결제</span></label>
	<p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
		<button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>
 </div>
 </div>

</body>
</html>