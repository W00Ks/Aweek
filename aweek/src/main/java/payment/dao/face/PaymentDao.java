package payment.dao.face;

import java.util.List;

import payment.dto.Payment;

public interface PaymentDao {

	/**
	 * 결제 정보 조회
	 * 
	 * @return 조회된 결제 정보
	 */
	public List<Payment> selectAll();

}
