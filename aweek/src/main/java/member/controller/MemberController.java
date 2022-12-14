package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Paging;
import cs.dto.Inquiry;
import member.dto.Member;
import member.service.face.MemberService;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import payment.dto.Payment;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
			//로그인 세션이 있는 상태에서 로그인 페이지를 접속한 경우 알럿 페이지 리다이렉트
			return "redirect:/member/loginError"; 
		}
		return "/member/login";
	}
	
	//로그인 세션이 있는 상태에서 로그인 페이지를 접속한 경우 알럿 메시지 출력
	@RequestMapping("/loginError")
	public void loginError(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			//SweetAlert
			out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css'>"
					+ "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js'></script>"
					+ "<script type='text/javascript' src='https://code.jquery.com/jquery-2.2.4.min.js'></script>");
			out.println("<script>$(document).ready(function(){swal('이미 로그인 상태입니다.', '이전 페이지로 돌아갑니다.', 'warning').then(function(){"
					+ "		history.go(-1);"
					+ "     })"
					+ "});"
					+ "</script>");
			
			//기본 Alert
//			out.println("<script>$(document).ready(function(){alert('로그인이 필요합니다!'); window.location='/member/login';})</script>");
			out.flush(); 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
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
	public String kakaoJoinProc(Member member, HttpSession session) throws MessagingException {
		
		//카카오 회원가입 처리
		boolean kakaoJoinResult = memberService.kakaoJoin(member);
		
		if( kakaoJoinResult ) {
			//세션에 ID값 저장
			session.setAttribute("userId", member.getUserId());
			//이메일로 회원정보 수정용 비밀번호 발송
			memberService.userPwEmailSend(member);
			return "redirect:/member/joinOk";
		} else {
			return "redirect:/member/kakaoJoin";
		}
	}
	
	//------------------------------ 로그아웃 ------------------------------
	@RequestMapping("/logout")
	@ResponseBody
	public void logout(HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		
		//세션 정보 삭제 - 로그아웃
		session.invalidate();
		
		/*
		 * Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장 if(cookies !=
		 * null) { // 쿠키가 한개라도 있으면 실행 for(int h=0; h< cookies.length; h++) {
		 * cookies[h].setMaxAge(0); // 유효시간을 0으로 설정 resp.addCookie(cookies[h]); // 응답
		 * 헤더에 추가 } }
		 */
		
		Cookie[] cookies = req.getCookies(); // 모든 쿠키의 정보를 cookies에 저장
		
		for(int h=0; h<cookies.length; h++) {
			Cookie kc = new Cookie("favcount"+h, null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
			kc.setPath("/");
			kc.setMaxAge(0); // 유효시간을 0으로 설정
			resp.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
		}
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
		memberService.getPwModify(member);
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
		memberService.getPhoneModify(member);
	}
	
	//------------------------------ 회원 탈퇴 ------------------------------
	@GetMapping("/userWd")
	public void userWd(HttpSession session, Model model) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		//모델값 전달
		model.addAttribute("member", member);
	}
	
	@PostMapping("/userWd")
	public void userWdProc(Member member) {
		
		//전달파라미터의 ID와 일치하는 회원정보 조회
		member = memberService.getLoginInfo(member);
		
		//회원 탈퇴 진행
		memberService.getUserWd(member);
		
	}
	
	//------------------------------ 마이페이지 나의 1:1 문의 ------------------------------
	@RequestMapping("/myInquiryList")
	public void myInquiryList(@RequestParam(defaultValue = "0") int curPage, HttpSession session, Model model) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		Paging paging = memberService.getPaging(curPage, member);
		logger.debug("- - - {}", paging);
		
		List<Inquiry> list = memberService.myInquiryList(paging, member);
		for( Inquiry i : list )	logger.debug("{}", i);
		
		//모델값 전달
		model.addAttribute("member", member);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/myInquiryView")
	public void myInquiryView(Inquiry viewInquiry, HttpSession session, Model model) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		viewInquiry = memberService.myInquiryView(viewInquiry);
		logger.debug("조회된 게시글 {}", viewInquiry);
		
		//모델값 전달
		model.addAttribute("member", member);
		model.addAttribute("viewInquiry", viewInquiry);
		
	}
	
	//------------------------------ 마이페이지 나의 이용권 ------------------------------
	@RequestMapping("/mySubscription")
	public void mySubscription(HttpSession session, Model model) {
		//세션에 저장된 ID를 통해 회원정보 조회 
		Member member = new Member();
		String userId = (String) session.getAttribute("userId");
		member.setUserId(userId);  
		member = memberService.getLoginInfo(member);
		
		model.addAttribute("member", member);

		//회원 정보를 통해 이용권 정보 조회
		Payment payInfo = memberService.getPayInfo(member);
		
		if( payInfo == null ) {
			payInfo = new Payment();
			payInfo.setProductNo(0);
			payInfo.setPaymentDate(null);
			model.addAttribute("payInfo", payInfo);
			
		} else if (payInfo.getProductNo() == 1) {
			//만료일(expiration date) 계산(30일 구독)
			Calendar cal = Calendar.getInstance();
//			cal.setTime(payInfo.getPaymentData());
//			cal.add(cal.DATE, +30);
			cal.setTime(payInfo.getExpirationDate());
			
			//결제일로부터 30일되는 날짜를 SimpleDateFormat으로 변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String payMonthEd = sdf.format(cal.getTime());
			
			//남은 날(remaining period) 수 계산
			long dDay = cal.getTimeInMillis();
			long now = System.currentTimeMillis();
			long result = dDay - now;
			long payDDay = result / 1000 / 60 / 60 / 24 + 1;
			
			model.addAttribute("payMonthEd", payMonthEd);
			model.addAttribute("payDDay", payDDay);
			model.addAttribute("payInfo", payInfo);
			
		} else if (payInfo.getProductNo() == 2) {
			//만료일(expiration date) 계산(1년 구독)
			Calendar cal = Calendar.getInstance();
//			cal.setTime(payInfo.getPaymentData());
//			cal.add(cal.DATE, +365);
			cal.setTime(payInfo.getExpirationDate());
			
			//결제일로부터 364일되는 날짜를 SimpleDateFormat으로 변환
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String payYearEd = sdf.format(cal.getTime());
			
			//남은 날(remaining period) 수 계산
			long dDay = cal.getTimeInMillis();	//1000분의 1초 
			long now = System.currentTimeMillis();	//현재 시간
			long result = dDay - now;
			long payDDay = result / 1000 / 60 / 60 / 24 + 1;
			
			model.addAttribute("payYearEd", payYearEd);
			model.addAttribute("payDDay", payDDay);
			model.addAttribute("payInfo", payInfo);
		}
	}
	
}
