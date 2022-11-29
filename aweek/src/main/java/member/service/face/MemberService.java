package member.service.face;

import member.dto.Member;

public interface MemberService {

	/**
	 * 회원가입 처리
	 * 
	 * @param joinParam - 회원가입할 사용자 정보
	 */
	public void join(Member joinParam);
	
	/**
	 * 로그인 인증 처리
	 * ID&PW를 조회하여 행 COUNT를 이용하여 처리한다.
	 * 
	 * @param loginParam - 로그인에 사용할 ID&PW 정보
	 * @return 로그인 인증 결과
	 * 		true - 로그인 인증 성공
	 * 		false - 로그인 인증 실패
	 */
	public boolean login(Member loginParam);

	/**
	 * 전달된 id를 이용하여 사용자 정보 조회하기
	 * 
	 * @param loginid - 조회할 사용자의 id
	 * @return 조회된 사용자 정보
	 */
	public Member info(String loginid);

}
