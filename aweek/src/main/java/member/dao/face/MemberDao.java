package member.dao.face;

import member.dto.Member;

public interface MemberDao {
	
	/**
	 * 신규 회원 정보 삽입하기
	 * 
	 * @param joinParam - 신규 회원 가입 정보
	 */
	public void insert(Member joinParam);

	/**
	 * 로그인 ID&PW가 일치하는 행(사용자)의 수 구하기
	 * 
	 * @param loginParam - 로그인 정보
	 * @return 일치하는 행의 수
	 * 		0 - 존재하지 않는 회원
	 * 		1 - 존재하는 회원
	 */
	public int selectCntByIdPw(Member loginParam);

	/**
	 * 전달된 id의 사용자 정보를 조회한다.
	 * 
	 * @param loginid - 조회할 대상 id
	 * @return 조회된 회원 정보
	 */
	public Member selectLoginById(String loginid);
	
}
