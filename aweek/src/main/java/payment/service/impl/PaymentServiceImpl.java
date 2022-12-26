package payment.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dto.Member;
import payment.dao.face.PaymentDao;
import payment.dto.Payment;
import payment.dto.Product;
import payment.service.face.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	// 로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// DAO 객체
	@Autowired PaymentDao paymentDao;

	@Override
	public Member getLoginInfo(Member member) {
		member = paymentDao.selectLoginInfo(member);
		return member;
	}

	@Override
	public void save(Payment payment) {
		paymentDao.savePaymentInfo(payment);
	}

	@Override
	public Product getProductInfo(int amount) {
		return paymentDao.selectProductInfo(amount);
	}

	@Override
	public Payment getPaymentInfo(Payment paymentInfo) {
		return paymentDao.selectPaymentInfo(paymentInfo);
	}












	
	

}
