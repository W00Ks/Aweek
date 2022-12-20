package payment.service.face;

import java.util.List;

import member.dto.Member;
import payment.dto.Payment;

public interface PaymentService {

	/**
	 * 전달된 id를 이용해서 결제 정보 조회
	 * 
	 * @param loginid - 결제 정보를 조회할 사용자 id
	 * @return 조회된 사용자 결제 정보
	 */
	Payment info(String loginid);







}
