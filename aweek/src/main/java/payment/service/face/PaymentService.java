package payment.service.face;

import java.util.List;

import member.dto.Member;
import payment.dto.Payment;

public interface PaymentService {

	/**
	 * 전달될 userid를 이용해 사용자 정보 조회
	 * 
	 * @param userid - 정보를 조회할 userid
	 * @return 조회된 사용자 정보
	 */
	public Member paymentInfo(String userid);

	public void chargePoint(Payment payment, String id);



}
