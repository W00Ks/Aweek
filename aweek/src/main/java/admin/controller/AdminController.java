package admin.controller;

import java.util.List;

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

import admin.dto.Admin;
import admin.service.face.AdminService;
import common.Paging;
import member.dto.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {

	// 로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 서비스 객체
	@Autowired private AdminService adminService;
	
	// 관리자 메인
	@RequestMapping("/main")
	public void main() {
		
		logger.info("/admin/main");
	}
	
	// 관리자 로그인
	@GetMapping("/login")
	public void getLogin() {
		
		logger.info("/admin/login [GET]");
	}
	
	// 관리자 로그인 POST
	@PostMapping("/login")
	public String postLogin(Admin admin, HttpSession session) {
		
		logger.info("/admin/login [POST]");
		logger.info("{}", admin);
		
		boolean adminLogin = adminService.login(admin);
		logger.info("adminLogin : {}", adminLogin);
	
		if(adminLogin) {
			session.setAttribute("adminLogin", adminLogin);
			session.setAttribute("adminNo", admin.getAdminNo());
			
			return "redirect:/admin/main";
		} else {
			session.invalidate();
		}
		return "redirect:/admin/main";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		logger.info("/admin/logout");
		
		session.invalidate();
		
		return "redirect:/admin/login";
	}
	
	// 관리자 회원 목록
	@RequestMapping("/memberlist")
	public void memberlist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("admin/memberlist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Member> memberlist = adminService.memberlist(paging);
		
		for( Member m : memberlist ) logger.info("{}", m);
		
		model.addAttribute("memebrlist", memberlist);
	}

	// 관리자 방 목록
	@RequestMapping("/roomlist")
	public void roomlist(@RequestParam(defaultValue = "0") int curPage, Model model) {

		logger.info("admin/roomlist");
//		
//		Paging paging = adminService.getPaging(curPage);
//		
//		logger.info("{}", paging);
//		
//		model.addAttribute("paging", paging);
//		
//		List<Room> roomlist = adminService.roomlist(paging);
//		
//		for( Room r : roomlist ) logger.info("{}", r);
//		
//		model.addAttribute("roomlist", roomlist);
	}
//	
//	// 관리자 회원 상세 조회
	@RequestMapping("/memberdetail")
	public void memberdetail() {
//		
		logger.info("/admin/memberdetail");
//
//		logger.info("{}", user);
//		
//		// 잘못된 게시글 번호 처리
//		if( user.getUsertNo() < 0 ) {
//			return "redirect:/admin/memberdetail";
//		}
//		
//		// 게시글 조회
//		user = adminService.memberDetailView(user);
//		logger.info("조회된 게시글 {}", user);
//		
//		// 모델값 전달
//		model.addAttribute("viewPayment", user);
		
		
	}
//	
	// 관리자 결제 목록
	@RequestMapping("/paymentlist")
	public void paymentlist(@RequestParam(defaultValue = "0") int curPage, Model model) {
//		
		logger.info("/admin/paymentlist");
//		
//		Paging paging = adminService.getPaging(curPage);
//		
//		logger.info("{}", paging);
//		
//		model.addAttribute("paging", paging);
//		
//		List<Payment> paymentlist = adminService.paymentlist(paging);
//		
//		for( Payment p : paymentlist ) logger.info("{}", r);
//		
//		model.addAttribute("paymentlist", paymentlist);
	}
//	
//	// 관리자 결제 상세 조회
	@RequestMapping("/paymentdetail")
	public void paymentdetail() {
//		
//		logger.info("/admin/paymentdetail");
//
//		logger.info("{}", payment);
//		
//		// 잘못된 게시글 번호 처리
//		if( payment.getPaymentNo() < 0 ) {
//			return "redirect:/admin/paymentdetail";
//		}
//		
//		// 게시글 조회
//		payment = adminService.PaymentDetailView(payment);
//		logger.info("조회된 게시글 {}", payment);
//		
//		// 모델값 전달
//		model.addAttribute("viewPayment", payment);
//
//		return "admin/paymentinfo";
	}
//	
//	// 관리자 1:1 문의 조회
	@RequestMapping("/inquirylist")
	public void inquirylist(@RequestParam(defaultValue = "0") int curPage, Model model) {
//		
		logger.info("/inquirylist");
//		
//		Paging paging = adminService.getPaging(curPage);
//		
//		logger.info("{}", paging);
//		
//		model.addAttribute("paging", paging);
//		
//		List<Inquiry> inquirylist = adminService.inquirylist(paging);
//		
//		for( Inquiry i : inquirylist ) logger.info("{}", r);
//		
//		model.addAttribute("inquirylist", inquirylist);
	}
//	
//	// 관리자 공지사항 조회
	@RequestMapping("/noticelist")
	public void noticelist(@RequestParam(defaultValue = "0") int curPage, Model model) {
//		
		logger.info("/admin/noticelist");
//		
//		Paging paging = adminService.getPaging(curPage);
//		
//		logger.info("{}", paging);
//		
//		model.addAttribute("paging", paging);
//		
//		List<Notice> noticelist = adminService.noticelist(paging);
//		
//		for( Notice n : noticelist ) logger.info("{}", r);
//		
//		model.addAttribute("noticelist", noticelist);
	}
//	
//	// 관리자 공지사항 작성
	@RequestMapping("/noticewrite")
	public String noticewrite() {
//		
		logger.info("/admin/noticewrite");
//		
		return "admin/noticewrite";
	}
//	
//	// 관리자 공지사항 수정
//	@RequestMapping("/noticemodify")
//	public String noticemodify() {
//		
//		logger.info("/admin/noticemodify");
//		
//		return "admin/noticemodify";
//	}
//	
//	// 관리자 공지사항 삭제
//	@RequestMapping("/noticedelete")
//	public String noticedelete(Admin admin) {
//		
//		logger.info("/admin/noticedelete");
//		
//		adminService.noticedelete(admin);
//		
//		return "redirect:/admin/noticelist";
//	}
//	
	// 관리자 Q&A 조회
	@RequestMapping("/qnalist")
	public void qnalist(@RequestParam(defaultValue = "0") int curPage, Model model) {
//		
		logger.info("/admin/qnalist");
//		
//		Paging paging = adminService.getPaging(curPage);
//		
//		logger.info("{}", paging);
//		
//		model.addAttribute("paging", paging);
//		
//		List<Qna> qnalist = adminService.qnalist(paging);
//		
//		for( Qna q : qnalist ) logger.info("{}", r);
//		
//		model.addAttribute("qnalist", qnalist);
	}
//	
//	// 관리자 Q&A 작성
	@RequestMapping("/qnawrite")
	public String qnawrite() {
//		
		logger.info("/admin/qnawrite");
//		
//		logger.debug("{}", admin);
//		logger.debug("{}", file);
//		
//		// 작성자 정보 추가
//		admin.setAdminId( (String) session.getAttribute("id") );
//		logger.debug("{}", admin);
//		
//		// 게시글, 첨부파일 처리
//		adminService.write(admin, file);
//		
		return "admin/qnawrite";
	}
//	
//	// 관리자 Q&A 수정
//	@RequestMapping("/qnamodify")
//	public String qnamodify(Admin admin, Model model) {
//		
//		logger.info("/admin/qnamodify");
//		
//		// 잘못된 게시글 번호 처리
//		if( admin.getQnaNo() < 0 ) {
//			return "redirect:/admin/qnalist";
//		}
//		
//		// 게시글 조회
//		admin = adminService.view(admin);
//		logger.debug("조회된 게시글 {}", admin);
//		
//		// 모델값 전달
//		model.addAttribute("updateQnaList", admin);
//		
//		// 첨부파일 모델값 전달
//		QnaFile qnaFile = adminService.getAttachFile(admin);
//		model.addAttribute("boardFile", qnaFile);
//		
//		return "admin/qnamodify";
//	}
//	
//	// 관리자 Q&A 삭제
//	@RequestMapping("/qnadelete")
//	public String qnadelete(Admin admin) {
//		
//		logger.info("/admin/qnadelete");
//		
//		adminService.qnadelete(admin);
//	
//		return "redirect:/admin/qnalist";
//	}
//	
//	// 관리자 통계 보기
//	@RequestMapping("/staties")
//	public String staties() {
//		
//		logger.info("/admin/staties");
//		
//		return "admin/staties";
//	}
}