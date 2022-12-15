package payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.dto.Member;
import payment.dto.Payment;
import payment.service.face.PaymentService;


@Controller
public class PaymentController {
	
	// 로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 서비스 객체
	@Autowired private PaymentService paymentService;
	

	@RequestMapping("/payment/payment")
	public void paymentMain(HttpSession session, Model model) {
		logger.info("/payment/payment");
		
		String userid = (String) session.getAttribute("userid");
		logger.info("userid : {}", userid);
		
		Member paymentInfo = paymentService.paymentInfo(userid);
		logger.info("userid result : {}", paymentInfo);
		
		model.addAttribute("paymentInfo", paymentInfo);
	}
	
//	@RequestMapping("/payment/point")
//	public @ResponseBody void chargePoint(Long amount) {
//		logger.info("/payment/point : {}", amount);
//		
//		String id = paymentService.getIdFromAuth();
//		
//		paymentService.chargePoint(new Payment(amount), id);
//		
//		
//	}

}
