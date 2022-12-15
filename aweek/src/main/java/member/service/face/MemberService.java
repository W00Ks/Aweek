package member.service.face;

import java.util.List;

import javax.mail.MessagingException;

import common.Mypaging;
import cs.dto.Inquiry;
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
	 * 카카오 계정 회원가입 시 회원정보 수정용 비밀번호 이메일 발송
	 * 
	 * @param member - 회원 정보 파라미터
	 * @return - 인증번호
	 * @throws MessagingException
	 */
	public String userPwEmailSend(Member member) throws MessagingException;
	
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
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 	파라미터 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @param member - 회원정보
	 * @return 계산이 완료된 Paging객체
	 */
	public Mypaging getPaging(int curPage, Member member);
	
	/**
	 * 페이징이 적용된 나의 1:1 문의 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @param member - 회원 정보
	 * @return 페이징이 적용된 나의 1:1 문의 목록
	 */
	public List<Inquiry> myInquiryList(Mypaging paging, Member member);

	/**
	 * 나의 1:1 문의글 상세보기
	 * 
	 * @param viewInquiry - 상세 조회할 게시글 번호 객체
	 * @param member - 회원 정보
	 * @return 조회된 상세 나의 1:1 문의글 객체
	 */
	public Inquiry myInquiryView(Inquiry viewInquiry, Member member);

}
