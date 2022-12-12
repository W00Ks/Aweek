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
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import member.dto.Member;
import payment.dto.Payment;
import room.dto.Room;

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
	public void Login() {
		
		logger.info("/admin/login [GET]");
	}
	
	// 관리자 로그인 POST
	@PostMapping("/login")
	public String LoginProc(Admin admin, HttpSession session) {
		
		logger.info("/admin/login [POST]");
		logger.info("{}", admin);
		
		boolean adminLogin = adminService.AdminLogin(admin);
		logger.info("adminLogin : {}", admin);
	
		if(adminLogin) {
			session.setAttribute("adminLogin", adminLogin);
			session.setAttribute("adminNo", admin.getAdminNo());
			
			return "redirect:/admin/main";
		} else {
			session.invalidate();
		}
		return "redirect:/admin/login";
	}
	
	// 관리자 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		logger.info("/admin/logout");
		
		session.invalidate();
		
		return "redirect:/admin/login";
	}
	
	// 관리자 방 목록
	@RequestMapping("/roomlist")
	public void roomlist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("admin/roomlist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Room> roomlist = adminService.roomList(paging);
		
		for( Room r : roomlist ) logger.info("{}", r);
		
		model.addAttribute("roomlist", roomlist);
	}
	
	// 관리자 회원 목록
	@RequestMapping("/memberlist")
	public void memberlist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("admin/memberlist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Member> memberlist = adminService.memberList(paging);
		
		for( Member m : memberlist ) logger.info("{}", m);
		
		model.addAttribute("memberlist", memberlist);
	}
	
	// 관리자 회원 상세 조회
	@RequestMapping("/memberdetail")
	public String memberdetail(Member member, Model model) {
		
		logger.info("/admin/memberdetail");
		
		logger.info("{}", member);
		
		// 잘못된 회원 번호 처리
		if( member.getUserNo() < 0 ) {
			return "redirect:/admin/memberlist";
		}
		
		// 게시글 조회
		member = adminService.memberDetailView(member);
		logger.info("조회된 회원 {}", member);
		
		// 모델값 전달
		model.addAttribute("member", member);
		
		return "admin/memberdetail";
	}
	
	// 관리자 결제 목록
	@RequestMapping("/paymentlist")
	public void paymentlist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/paymentlist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Payment> paymentlist = adminService.paymentList(paging);
		
		for( Payment p : paymentlist ) logger.info("{}", p);
		
		model.addAttribute("paymentlist", paymentlist);
	}
	
	// 관리자 결제 상세 조회
	@RequestMapping("/paymentdetail")
	public String paymentdetail(Payment payment, Model model) {
		
		logger.info("/admin/paymentdetail");

		logger.info("{}", payment);
		
		// 잘못된 결제 번호 처리
		if( payment.getUserNo() < 0 ) {
			return "redirect:/admin/paymentlist";
		}
		
		// 게시글 조회
		payment = adminService.paymentDetailView(payment);
		logger.info("조회된 결제 {}", payment);
		
		// 모델값 전달
		model.addAttribute("payment", payment);

		return "admin/paymentdetail";
	}
	
	// 관리자 1:1 문의 조회
	@RequestMapping("/inquirylist")
	public void inquirylist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/inquirylist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Inquiry> inquirylist = adminService.inquiryList(paging);
		
		for( Inquiry i : inquirylist ) logger.info("{}", i);
		
		model.addAttribute("inquirylist", inquirylist);
	}
	
	// 관리자 공지사항 조회
	@RequestMapping("/noticelist")
	public void noticelist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/noticelist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Notice> noticelist = adminService.noticeList(paging);
		
		for( Notice n : noticelist ) logger.info("{}", n);
		
		model.addAttribute("noticelist", noticelist);
	}
	
	// 관리자 공지사항 상세조회
	@RequestMapping("/noticedetail")
	public String noticeDetail(Notice viewNotice, Model model) {
		
		logger.info("{}", viewNotice);
		
		// 잘못된 공지사항 번호 처리
		if( viewNotice.getNoticeNo() < 0 ) {
			return "redirect:/admin/noticelist";
		}
		
		// 공지사항 조회
		viewNotice = adminService.noticeView(viewNotice);
		
		logger.info("조회된 공지사항 {}", viewNotice);
		
		// 모델값 전달
		model.addAttribute("viewNotice", viewNotice);
		
		return "admin/noticedetail";
	}
	
	// 관리자 공지사항 작성
	@GetMapping("/noticewrite")
	public void noticewrite() {
		
		logger.info("/admin/noticewrite [GET]");
	}
	
	// 관리자 공지사항 작성 POST
	@PostMapping("/noticewrite")
	public String noticewriteProc(Notice notice, HttpSession session) {
		
		logger.info("/admin/noticewrite [POST]");

		logger.info("{}", notice);
		
		// 공지사항 처리
		adminService.noticeWrite(notice);
		
		return "redirect:/admin/noticelist";
	}

	// 관리자 공지사항 수정
	@GetMapping("/noticemodify")
	public String noticemodify(Notice notice, Model model) {
		
		logger.info("{}", notice);
		
		// 잘못된 공지사항 번호 처리
		if( notice.getNoticeNo() < 0 ) {
			return "redirect:/admin/noticelist";
		}
		
		// 공지사항 조회
		notice = adminService.noticeView(notice);
		
		logger.info("조회된 공지사항 {}", notice);
		
		// 모델값 전달
		model.addAttribute("modifyNotice", notice);
		
		return "admin/noticemodify";
	}

	// 관리자 공지사항 수정 POST
	@PostMapping("/noticemodify")
	public String noticemodifyProc(Notice notice) {
		
		logger.info("/admin/noticemodify");
		
		adminService.noticeModify(notice);
		
		return "redirect:/admin/noticelist?noticeNo=" + notice.getNoticeNo();
	}

	// 관리자 공지사항 삭제
	@RequestMapping("/noticedelete")
	public String noticedelete(Notice notice) {
		
		logger.info("/admin/noticedelete");
		
		adminService.noticeDelete(notice);
		
		return "redirect:/admin/noticelist";
	}
	
	// 관리자 Q&A 조회
	@RequestMapping("/qnalist")
	public void qnalist(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/qnalist");
		
		Paging paging = adminService.getPaging(curPage);
		
		logger.info("{}", paging);
		
		model.addAttribute("paging", paging);
		
		List<QnA> qnalist = adminService.qnaList(paging);
		
		for( QnA q : qnalist ) logger.info("{}", q);
		
		model.addAttribute("qnalist", qnalist);
	}

	// 관리자 Q&A 작성
	@GetMapping("/qnawrite")
	public void qnawrite() {
		
		logger.info("/admin/qnawrite [GET]");
	}

	// 관리자 Q&A 작성 POST
	@PostMapping("/qnawrite")
	public String qnawriteProc(QnA qna, HttpSession session) {
		
		logger.info("/admin/qnawrite [POST]");
		
		logger.info("{}", qna);
		
		// Q&A 처리
		adminService.qnaWrite(qna);
		
		return "redirect:/admin/qnalist";
	}

	// 관리자 Q&A 수정
	@GetMapping("/qnamodify")
	public String qnamodify(QnA qna, Model model) {
	
		logger.info("{}", qna);
		
		// 잘못된 Q&A 번호 처리
		if( qna.getQnaNo() < 0 ) {
			return "redirect:/admin/qnalist";
		}
		
		// Q&A 조회
		qna = adminService.qnaView(qna);
		
		logger.info("조회된 Q&A {}", qna);
		
		// 모델값 전달
		model.addAttribute("modifyQnA", qna);
		
		return "admin/qnamodify";
	}

	// 관리자 Q&A 수정 POST
	@PostMapping("/qnamodify")
	public String qnamodifyProc(QnA qna) {
		
		logger.info("/admin/qnamodify");
		
		adminService.qnaModify(qna);
		
		return "redirect:/admin/qnalist?qnaNo=" + qna.getQnaNo();
	}
	
	// 관리자 Q&A 삭제
	@RequestMapping("/qnadelete")
	public String qnadelete(QnA qna) {
		
		logger.info("/admin/qnadelete");
		
		adminService.qnaDelete(qna);
	
		return "redirect:/admin/qnalist";
	}

	// 파일 다운로드
//	@RequestMapping("/download")
//	public String download(File file, Model model) {
//
//		// 첨부파일 정보 객체
//		file = adminService.getFile(file);
//		
//		logger.info("{}", file);
//		
//		// 모델값 전달
//		model.addAttribute("downFile", file);
//		
//		return "down";
//	}
//	
	// 관리자 통계 보기
//	@GetMapping("/staties")
//	public void staties() {
//		
//		logger.info("/admin/staties");
//	}
}