package payment.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dto.Member;
import payment.dao.face.PaymentDao;
import payment.dto.Payment;
import payment.service.face.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	// 로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// DAO 객체
	@Autowired PaymentDao paymentDao;

	@Override
	public Payment info(String loginid) {
		logger.info("info( - {}", loginid);
		return paymentDao.selectLoginByid(loginid);
	}






	
	

}
