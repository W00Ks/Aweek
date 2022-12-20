package payment.dao.face;

import java.util.List;

import member.dto.Member;
import payment.dto.Payment;

public interface PaymentDao {

	/**
	 * 전달된 id의 결제 정보 조회
	 * 
	 * @param loginid -= 조회할 대상 id
	 * @return 조회된 회원 결제 정보
	 */
	Payment selectLoginByid(String loginid);









}
