package member.dao.face;

import member.dto.Member;

public interface MemberDao {
	
	/**
	 * 회원 id가 존재하는 값인지 확인한다
	 * 	-> 중복된 id인지 확인
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 존재 여부 (0-없음, 1-있음)
	 */
	public int selectCntById(Member member);
	
	/**
	 * 신규 회원 정보 삽입하기
	 * 
	 * @param joinParam - 신규 회원 가입 정보
	 */
	public void insert(Member joinParam);

	/**
	 * id/pw 가 일치하는 사용자 수를 반환한다
	 * 	-> 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id/pw 정보
	 * @return 조회된 행 수
	 */
	public int selectCntMember(Member member);

	/**
	 * 전달된 id의 사용자 정보를 조회한다.
	 * 
	 * @param loginid - 조회할 대상 id
	 * @return 조회된 회원 정보
	 */
	public Member selectLoginById(String loginid);
	
}
