package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.dao.face.MemberDao;
import member.dto.Member;
import member.service.face.MemberService;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
	//--- 회원가입 ---
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String joinProc(Member member) {
		System.out.println("member: " + member);
		boolean joinResult = memberService.join(member);
		
		if( joinResult ) {
			return "redirect:/member/login";
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
	
	//--- 로그인 ---
	@GetMapping("/login")
	public String login(HttpSession session) {
		if ( session.getAttribute("loginResult") != null ) {
//			return "redirect:/member/loginError";
		}
		return "/member/login";
	}
	
	@RequestMapping("/loginError")
	public void loginError() {}
	
	@PostMapping("/login")
	@ResponseBody
	public int loginProc(Member member, HttpSession session) {
		
		//로그인 인증
		boolean loginResult = memberService.login(member);
		
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
	
	//--- 로그아웃 ---
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		//세션 정보 삭제 - 로그아웃
		session.invalidate();
		
		//메인 페이지로 리다이렉트
		return "redirect:/aweek/main";
	}
	
	//--- 아이디 찾기 ---
	@GetMapping("/findId")
	public void findId() {}
	
	@PostMapping("/findId")
	public String findIdOk() {
		
		return null;
	}
	
	//이메일 인증
//	@PostMapping("/emailAuth")
//	public String emailAuth(String userPhone) throws CoolsmsException {
//		return memberService.userPhoneCheck(userPhone);
//	}
	
	//--- 비밀번호 찾기 ---
	@GetMapping("/findPw")
	public void findPw() {}
	
	@PostMapping("/findPw")
	public int findPwProc(Member member) {
		
		boolean findPwResult = memberService.findPwUserInfo(member);
		
		if ( findPwResult ) {
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
	
	//--- 회원 정보 수정
	
	
	//--- 회원 탈퇴 ---
	
	
}
