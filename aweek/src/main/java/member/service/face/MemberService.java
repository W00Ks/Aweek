package member.service.face;

import javax.mail.MessagingException;

import member.dto.Member;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public interface MemberService {

	/**
	 * 신규 회원 가입
	 * 
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Member member);
	
	/**
	 * 아이디 중복 검사
	 * 
	 * @param member - ID 정보 객체
	 * @return 아이디 중복 확인 결과
	 */
	public boolean joinIdChk(Member member);
	
	/**
	 * 로그인 인증 처리
	 * 	
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 결과
	 */
	public boolean login(Member member);
	
	/**
	 * 로그인 유저 정보 반환 
	 * 
	 * @param member - 입력한 ID/PW 정보
	 * @return Member - 로그인 한 회원의 정보
	 */
	public Member getLoginInfo(Member member);
	
	/**
	 * 카카오 로그인 인증 처리
	 * 	
	 * @param member - 입력한 ID 정보
	 * @return 카카오 로그인 인증 결과
	 */
	public boolean kakaoLogin(Member member);
	
	/**
	 * 카카오 계정 신규 회원 가입
	 * 
	 * @param member - 카카오 계정 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean kakaoJoin(Member member);
	
	/**
	 * 아이디 찾기 유저 정보 조회
	 * 
	 * @param member - 회원이 입력한 이름, 이메일 주소
	 * @return 유저 조회 결과
	 */
	public boolean findIdUserInfo(Member member);
	
	/**
	 * 아이디 찾기 시 회원의 ID 정보 조회
	 * 
	 * @param member - 입력한 이름, 이메일 주소
	 * @return String - 조회된 회원 ID
	 */
	public String getUserIdInfo(Member member);
	
	/**
	 * 이메일 인증 처리  
	 * 
	 * @param userEmail - 회원의 이메일 주소
	 * @return String - 인증번호
	 * @throws MessagingException 
	 */
	public String userEmailCheck(String userEmail) throws MessagingException;
	
	/**
	 * 비밀번호 찾기 유저 정보 조회
	 * 
	 * @param member - 회원이 입력한 이름, 아이디, 휴대폰 번호
	 * @return 유저 조회 결과
	 */
	public boolean findPwUserInfo(Member member);
	
	/**
	 * 휴대폰 본인인증 처리
	 * 
	 * @param member - 회원의 휴대폰 번호
	 * @return String - 인증번호
	 * @throws CoolsmsException 
	 */
	public String userPhoneCheck(String userPhone) throws CoolsmsException;
	
	/**
	 * 비밀번호 변경 요청
	 * 
	 * @param member - 회원의 ID, PW
	 */
	public void getPwModify(Member member);

	/**
	 * 회원정보 수정 요청
	 * 
	 * @param member - 유저 정보 파라미터(ID, PW, 이름, 휴대폰 번호, 주소, 생년월일, 이메일)    
	 */
	public void getUserModify(Member member);

	/**
	 * 휴대폰 번호 변경 요청
	 * 
	 * @param member - 회원의 ID, Phone
	 */
	public void getPhoneModify(Member member);

	/**
	 * 회원 탈퇴 요청
	 * 
	 * @param member - 유저 정보 파라미터(NO, ID, PW, 이름, 휴대폰 번호, 주소, 생년월일, 이메일, 가입날짜)
	 */
	public boolean getUserWd(Member member);
	
	
	
}
