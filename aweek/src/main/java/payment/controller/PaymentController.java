package payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
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
		
		Payment payment = new Payment();
		int userNo = (Integer) session.getAttribute("userNo");
		payment.setUserNo(userNo);
		
		
		List<Payment> paymentList = paymentService.getPaymentInfoAll(payment);
		for(Payment p : paymentList)	logger.debug("{}", p);
		
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);
		member = paymentService.getLoginInfo(member);
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("member", member);
		
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
			,String payResult, Date payAt, String userName, Date expirationDate, HttpSession session) {
		logger.info("paymentSeccess");
		
		String userId = (String) session.getAttribute("userId");
					
		Payment payment = new Payment();
		payment.setPayNo(payNo);
		payment.setUserNo(userNo);
		payment.setProductNo(productNo);
		payment.setPaymentMethod(payMethod);
		payment.setPaymentAmount(price);
		payment.setResultStatus(payResult);
		payment.setPaymentDate(payAt);		
		payment.setExpirationDate(expirationDate);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(payAt);
		cal.add(cal.DATE, +30);
		
		long dDay = cal.getTimeInMillis();
		long now = System.currentTimeMillis();
		long result = dDay - now;
		long subDDay = (result / 1000 / 60 / 60 / 24) + 1;
		payment.setDuration((int) subDDay);
		
		// 결제를 했는지 검증		
		session.setAttribute("payment", userId);
		logger.info("payemnt success{}", userId);
		
		paymentService.save(payment);
		
	}
	
	@RequestMapping("/payment/fail")
	public String paymentfail() {
		logger.info("paymentFail");
		return "redirect:/payment/payment";
	}


}
