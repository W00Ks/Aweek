package payment.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import payment.dto.Payment;
import payment.service.face.PaymentService;


@Controller
public class PaymentController {
	
	// 로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 서비스 객체
	@Autowired private PaymentService paymentService;
	
	@RequestMapping("/payment/paymentlist")
	public void paymetList(HttpSession session, Model model) {
		logger.info("/payment/paymentList");
		
		String loginid = (String) session.getAttribute("loginid");
		logger.info("loginid {} : ", loginid);
		
		Payment info = paymentService.info(loginid);
		logger.info("PaymnetInfo {} : ", info);
		
		model.addAttribute("info", info);
	}
	
	@RequestMapping("/payment/payment")
	public void paymentSelect() {
//		logger.info("/payment/point : {}", amount);
//		
//		String id = paymentService.getIdFromAuth();
//		
//		paymentService.chargePoint(new Payment(amount), id);
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
