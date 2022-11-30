package payment.controller;

import java.util.List;

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
	
	@RequestMapping("/payment/list")
	public void paymentList(Model model) {
		logger.info("/payment/list");
		
		// 결제 정보 조회
		List<Payment> paymentList = paymentService.list();
		
		// 모델값 전달
		model.addAttribute("paymentList", paymentList);
		
		
		
	}

}
