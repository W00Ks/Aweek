package payment.dao.face;

import java.util.List;

import member.dto.Member;
import payment.dto.Payment;

public interface PaymentDao {

	/**
	 * 전달된 id의 사용자 정보를 조회
	 * 
	 * @param userid - 조회할 id
	 * @return 조회된 회원 정보
	 */
	Member selectPaymentInfoById(String userid);





}
