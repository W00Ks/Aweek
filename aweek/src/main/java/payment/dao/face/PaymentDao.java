package payment.dao.face;

import java.util.List;

import member.dto.Member;
import payment.dto.Payment;
import payment.dto.Product;

public interface PaymentDao {

	
	/**
	 * 로그인 한 회원 정보 반환
	 * 
	 * @param member - 조회할 ID/PW 정보
	 * @return - 로그인한 회원 정보
	 */
	public Member selectLoginInfo(Member member);

	/**
	 * 결제 정보 조회
	 * 
	 * @param member - 회원 정보 파라미터
	 * @return - 결제 정보 객체
	 */
	public Payment selectPaymentInfo(Member member);

	/**
	 * 결제 정보 저장
	 * 
	 * @param payment - 결제 정보 저장 객체
	 */
	public void savePaymentInfo(Payment payment);

	/**
	 * 상품 정보 조회
	 * 
	 * @param amount - 조회할 상품의 가격
	 * @return - 조회한 상품 정보
	 */
	public Product selectProductInfo(int amount);

	/**
	 * 회원번호를 이용하여 게시글을 조회
	 * 
	 * @param paymentInfo - 조회하려는 회원 번호
	 * @return 조회된 결제 정보
	 */
	public Payment selectPaymentInfo(Payment payment);

	/**
	 * 전체 결제 정보 조회
	 * 
	 * @param payment - 결제 정보 조회 객체
	 * @return - 결제 정보 조회 객체
	 */
	public List<Payment> selectPayList(Payment payment);


















}
