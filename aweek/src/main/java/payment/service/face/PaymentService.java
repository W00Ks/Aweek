package payment.service.face;

import java.util.List;

import payment.dto.Payment;

public interface PaymentService {

	/**
	 * 결제 정보 목록 조회
	 * 
	 * @return 조회된 결제 정보 목록
	 */
	public List<Payment> list();

}
