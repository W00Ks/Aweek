package member.dao.face;

import member.dto.Member;

public interface MemberDao {
	
	/**
	 * id가 일치하는 사용자 수 반환  
	 * 
	 * @param member - 조회할 ID 정보 객체
	 * @return 조회된 행 수
	 */
	public int selectIdChk(Member member);
	
	/**
	 * 신규 회원 정보 삽입하기
	 * 
	 * @param joinParam - 신규 회원 가입 정보
	 */
	public void insert(Member joinParam);
	
	/**
	 * 비밀번호 찾기로 전달된 회원 수 반환
	 * 
	 * @param member - 유저의 이름, 아이디, 휴대폰 번호
	 * @return 조회된 회원 수
	 */
	public int selectCntFindPwMember(Member member);

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
//	public Member selectLoginById(String loginid);
	
}
