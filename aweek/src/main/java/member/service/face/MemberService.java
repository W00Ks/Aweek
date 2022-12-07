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

	
	
}
