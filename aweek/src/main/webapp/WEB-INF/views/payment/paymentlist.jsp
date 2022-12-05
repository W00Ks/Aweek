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
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<script type="text/javascript">
IMP.init("imp37645307"); // 가맹점 식별 코드



</script>


</head>
<body>

<button onclick="requestPay()">결제하기</button>

<!-- <script>
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaoPay",
          pay_method: "Payment - paymentMethod",
          merchant_uid: "Payment - payno",
          name: "Preminum 1M",
          amount: "Product - price",
          buyer_email: "Member - email",
          buyer_name: "Member - userName",
          buyer_tel: "Member - Phone",
          buyer_addr: "Member - userAddress",
          buyer_postcode: "01181 - none"
      }, function (rsp) { // callback
          if (rsp.success) {
              ...,
              // 결제 성공 시 로직,
              ...
          } else {
              ...,
              // 결제 실패 시 로직,
              ...
          }
      });
    }
  </script>
  
  
  <script type="text/javascript">
  IMP.request_pay({
      /* ...중략... */
    }, function (rsp) { // callback
      if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        // jQuery로 HTTP 요청
        jQuery.ajax({
            url: "https://localhost:8888/payment/complete",
            method: "POST",
            headers: { "Content-Type": "application/json" },
            data: {
                orderNo: rsp.orderNo, // 결제 번호
                payNo: rsp.payNo // 주문 번호
            }
        }).done(function (data) {
          // 가맹점 서버 결제 API 성공시 로직
        })
      } else {
        alert("결제에 실패하였습니다. : " +  rsp.error_msg);
      }
    });
  </script> -->


</body>
</html>