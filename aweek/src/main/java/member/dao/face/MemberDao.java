package member.dao.face;

import java.util.HashMap;
import java.util.List;

import cs.dto.Inquiry;
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

	/**
	 * 회원정보 수정
	 * 
	 * @param member - 유저 정보 파라미터(ID, 이름, 휴대폰 번호, 주소, 이메일, 생년월일)
	 */
	public void updateUserModify(Member member);

	/**
	 * 휴대폰 번호 변경 처리
	 * 
	 * @param member - 유저의 ID, Phone
	 */
	public void updatePhone(Member member);

	/**
	 * 탈퇴 회원 정보 탈퇴 회원 DB에 삽입
	 * 
	 * @param member - 유저 정보 파라미터(NO, ID, PW, 이름, 휴대폰 번호, 주소, 생년월일, 이메일, 가입날짜)
	 */
	public void insertWdUser(Member member);

	/**
	 * 탈퇴 회원 정보 삭제
	 * 
	 * @param member - 유저 정보 파라미터(NO, ID, PW, 이름, 휴대폰 번호, 주소, 생년월일, 이메일, 가입날짜)
	 */
	public void deleteUser(Member member);

	/**
	 * 나의 1:1 문의 전체 게시글 수를 조회한다
	 * 
	 * @param member - 회원 정보 
	 * @return 나의 1:1 문의 총 게시글 수
	 */
	public int selectPagingCntAll(Member member);
	
	/**
	 * 페이징을 적용하여 나의 1:1 문의글 목록 조회
	 * 
	 * @param map - 페이징 정보 객체, 회원 정보 객체
	 * @return 페이징이 적용된 나의 1:1 문의글 목록
	 */
	public List<Inquiry> selectMyInquiryList(HashMap<String, Object> map);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewInquiry - 조회하려는 나의 1:1문의글 번호
	 * @return 조회된 나의 1:1 문의글 정보
	 */
	public Inquiry selectMyInquiryView(Inquiry viewInquiry);

	
}
