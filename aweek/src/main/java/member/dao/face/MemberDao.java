package member.dao.face;

import member.dto.Member;

public interface MemberDao {

	//아이디 중복 검사
	/**
	 * id가 일치하는 사용자 수 반환  
	 * 
	 * @param member - 조회할 ID 정보 객체
	 * @return 조회된 행 수
	 */
	public int selectIdChk(Member member);
	
	//회원가입
	/**
	 * 신규 회원 정보 삽입하기
	 * 
	 * @param joinParam - 신규 회원 가입 정보
	 */
	public void insert(Member joinParam);
	
	//로그인
	/**
	 * id/pw 가 일치하는 사용자 수를 반환한다
	 * 	-> 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id/pw 정보
	 * @return int - 조회된 행 수
	 */
	public int selectCntMember(Member member);
	
	/**
	 * 로그인 한 회원의 정보 반환 
	 * 
	 * @param member - 조회할 id/pw 정보
	 * @return Member - 로그인한 회원 정보
	 */
	public Member selectLoginInfo(Member member);
	
	//카카오 로그인
	/**
	 * id 가 일치하는 사용자 수를 반환한다
	 * 	-> 카카오 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id 정보
	 * @return int - 조회된 행 수
	 */
	public int selectCntKakaoMember(Member member);
	
	//아이디 찾기
	/**
	 * 아이디 찾기로 전달된 회원 수 반환
	 * 
	 * @param member - 유저의 이름, 이메일 주소
	 * @return int - 조회된 회원 수
	 */
	public int selectCntFindIdMember(Member member);
	
	//아이디 찾기 결과
	/**
	 * 아이디 찾기 결과용 회원 ID정보 조회
	 * 
	 * @param member - 유전의 이름, 이메일 주소
	 * @return String - 조회된 회원의 ID
	 */
	public String selectEmailByUserId(Member member);
	
	//비밀번호 찾기
	/**
	 * 비밀번호 찾기로 전달된 회원 수 반환
	 * 
	 * @param member - 유저의 이름, 아이디, 휴대폰 번호
	 * @return int - 조회된 회원 수
	 */
	public int selectCntFindPwMember(Member member);

	/**
	 * 비밀번호 변경 처리
	 * 
	 * @param member - 회원의 ID, PW
	 */
	public void updatePw(Member member);



	
}
