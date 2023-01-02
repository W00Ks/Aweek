package payment.service.face;

import java.util.Date;
import java.util.List;

import common.Paging;
import member.dto.Member;
import payment.dto.Payment;
import payment.dto.Product;

public interface PaymentService {

	/**
	 * 로그인 유저 정보
	 * 
	 * @param member - 입력한 ID/PW 정보
	 * @return - 로그인 한 회원 정보
	 */
	public Member getLoginInfo(Member member);

	/**
	 * 결제 정보 저장
	 * 
	 * @param payment - 결제 정보 저장 객체
	 */
	public void save(Payment payment);

	/**
	 * 상품 정보 조회
	 * 
	 * @param amount - 조회할 상품의 가격
	 * @return - 조회된 상품 목록
	 */
	public Product getProductInfo(int amount);

	/**
	 * 결제 정보 조회
	 * 
	 * @param payment - 조회할 회원 번호 객체
	 * @return - 조회된 결제 정보 객체
	 */
	public Payment getPaymentInfo(Payment payment);
	

	/**
	 * 결제 정보 목록
	 * 
	 * @param payment - 조회할 회원 번호 객체
	 * @return - 조회된 결제 정보 목록
	 */
	public List<Payment> getPaymentInfoAll(Payment payment);

	/**
	 * 결제 상태 정보 조회
	 * 
	 * @param member - 회원 정보 파라미터
	 * @return - 결제 상태 정보
	 */
	public Payment getStatusChek(Member member);

	/**
	 * 결제 상태 정보 변경
	 * 
	 * @param member - 회원 정보 파라미터
	 * @return - 결제 정보 변경
	 */
	public void getDurationChek(Member member);

	/**
	 * 결제만료 일자 조회
	 * 
	 * @param member - 회원정보 파라미터
	 * @return - 결제만료일자 정보
	 */
	public Date getExDate(Member member);







}
