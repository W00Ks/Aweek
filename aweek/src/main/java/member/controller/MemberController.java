package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import member.dto.Member;
import member.service.face.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("/join")
	public void join() {
	}
	
	@PostMapping("/join")
	public String joinProc(Member joinParam) {
		
		//회원가입 처리 - loginService이용
		memberService.join(joinParam);
		
		//메인 페이지로 이동
		return "redirect:/login/main";
	}
	
	@GetMapping("/login")
	public void login() {
	}
	
	@PostMapping("/login")
	public String loginProc(Member loginParam, HttpSession session) {
		
		//로그인 인증
		boolean isLogin = memberService.login(loginParam);
		
		if ( isLogin ) { //로그인 성공
			
			//세션정보 객체
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("loginid", loginParam.getUserId()); 
			
		} else { //로그인 실패
			session.invalidate();
		}
		
		return "redirect:/aweek/main";
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		
		//세션 정보 삭제 - 로그아웃
		session.invalidate();
		
		//메인 페이지로 리다이렉트
		return "redirect:/aweek/main";
	}
	
}
