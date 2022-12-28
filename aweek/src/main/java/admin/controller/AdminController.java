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
import org.springframework.web.multipart.MultipartFile;

import admin.dto.Admin;
import admin.service.face.AdminService;
import admin.util.UserPaging;
import common.Paging;
import cs.dto.CsFile;
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import cs.dto.QnACategory;
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
	public void main(Model model) {
		
		logger.info("/admin/main");
		
		int memberCount = adminService.getMemberCount();
		int roomCount = adminService.getRoomCount();
		int paymentCount = adminService.getPaymentCount();
		int noticeCount = adminService.getNoticeCount();
		int qnaCount = adminService.getQnaCount();
		int inquiryCount = adminService.getInquiryCount();
		
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("roomCount", roomCount);
		model.addAttribute("paymentCount", paymentCount);
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("inquiryCount", inquiryCount);
		
		logger.info("memberCount : {}", memberCount);
		logger.info("roomCount : {}", roomCount);
		logger.info("paymentCount : {}", paymentCount);
		logger.info("noticeCount : {}", noticeCount);
		logger.info("qnaCount : {}", qnaCount);
		logger.info("inquiryCount : {}", inquiryCount);
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
		
		logger.info("adminLoginProc 1 : {}", admin);
		
		boolean adminLogin = adminService.AdminLogin(admin);
		
		logger.info("adminLoginProc 2 : {}", adminLogin);

		admin = adminService.getAdminLogin(admin);
		
		logger.info("adminLoginProc 3 : {}", admin);
		
		if(adminLogin) {
			session.setAttribute("adminLogin", adminLogin);
			session.setAttribute("adminNo", admin.getAdminNo());
			session.setAttribute("adminId", admin.getAdminId());
			session.setAttribute("adminNick", admin.getAdminNick());
			
			return "redirect:/admin/memberlist";
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
	
	// 관리자 회원 목록
	@GetMapping("/memberlist")
	public void memberList(Model model, String curPage) {
		
		logger.info("/admin/memberlist [GET]");
		
		UserPaging userPaging = new UserPaging();
		userPaging = adminService.getUserPaging(curPage);
		
		logger.info("MemberList 1 : {}", userPaging);
		
		List<Member> memberlist = adminService.memberList(userPaging);
		
		logger.info("MemberList 2 : {}", memberlist);
		
		model.addAttribute("memberlist", memberlist);
		model.addAttribute("paging", userPaging);

		logger.info("MemberList 3 : {}", memberlist);
	}
	
	// 관리자 회원 목록 POST
	@PostMapping("/memberlist")
	public void searchmemberList(Model model, Member member, UserPaging userPaging, String curPage) {
	
		logger.info("/admin/memberlist [POST]");
		logger.info("SearchMemberList 1 : {}", userPaging);
		
		UserPaging searchmember = userPaging;
		
		userPaging = adminService.getSearchPaging(userPaging, curPage);
		
		userPaging.setUserNo(searchmember.getUserNo());
		userPaging.setType(searchmember.getType());
		userPaging.setKeyword(searchmember.getKeyword());
		
		logger.info("SearchmemberList 2 : {}", searchmember);
		
		List<Member> searchmemberList = adminService.memberSearchList(userPaging);
		
		logger.info("SearchMemberList 3 : {}", searchmemberList);
		
		model.addAttribute("memberlist", searchmemberList);
		model.addAttribute("paging", userPaging);

		logger.info("SearchMemberList 4 : {}", searchmemberList);
	}
	
	// 관리자 방 목록
	@RequestMapping("/roomlist")
	public void roomList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("admin/roomlist");
		
		Paging paging = adminService.getPagingRoom(curPage);
		
		logger.info("RoomList 1 : {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Room> roomlist = adminService.roomList(paging);
		
		for( Room r : roomlist ) logger.info("RoomList 2 : {}", r);
		
		model.addAttribute("roomlist", roomlist);
	}
	
	// 관리자 결제 목록
	@RequestMapping("/paymentlist")
	public void paymentList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/paymentlist");
		
		Paging paging = adminService.getPagingPayment(curPage);
		
		logger.info("PaymentList 1 : {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Payment> paymentlist = adminService.paymentList(paging);
		
		for( Payment p : paymentlist ) logger.info("PaymentList 2 : {}", p);
		
		model.addAttribute("paymentlist", paymentlist);
	}
	
	// 관리자 공지사항 조회
	@RequestMapping("/noticelist")
	public void noticeList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/noticelist");
		
		Paging paging = adminService.getPagingNotice(curPage);
		
		logger.info("NoticeList 1 : {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Notice> noticelist = adminService.noticeList(paging);
		
		for( Notice n : noticelist ) logger.info("NoticeList 2 : {}", n);
		
		model.addAttribute("noticelist", noticelist);
	}
	
	// 관리자 Q&A 조회
	@RequestMapping("/qnalist")
	public void qnaList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/admin/qnalist");
		
		Paging paging = adminService.getPagingQnA(curPage);
		
		logger.info("Q&AList 1 : {}", paging);
		
		model.addAttribute("paging", paging);
		
		// List<QnACategory> qnaCategoryList = adminService.qnaCategoryList();
		
		// model.addAttribute("qnaCategoryList", qnaCategoryList);
		
		List<QnA> qnalist = adminService.qnaList(paging);
		
		for( QnA q : qnalist ) logger.info("Q&AList 2 : {}", q);
		
		model.addAttribute("qnalist", qnalist);
	}
	
	// 관리자 1:1 문의 조회
	@RequestMapping("/inquirylist")
	public void inquiryList(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		logger.info("/inquirylist");
		
		Paging paging = adminService.getPagingInquiry(curPage);
		
		logger.info("InquiryList 1 : {}", paging);
		
		model.addAttribute("paging", paging);
		
		List<Inquiry> inquirylist = adminService.inquiryList(paging);
		
		for( Inquiry i : inquirylist ) logger.info("InquiryList 2 : {}", i);
		
		model.addAttribute("inquirylist", inquirylist);
	}
	
	// 관리자 회원 상세 조회
	@RequestMapping("/memberdetail")
	public String memberDetail(Member member, Model model) {
		
		logger.info("/admin/memberdetail");
		
		logger.info("MemberDetail 1 : {}", member);
		
		// 잘못된 회원 번호 처리
		if( member.getUserNo() < 0 ) {
			return "redirect:/admin/memberlist";
		}
		
		// 회원 상세 조회
		member = adminService.memberDetailView(member);
		
		logger.info("MemberDetail 2 : {}", member);
		
		// 모델값 전달
		model.addAttribute("member", member);
		
		logger.info("MemberDetail 3 : {}", member);

		return "admin/memberdetail";
	}
	
	// 관리자 방 상세 조회
	@RequestMapping("/roomdetail")
	public String roomDetail(Room room, Model model) {
		
		logger.info("/admin/roomdetail");
		
		logger.info("RoomDetail 1 : {}", room);
		
		// 잘못된 방 번호 처리
		if( room.getRoomNo() < 0 ) {
			return "redirect:/admin/roomlist";
		}
		
		// 방 상세 조회
		room = adminService.roomDetailView(room);
		
		logger.info("RoomDetail 2 : {}", room);
		
		// 모델값 전달
		model.addAttribute("room", room);
		
		logger.info("RoomDetail 3 : {}", room);
		
		return "admin/roomdetail";
	}
	
	// 관리자 결제 상세 조회
	@RequestMapping("/paymentdetail")
	public String paymentDetail(Payment payment, Model model) {
		
		logger.info("/admin/paymentdetail");

		logger.info("PaymentDetail 1 : {}", payment);
		
		// 잘못된 결제 번호 처리
		if( payment.getPayNo() == null ) {
			return "redirect:/admin/paymentlist";
		}
		
		// 결제 상세 조회
		payment = adminService.paymentDetailView(payment);
		
		logger.info("PaymentDetail 2 : {}", payment);
		
		// 모델값 전달
		model.addAttribute("payment", payment);

		logger.info("PaymentDetail 3 : {}", payment);

		return "admin/paymentdetail";
	}
	
	// 관리자 공지사항 상세조회
	@RequestMapping("/noticedetail")
	public String noticeDetail(Notice viewNotice, Model model) {
		
		logger.info("/admin/noticedetail");

		logger.info("NoticeDetail 1 : {}", viewNotice);
		
		// 잘못된 공지사항 번호 처리
		if( viewNotice.getNoticeNo() < 0 ) {
			return "redirect:/admin/noticelist";
		}
		
		// 공지사항 상세 조회
		viewNotice = adminService.noticeDetailView(viewNotice);
		
		logger.info("NoticeDetail 2 : {}", viewNotice);
		
		// 모델값 전달
		model.addAttribute("viewNotice", viewNotice);
		
		// 첨부파일 모델값 전달
		CsFile csFile = adminService.getNoticeFile(viewNotice);
		model.addAttribute("csFile", csFile);
		
		logger.info("NoticeDetail 3 : {}", viewNotice);

		return "admin/noticedetail";
	}
	
	// 관리자 Q&A 상세조회
	@RequestMapping("/qnadetail")
	public String qnaDetail(QnA viewQna, Model model) {
		
		logger.info("/admin/qnadetail");

		logger.info("Q&ADetail 1 : {}", viewQna);
		
		// 잘못된 Q&A 번호 처리
		if( viewQna.getQnaNo() < 0 ) {
			return "redirect:/admin/qnalist";
		}
		
		// Q&A 상세 조회
		viewQna = adminService.qnaDetailView(viewQna);
		// List<QnACategory> qnaCategoryList = adminService.qnaCategoryList();
		
		logger.info("Q&ADetail 2 : {}", viewQna);

		// 모델값 전달
		model.addAttribute("viewQna", viewQna);
		// model.addAttribute("qnaCategoryList", qnaCategoryList);
		
		logger.info("Q&ADetail 3 : {}", viewQna);
		
		return "admin/qnadetail";
	}

	// 관리자 1:1 문의 상세조회
	@RequestMapping("/inquirydetail")
	public String inquiryDetail(Inquiry viewInquiry, Model model) {
		
		logger.info("/admin/inquirydetail");
		
		logger.info("InquiryDetail 1 : {}", viewInquiry);
		
		// 잘못된 1:1 문의 번호 처리
		if( viewInquiry.getInquiryNo() < 0 ) {
			return "redirect:/admin/inquirylist";
		}
		
		// 1:1 문의 상세 조회
		viewInquiry = adminService.inquiryDetailView(viewInquiry);
		
		logger.info("InquiryDetail 2 : {}", viewInquiry);
		
		// 모델값 전달
		model.addAttribute("viewInquiry", viewInquiry);
		
		logger.info("InquiryDetail 3 : {}", viewInquiry);

		return "admin/inquirydetail";
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

		logger.info("noticeWrite 1 : {}", notice);
		logger.info("noticeWrite 1 : {}", file);
		
		// 작성자 정보 추가
		notice.setWriterId( (String) session.getAttribute("adminId") );
		notice.setWriterNick( (String) session.getAttribute("adminNick") );
		
		logger.info("noticeWrite 2 : {}", notice);
		logger.info("noticeWrite 2 : {}", file);

		// 공지사항 작성
		adminService.noticeWrite(notice, file);

		logger.info("noticeWrite 3 : {}", notice);
		logger.info("noticeWrite 3 : {}", file);
		
		return "redirect:/admin/noticelist";
	}

	// 관리자 공지사항 수정
	@GetMapping("/noticemodify")
	public String noticeModify(Notice notice, Model model) {
		
		logger.info("/admin/noticemodify [GET]");
		
		logger.info("NoticeModify 1 : {}", notice);
		
		// 잘못된 공지사항 번호 처리
		if( notice.getNoticeNo() < 0 ) {
			return "redirect:/admin/noticelist";
		}
		
		// 공지사항 상세 조회
		notice = adminService.noticeDetailView(notice);
		
		logger.info("NoticeModify 2 : {}", notice);
		
		// 모델값 전달
		model.addAttribute("modifyNotice", notice);
		
		// 첨부파일 모델값 전달
		CsFile csFile = adminService.getNoticeFile(notice);
		model.addAttribute("csFile", csFile);
		
		logger.info("NoticeModify 3 : {}", notice);
		logger.info("NoticeModify 3 : {}", csFile);

		return "admin/noticemodify";
	}

	// 관리자 공지사항 수정 POST
	@PostMapping("/noticemodify")
	public String noticeModifyProc(Notice notice, MultipartFile file) {
		
		logger.info("/admin/noticemodify [POST]");
		
		// 공지사항 수정
		adminService.noticeModify(notice, file);
		
		logger.info("NoticeModify 4 : {}", notice);
		logger.info("NoticeModify 4 : {}", file);

		return "redirect:/admin/noticedetail?noticeNo=" + notice.getNoticeNo();
	}

	// 관리자 공지사항 삭제
	@RequestMapping("/noticedelete")
	public String noticeDelete(Notice notice) {
		
		logger.info("/admin/noticedelete");
		
		// 공지사항 삭제
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
		
		logger.info("qnaWrite 1 : {}", qna);
		
		// 작성자 정보 추가
		qna.setWriterId( (String) session.getAttribute("adminId") );
		qna.setWriterNick( (String) session.getAttribute("adminNick") );
		
		logger.info("qnaWrite 2 : {}", qna);

		// Q&A 작성
		adminService.qnaWrite(qna);
		
		logger.info("qnaWrite 3 : {}", qna);

		return "redirect:/admin/qnalist";
	}

	// 관리자 Q&A 수정
	@GetMapping("/qnamodify")
	public String qnaModify(QnA qna, Model model) {
	
		logger.info("/admin/qnamodify [GET]");
		
		logger.info("Q&AModify 1 : {}", qna);
		
		// 잘못된 Q&A 번호 처리
		if( qna.getQnaNo() < 0 ) {
			return "redirect:/admin/qnalist";
		}
		
		// Q&A 상세 조회
		qna = adminService.qnaDetailView(qna);
		
		logger.info("Q&AModify 2 : {}", qna);
		
		// 모델값 전달
		model.addAttribute("modifyQnA", qna);
		
		logger.info("Q&AModify 3 : {}", qna);

		return "admin/qnamodify";
	}

	// 관리자 Q&A 수정 POST
	@PostMapping("/qnamodify")
	public String qnaModifyProc(QnA qna) {
		
		logger.info("/admin/qnamodify [POST]");
		
		// Q&A 수정
		adminService.qnaModify(qna);
		
		logger.info("Q&AModify 4 : {}", qna);
		
		return "redirect:/admin/qnadetail?qnaNo=" + qna.getQnaNo();
	}
	
	// 관리자 Q&A 삭제
	@RequestMapping("/qnadelete")
	public String qnaDelete(QnA qna) {
		
		logger.info("/admin/qnadelete");
		
		// Q&A 삭제
		adminService.qnaDelete(qna);
	
		return "redirect:/admin/qnalist";
	}

	// 관리자 첨부파일 다운로드
	@RequestMapping("/download")
	public String download(CsFile csFile, Model model) {

		// 첨부파일 정보 객체
		csFile = adminService.getFile(csFile);
		
		logger.info("download 1 : {}", csFile);
		
		// 모델값 전달
		model.addAttribute("downFile", csFile);
		
		logger.info("download  2 : {}", csFile);

		return "down";
	}
	
	// 관리자 통계 보기
	@GetMapping("/staties")
	public String staties(Model model) {
		
		logger.info("/admin/staties");
		
		int memberCount = adminService.getMemberCount();
		int roomCount = adminService.getRoomCount();
		int paymentCount = adminService.getPaymentCount();
		int noticeCount = adminService.getNoticeCount();
		int qnaCount = adminService.getQnaCount();
		int inquiryCount = adminService.getInquiryCount();
		
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("roomCount", roomCount);
		model.addAttribute("paymentCount", paymentCount);
		model.addAttribute("noticeCount", noticeCount);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("inquiryCount", inquiryCount);
		
		logger.info("memberCount : {}", memberCount);
		logger.info("roomCount : {}", roomCount);
		logger.info("paymentCount : {}", paymentCount);
		logger.info("noticeCount : {}", noticeCount);
		logger.info("qnaCount : {}", qnaCount);
		logger.info("inquiryCount : {}", inquiryCount);

		return "/admin/staties";
	}

//	// 관리자 회원 목록
//	@RequestMapping("/memberlist")
//	public void memberList(@RequestParam(defaultValue = "0") int curPage, Model model) {
//		
//		logger.info("admin/memberlist");
//		
//		Paging paging = adminService.getPagingMember(curPage);
//		
//		logger.info("Member Paging - {}", paging);
//		
//		model.addAttribute("paging", paging);
//		
//		List<Member> memberlist = adminService.memberList(paging);
//		
//		for( Member m : memberlist ) logger.info("Member List - {}", m);
//		
//		model.addAttribute("memberlist", memberlist);
//	}
}