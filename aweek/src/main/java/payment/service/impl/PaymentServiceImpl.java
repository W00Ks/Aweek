package payment.service.impl;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.Paging;
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
	public Payment getPaymentInfo(Payment payment) {
		return paymentDao.selectPaymentInfo(payment);
	}


	@Override
	public List<Payment> getPaymentInfoAll(Payment payment) {
		return paymentDao.selectPayList(payment);
	}

	@Override
	public Payment getStatusChek(Member member) {
		return paymentDao.selectPayChek(member);
	}

	@Override
	public void getDurationChek(Member member) {
		paymentDao.updateStatus(member);
	}

	@Override
	public Date getExDate(Member member) {
		return paymentDao.selectExDate(member);
	}














	
	

}
