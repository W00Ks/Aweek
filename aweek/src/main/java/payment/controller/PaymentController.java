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
import payment.dto.Product;
import payment.service.face.PaymentService;


@Controller
public class PaymentController {
	
	// 로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 서비스 객체
	@Autowired private PaymentService paymentService;
	
	@RequestMapping("/payment/paymentlist")
	public String myPaymentInfo(HttpSession session, Model model) {
		
		Payment payment = new Payment();
		int userNo = (Integer) session.getAttribute("userNo");
		payment.setUserNo(userNo);
				
		List<Payment> paymentList = paymentService.getPaymentInfoAll(payment);
		for(Payment p : paymentList)	logger.debug("list : {}", p);
		
		
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);
		member = paymentService.getLoginInfo(member);
		
		logger.info("list payment {} : ", paymentList);
		
		// 결제만료일자 받아오기
		Date exDate = paymentService.getExDate(member);
		logger.info("만료일자 {}", exDate);
		
		if(exDate != null) {
			// 사용기간 설정
			Calendar cal = Calendar.getInstance();
			cal.setTime(exDate);
			
			long dDay = cal.getTimeInMillis();
			long now = System.currentTimeMillis();
			long result = dDay - now;
			long durationDay = result / 1000 / 60 / 60 / 24;
			int durationSet = (int) durationDay;
			logger.info("사용기간 {}", durationSet);
			

			model.addAttribute("durationSet", durationSet);
		}
		
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("member", member);
		
		return "/payment/paymentlist";
	}
	
	
	
	@RequestMapping("/payment/paymentchek")
	public String paymentCheck(HttpSession session) {
		
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);
		member = paymentService.getLoginInfo(member);
		

		// 사용기간이 0일때 결과상태 'N'으로 변경
		paymentService.getDurationChek(member);
		
		// 결제상태로 유효성 검사
		Payment payChek = paymentService.getStatusChek(member);
		logger.info("/payment/paymentChek/getStatusChek {}", payChek);
		
		
		if(payChek == null) {
			return "redirect:/payment/payment";
		} else {
			logger.debug("결제 불필요 남은 기간 {}", payChek.getDuration());
			if(payChek.getDuration() <= 0) {
				return "redirect:/payment/payment";
			}			
			return "redirect:/payment/paychek";
		}
	}
	
	@RequestMapping("/payment/paychek")
	public void paychekError(HttpServletResponse response, HttpSession session, Model model) {
		
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);
		member = paymentService.getLoginInfo(member);
		
		// 결제만료일자 받아오기
		Date exDate = paymentService.getExDate(member);
		logger.info("만료일자 {}", exDate);
		
		if(exDate != null) {
			// 사용기간 설정
			Calendar cal = Calendar.getInstance();
			cal.setTime(exDate);
			
			long dDay = cal.getTimeInMillis();
			long now = System.currentTimeMillis();
			long result = dDay - now;
			long durationDay = result / 1000 / 60 / 60 / 24;
			int durationSet = (int) durationDay;
			logger.info("사용기간 {}", durationSet);
			

			model.addAttribute("durationSet", durationSet);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				//SweetAlert
				out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css'>"
						+ "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js'></script>"
						+ "<script type='text/javascript' src='https://code.jquery.com/jquery-2.2.4.min.js'></script>");
				out.println("<script>$(document).ready(function(){swal('아직 사용 기간이 " + durationSet + "일 남아 있습니다', 'PREMIUM을 사용하실 수 있습니다', 'warning').then(function(){"
						+ "		location.href=\"/aweekHome\";"
						+ "     })"
						+ "});"
						+ "</script>");
				
				//기본 Alert
//				out.println("<script>$(document).ready(function(){alert('로그인이 필요합니다!'); window.location='/member/login';})</script>");
				out.flush(); 
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	@RequestMapping("/payment/payment")
	public void paymentSelect(HttpSession session, Model model) {
		logger.info("/payment/payment");

		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);
		member = paymentService.getLoginInfo(member);
		
		Payment payChek = paymentService.getStatusChek(member);
		logger.info("getStatusChek {}", payChek);
		
	
		
		
		model.addAttribute("member", member);
		
//		logger.info("/payment/payment");
//
//		Member member = new Member();
//		String userId = (String) session.getAttribute("userId");
//		member.setUserId(userId);
//		member = paymentService.getLoginInfo(member);
//		
//				
//		model.addAttribute("member", member);	
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
		cal.setTime(expirationDate);
		
		
		long dDay = cal.getTimeInMillis();
		long now = System.currentTimeMillis();
		long result = dDay - now;
		long durationDay = result / 1000 / 60 / 60 / 24 + 1;
		payment.setDuration((int) durationDay);
		
		// 결제를 했는지 검증		
		session.setAttribute("paymentSuccess", userId);
		
		paymentService.save(payment);		
	}
	
	
	
	@RequestMapping("/payment/fail")
	public String paymentfail() {
		logger.info("paymentFail");
		return "redirect:/payment/payment";
	}
}
