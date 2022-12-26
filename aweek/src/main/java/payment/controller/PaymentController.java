package payment.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import member.dto.Member;
import payment.dto.Payment;
import payment.service.face.PaymentService;


@Controller
public class PaymentController {
	
	// 로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 서비스 객체
	@Autowired private PaymentService paymentService;
	
	@RequestMapping("/payment/paymentlist")
	public String myPaymentInfo(Payment paymentInfo, HttpSession session, Model model) {
		logger.debug("{}", paymentInfo);
		
		// 로그인 정보
		int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
		
		// 회원의 정보가 아닐때 처리
		if( paymentInfo.getUserNo( ) == userNo ) {
			return "redirect:/payment/payment";
		}
		
		paymentInfo = paymentService.getPaymentInfo(paymentInfo);
		logger.debug("조회된 결제 정보 {}", paymentInfo);
		
		model.addAttribute("paymentInfo", paymentInfo);
		
		return "/payment/paymentlist";
	}
	
	@RequestMapping("/payment/payment")
	public void paymentSelect(HttpSession session, Model model) {
		logger.info("/payment/payment");

		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);
		member = paymentService.getLoginInfo(member);
		
		
		model.addAttribute("member", member);	
		
	}
	

	@PostMapping("/payment/success")
	public void paymentSuccess(String payNo, int userNo, int productNo, String payMethod, int price
			,String payResult, Date payAt, String userName, HttpSession session) {
		logger.info("paymentSeccess");
		
		String userId = (String) session.getAttribute("userId");
					
		Payment payment = new Payment();
		payment.setPayNo(payNo);
		payment.setUserNo(userNo);
		payment.setProductNo(productNo);
		payment.setPaymentMethod(payMethod);
		payment.setPaymentAmount(price);
		payment.setResultstatus(payResult);
		payment.setPaymentDate(payAt);

		paymentService.save(payment);
		logger.info("payment - {}",payment);
		
		// 결제를 했는지 검증		
//		session.setAttribute("payment", userId);
//		logger.info("payemnt success");
		
	}
	
	@RequestMapping("/payment/fail")
	public String paymentfail() {
		logger.info("paymentFail");
		return "redirect:/payment/payment";
	}


}
