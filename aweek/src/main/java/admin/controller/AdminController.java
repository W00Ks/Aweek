package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import admin.dto.Admin;
import admin.service.face.AdminService;
import common.Paging;
import cs.dto.File;
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
		
		logger.info("Admin Login Proc - {}", admin);
		
		boolean adminLogin = adminService.AdminLogin(admin);
		
		logger.info("adminLogin : {}", adminLogin);

		admin = adminService.getAdminLogin(admin);
		
		logger.info("admin : {}", admin);
		
		if(adminLogin) {
			session.setAttribute("adminLogin", adminLogin);
			
			session.setAttribute("adminNo", admin.getAdminNo());
		
			session.setAttribute("adminId", admin.getAdminId());
			
			session.setAttribute("adminNick", admin.getAdminNick());
			
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
	public void roomList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("admin/roomlist");
		
		Paging paging = adminService.getPagingRoom(curPage);
		
		logger.info("Room Paging - {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Room> roomlist = adminService.roomList(paging);
		
		for( Room r : roomlist ) logger.info("Room List - {}", r);
		
		model.addAttribute("roomlist", roomlist);
	}
	
	// 관리자 회원 목록
	@RequestMapping("/memberlist")
	public void memberList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("admin/memberlist");
		
		Paging paging = adminService.getPagingMember(curPage);
		
		logger.info("Member Paging - {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Member> memberlist = adminService.memberList(paging);
		
		for( Member m : memberlist ) logger.info("Member List - {}", m);
		
		model.addAttribute("memberlist", memberlist);
	}
	
	// 관리자 결제 목록
	@RequestMapping("/paymentlist")
	public void paymentList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/paymentlist");
		
		Paging paging = adminService.getPagingPayment(curPage);
		
		logger.info("Payment Paging - {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Payment> paymentlist = adminService.paymentList(paging);
		
		for( Payment p : paymentlist ) logger.info("Payment List - {}", p);
		
		model.addAttribute("paymentlist", paymentlist);
	}
	
	// 관리자 1:1 문의 조회
	@RequestMapping("/inquirylist")
	public void inquiryList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/inquirylist");
		
		Paging paging = adminService.getPagingInquiry(curPage);
		
		logger.info("Inquiry Paging - {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Inquiry> inquirylist = adminService.inquiryList(paging);
		
		for( Inquiry i : inquirylist ) logger.info("Inquiry List - {}", i);
		
		model.addAttribute("inquirylist", inquirylist);
	}
	
	// 관리자 공지사항 조회
	@RequestMapping("/noticelist")
	public void noticeList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/noticelist");
		
		Paging paging = adminService.getPagingNotice(curPage);
		
		logger.info("Notice Paging - {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Notice> noticelist = adminService.noticeList(paging);
		
		for( Notice n : noticelist ) logger.info("Notice List - {}", n);
		
		model.addAttribute("noticelist", noticelist);
	}
	
	// 관리자 Q&A 조회
	@RequestMapping("/qnalist")
	public void qnaList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/qnalist");
		
		Paging paging = adminService.getPagingQnA(curPage);
		
		logger.info("Q&A Paging - {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<QnA> qnalist = adminService.qnaList(paging);
		
		for( QnA q : qnalist ) logger.info("Q&A List - {}", q);
		
		model.addAttribute("qnalist", qnalist);
	}
	
	// 관리자 회원 상세 조회
	@RequestMapping("/memberdetail")
	public String memberDetail(Member member, Model model) {
		
		logger.info("/admin/memberdetail");
		
		logger.info("Member Detail 1 - {}", member);
		
		// 잘못된 회원 번호 처리
		if( member.getUserNo() < 0 ) {
			return "redirect:/admin/memberlist";
		}
		
		// 게시글 조회
		member = adminService.memberDetailView(member);
		
		logger.info("Member Detail 2 - {}", member);
		
		// 모델값 전달
		model.addAttribute("member", member);
		
		return "admin/memberdetail";
	}
	
	// 관리자 결제 상세 조회
	@RequestMapping("/paymentdetail")
	public String paymentDetail(Payment payment, Model model) {
		
		logger.info("/admin/paymentdetail");

		logger.info("Payment Detail 1 - {}", payment);
		
		// 잘못된 결제 번호 처리
		if( payment.getUserNo() < 0 ) {
			return "redirect:/admin/paymentlist";
		}
		
		// 게시글 조회
		payment = adminService.paymentDetailView(payment);
		
		logger.info("Payment Detail 2 - {}", payment);
		
		// 모델값 전달
		model.addAttribute("payment", payment);

		return "admin/paymentdetail";
	}
	
	// 관리자 공지사항 상세조회
	@RequestMapping("/noticedetail")
	public String noticeDetail(Notice viewNotice, Model model) {
		
		logger.info("/admin/noticedetail");

		logger.info("Notice Detail 1 - {}", viewNotice);
		
		// 잘못된 공지사항 번호 처리
		if( viewNotice.getNoticeNo() < 0 ) {
			return "redirect:/admin/noticelist";
		}
		
		// 공지사항 조회
		viewNotice = adminService.noticeDetailView(viewNotice);
		
		logger.info("Notice Detail 2 - {}", viewNotice);
		
		// 모델값 전달
		model.addAttribute("viewNotice", viewNotice);
		
		// 첨부파일 모델값 전달
		File file = adminService.getNoticeFile(viewNotice);
		model.addAttribute("file", file);
		
		return "admin/noticedetail";
	}
	
	// 관리자 Q&A 상세조회
	@RequestMapping("/qnadetail")
	public String qnaDetail(QnA viewQna, Model model) {
		
		logger.info("/admin/qnadetail");

		logger.info("Q&A Detail 1 - {}", viewQna);
		
		// 잘못된 Q&A 번호 처리
		if( viewQna.getQnaNo() < 0 ) {
			return "redirect:/admin/qnalist";
		}
		
		// Q&A 조회
		viewQna = adminService.qnaDetailView(viewQna);
		
		logger.info("Q&A Detail 2 - {}", viewQna);
		
		// 모델값 전달
		model.addAttribute("viewQna", viewQna);
		
		return "admin/qnadetail";
	}
	
	// 관리자 공지사항 작성
	@GetMapping("/noticewrite")
	public void noticeWrite() {
		
		logger.info("/admin/noticewrite [GET]");
	}
	
	// 관리자 공지사항 작성 POST
	@PostMapping("/noticewrite")
	public String noticeWriteProc(Notice notice, MultipartFile file, HttpSession session) {
		
		logger.info("/admin/noticewrite [POST]");

		logger.info("notice Write 1 - {}", notice);
		logger.info("notice Write 1 - {}", file);
		
		// 작성자 정보 추가
		notice.setWriterId( (String) session.getAttribute("adminId") );
		notice.setWriterNick( (String) session.getAttribute("adminNick") );
		
		logger.info("notice Write 2 - {}", notice);
		logger.info("notice Write 2 - {}", file);

		// 공지사항 처리
		adminService.noticeWrite(notice, file);
		
		return "redirect:/admin/noticelist";
	}

	// 관리자 공지사항 수정
	@GetMapping("/noticemodify")
	public String noticeModify(Notice notice, Model model) {
		
		logger.info("/admin/noticemodify [GET]");
		
		logger.info("Notice Modify - {}", notice);
		
		// 잘못된 공지사항 번호 처리
		if( notice.getNoticeNo() < 0 ) {
			return "redirect:/admin/noticelist";
		}
		
		// 공지사항 조회
		notice = adminService.noticeDetailView(notice);
		
		logger.info("공지사항 수정 - {}", notice);
		
		// 모델값 전달
		model.addAttribute("modifyNotice", notice);
		
		// 첨부파일 모델값 전달
		File file = adminService.getNoticeFile(notice);
		model.addAttribute("file", file);
		
		return "admin/noticemodify";
	}

	// 관리자 공지사항 수정 POST
	@PostMapping("/noticemodify")
	public String noticeModifyProc(Notice notice, MultipartFile file) {
		
		logger.info("/admin/noticemodify [POST]");
		
		adminService.noticeModify(notice, file);
		
		return "redirect:/admin/noticedetail?noticeNo=" + notice.getNoticeNo();
	}

	// 관리자 공지사항 삭제
	@RequestMapping("/noticedelete")
	public String noticeDelete(Notice notice) {
		
		logger.info("/admin/noticedelete");
		
		adminService.noticeDelete(notice);
		
		return "redirect:/admin/noticelist";
	}
		
	// 관리자 Q&A 작성
	@GetMapping("/qnawrite")
	public void qnaWrite() {
		
		logger.info("/admin/qnawrite [GET]");
	}

	// 관리자 Q&A 작성 POST
	@PostMapping("/qnawrite")
	public String qnaWriteProc(QnA qna, HttpSession session) {
		
		logger.info("/admin/qnawrite [POST]");
		
		logger.info("qna Write 1 - {}", qna);
		
		// 작성자 정보 추가
		qna.setWriterId( (String) session.getAttribute("adminId") );
		qna.setWriterNick( (String) session.getAttribute("adminNick") );
		
		logger.info("qna Write 2 - {}", qna);

		// Q&A 처리
		adminService.qnaWrite(qna);
		
		return "redirect:/admin/qnalist";
	}

	// 관리자 Q&A 수정
	@GetMapping("/qnamodify")
	public String qnaModify(QnA qna, Model model) {
	
		logger.info("/admin/qnamodify [GET]");
		
		logger.info("Q&A Modify - {}", qna);
		
		// 잘못된 Q&A 번호 처리
		if( qna.getQnaNo() < 0 ) {
			return "redirect:/admin/qnalist";
		}
		
		// Q&A 조회
		qna = adminService.qnaDetailView(qna);
		
		logger.info("Q&A 수정 - {}", qna);
		
		// 모델값 전달
		model.addAttribute("modifyQnA", qna);
		
		return "admin/qnamodify";
	}

	// 관리자 Q&A 수정 POST
	@PostMapping("/qnamodify")
	public String qnaModifyProc(QnA qna) {
		
		logger.info("/admin/qnamodify [POST]");
		
		adminService.qnaModify(qna);
		
		return "redirect:/admin/qnadetail?qnaNo=" + qna.getQnaNo();
	}
	
	// 관리자 Q&A 삭제
	@RequestMapping("/qnadelete")
	public String qnaDelete(QnA qna) {
		
		logger.info("/admin/qnadelete");
		
		adminService.qnaDelete(qna);
	
		return "redirect:/admin/qnalist";
	}

	// 관리자 회원 검색
	@PostMapping("/membersearch")
	public void MemberSearch(Member member, Model model) {
			
		logger.info("admin/membesearch");
		
		List<Member> memberlist = adminService.memberSearch(member);
		
		for( Member m : memberlist ) logger.info("Member List - {}", m);
		
		model.addAttribute("memberlist", memberlist);
	}
	
	// 파일 다운로드
	@RequestMapping("/download")
	public String download(File file, Model model) {

		// 첨부파일 정보 객체
		file = adminService.getFile(file);
		
		logger.info("download - {}", file);
		
		// 모델값 전달
		model.addAttribute("downFile", file);
		
		return "down";
	}
	
	// 관리자 통계 보기
	@GetMapping("/staties")
	public void staties() {
		
		logger.info("/admin/staties");
	}
}