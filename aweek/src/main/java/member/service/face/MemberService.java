package member.service.face;

import member.dto.Member;

public interface MemberService {

	/**
	 * 신규 회원 가입
	 * 
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Member member);
	
	/**
	 * 로그인 인증 처리
	 * 	
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 경과
	 */
	public boolean login(Member member);

	/**
	 * 전달된 id를 이용하여 사용자 정보 조회하기
	 * 
	 * @param loginid - 조회할 사용자의 id
	 * @return 조회된 사용자 정보
	 */
	public Member info(String loginid);

}
