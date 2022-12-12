package member.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.dto.Member;
import member.service.face.MemberService;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
	//------------------------------ 회원가입 ------------------------------
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String joinProc(Member member, HttpSession session) {
		boolean joinResult = memberService.join(member);
		
		if( joinResult ) {
			session.setAttribute("userId", member.getUserId());
			return "redirect:/member/joinOk";
		} else {
			return "redirect:/member/join";
		}
	}
	
	@RequestMapping("/joinIdChk")
	@ResponseBody
	public int joinIdChk(Member member) {
		
		boolean joinIdChkResult = memberService.joinIdChk(member);
		
		if ( joinIdChkResult ) {
			return 1; 
		} else {
			return 0;
		}

	}

	//회원가입 완료 페이지
	@RequestMapping("/joinOk")
	public void joinOk() {}
	
	//------------------------------ 로그인 ------------------------------
	@GetMapping("/login")
	public String login(HttpSession session) {
		if ( session.getAttribute("loginResult") != null ) {
			//로그인 세션이 있는 상태에서 로그인 페이지를 접속한 경우 로그인 에러 페이지 리다이렉트
//			return "redirect:/member/loginError"; 
		}
		return "/member/login";
	}
	
	//로그인 세션이 있는 상태에서 로그인 페이지를 접속한 경우 로그인 에러 페이지
	@RequestMapping("/loginError")
	public void loginError() {}
	
	@PostMapping("/login")
	@ResponseBody
	public int loginProc(Member member, HttpSession session) {
		
		//로그인 인증
		boolean loginResult = memberService.login(member);
		
		//로그인 유저 정보
		member = memberService.getLoginInfo(member);
		
		if ( loginResult ) { //로그인 성공
			
			//세션정보 객체
			session.setAttribute("loginResult", loginResult);
			session.setAttribute("userNo", member.getUserNo());
			session.setAttribute("userId", member.getUserId());
			
			return 1;
			
		} else { //로그인 실패
			session.invalidate();
			return 0;
		}
	}
	
	//카카오 로그인 처리
	@RequestMapping("/kakaoLogin")
	@ResponseBody
	public int kakaoLogin(Member member, HttpSession session) {
		boolean loginResult = memberService.joinIdChk(member);
		
		//로그인 유저 정보
		member = memberService.getLoginInfo(member);
		
		if ( loginResult ) {
			session.setAttribute("loginResult", loginResult);
			session.setAttribute("userNo", member.getUserNo());
			session.setAttribute("userId", member.getUserId());
			
			return 1;
			
		} else {
			session.invalidate();
			return 0;
		}
	}
	
	//카카오 회원가입 아이디, 이름, 이메일 파라미터 전달
	@RequestMapping("/kakaoJoinChk")
	@ResponseBody
	public void kakaoJoinChk(Member member, HttpSession session) {
		session.setAttribute("uId", member.getUserId());
		session.setAttribute("uName", member.getUserName());
		session.setAttribute("uEmail", member.getUserEmail());
	}
	
	//카카오 회원가입
	@GetMapping("/kakaoJoin")
	public void kakaoJoin() {}
	
	@PostMapping("/kakaoJoin")
	public void kakaoJoinProc(Member member, HttpSession session) {
		System.out.println("member: " + member);
		
		memberService.kakaoJoin(member);
		
		session.setAttribute("userName", member.getUserName());
		
	}
	
	//------------------------------ 로그아웃 ------------------------------
	@RequestMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session) {
		
		//세션 정보 삭제 - 로그아웃
		session.invalidate();
	}
	
	//------------------------------ 아이디 찾기 ------------------------------
	@GetMapping("/findId")
	public void findId() {}
	
	@PostMapping("/findId")
	@ResponseBody
	public int findIdProc(Member member, HttpSession session) {
		boolean findIdResult = memberService.findIdUserInfo(member);
		
		String userId = (String)memberService.getUserIdInfo(member);
		
		if ( findIdResult ) {
			session.setAttribute("userId", userId);
			return 1;
		} else {
			return 0;
		}
	}
	
	//이메일 인증
	@PostMapping("/emailAuth")
	@ResponseBody
	public String emailAuth(String userEmail) throws MessagingException {
		return memberService.userEmailCheck(userEmail);
	}
	
	//아이디 확인 페이지
	@RequestMapping("/findIdOk")
	public void findIdOk() {}
	
	//------------------------------ 비밀번호 찾기 ------------------------------
	@GetMapping("/findPw")
	public void findPw() {}
	
	@PostMapping("/findPw")
	@ResponseBody
	public int findPwProc(Member member, HttpSession session) {
		
		boolean findPwResult = memberService.findPwUserInfo(member);
		
		if ( findPwResult ) {
			session.setAttribute("userId", member.getUserId());
			return 1;
		} else {
			return 0;
		}
	}
	
	//sms 문자 인증
	@PostMapping("/smsAuth")
	@ResponseBody
	public String smsAuth(String userPhone) throws CoolsmsException {
		return memberService.userPhoneCheck(userPhone);
	}
	
	//비밀번호 변경
	@GetMapping("/findPwOk")
	public void modifyPw() {}
	
	@PostMapping("/findPwOk")
	public void modifyPwProc(Member member) {
		memberService.getPwModify(member);;
	}
	
	//마이페이지
	@GetMapping("/mypage")
	public void mypage(HttpSession session) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
	}
	
	//------------------------------ 회원 정보 수정 ------------------------------
	@GetMapping("/info")
	public void info(HttpSession session, Model model) {
		
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		//모델값 전달
		model.addAttribute("member", member);
		
	}

	@PostMapping("/info")
	@ResponseBody
	public void infoProc(Member member) {
		memberService.getUserModify(member);
	}
	
	//비밀번호 변경
	@GetMapping("/pwModify")
	public void pwModify(HttpSession session, Model model) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		//모델값 전달
		model.addAttribute("member", member);
	}
	
	@PostMapping("/pwModify")
	public void pwModifyProc(Member member) {
		memberService.getPwModify(member);;
	}
	
	//현재 비밀번호 체크
	@RequestMapping("/pwChk")
	@ResponseBody
	public int pwChk(Member member) {
		
		boolean PwChkResult = memberService.login(member);
		
		if ( PwChkResult ) {
			return 1; 
		} else {
			return 0;
		}
	}
	
	//핸드폰 번호 수정
	@GetMapping("/phoneModify")
	public void phoneModify(HttpSession session, Model model) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		//모델값 전달
		model.addAttribute("member", member);
	}
	
	@PostMapping("/phoneModify")
	public void phoneModifyProc(Member member) {
//		memberService.getPhoneModify(member);
	}
	
	//휴대폰 번호 체크
	@RequestMapping("/phoneChk")
	public int phoneChk(Member member) {
//		boolean findPhoneResult = memberService.findPhoneUserInfo(member);
		
//		if ( findPhoneResult ) {
			return 1;
//		} else {
//			return 0;
//		}
	}
	
	//------------------------------ 회원 탈퇴 ------------------------------
	
	
	
	//------------------------------ 마이페이지 1:1 문의 ------------------------------
	@RequestMapping("/myInquiry")
	public void myInquiry(HttpSession session, Model model) {
		
	}
	
}
