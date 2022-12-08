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

<script>
$(document).ready(() => {

	$("#check_module").click(() => {
		$(function(){
	    	//@@@@@@ 1번 @@@@@@@
	        var IMP = window.IMP;
	        IMP.init('imp37645307'); //가맹점 식별코드 삽입
	        
	        var msg;
	        
	        
			//@@@@@@ 3번 @@@@@@@
	            IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : 'vivipayment',
	            amount : "10", 
	            	// getParam("price"),
	            buyer_email : "limjw1987@naver,com",
	            buyer_name : "Apple",
	            buyer_tel : "01012345678",
	            buyer_addr : "서울 서초구 방배동",
	            buyer_postcode : '123-456',
	           // m_redirect_url : '결제 완료후 이동할 페이지'
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payment/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    contentType: 'application/json',
	                    data: JSON.stringify({
	                        uid : rsp.imp_uid,
	                        price: rsp.paid_amount
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    })
	                }).done(function(data) {
	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\n결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;

	                        alert(msg);
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                //성공시 이동할 페이지
	                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="<%=request.getContextPath()%>/order/payFail";
	                alert(msg);
	            }
	        });
		
	})
   
});
})
</script>


</head>
<body>


 <p>아임 서포트 결제 모듈 테스트 해보기</p>
    <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button>

</body>
</html>