package admin.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import admin.dao.face.AdminDao;
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

@Service
public class AdminServiceImpl implements AdminService {

	// 로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// DAO 객체
	@Autowired private AdminDao adminDao;

	// Context 객체
	@Autowired private ServletContext context;
	
	// 관리자 로그인
	@Override
	public boolean AdminLogin(Admin admin) {
		
		int loginChk = adminDao.selectAdmin(admin);
			
			logger.info("adminLogin :  {}", admin);
			
			if(loginChk > 0) {
				return true;
			}
		return false;
	}
	
	// 관리자 로그인 정보
	@Override
	public Admin getAdminLogin(Admin admin) {
		
		admin = adminDao.selectAdminInfo(admin);
		
		return admin;
	}
	
	// 관리자 회원 목록 페이징 처리
	@Override
	public UserPaging getUserPaging(String curPage) {
		
		logger.info("getUserPagingServiceImpl 1 : {}", curPage);
		
		// 회원 목록 조회
		int totalCount = adminDao.selectMemberCntAll();
		
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}
		
		// 페이징 계산
		UserPaging userPaging = new UserPaging(totalCount, curPage2);
		
		logger.info("getUserPagingServiceImpl 2 : {}", totalCount);
		logger.info("getUserPagingServiceImpl 2 : {}", curPage2);

		return userPaging;
	}
	
	// 관리자 회원 목록 페이징 처리 POST
	@Override
	public UserPaging getSearchPaging(UserPaging userPaging, String curPage) {
		
		logger.info("getSearchPagingServiceImpl 1 : {}", userPaging);
		logger.info("getSearchPagingServiceImpl 1 : {}", curPage);
		
		// 검색 회원 목록 조회 POST
		int totalCount = adminDao.selectSearchCntAll(userPaging);
		
		String param = curPage;
		int curPage2 = 0;
		if( param != null && !"".equals(param) ) {
			curPage2 = Integer.parseInt(param);
		}
		
		// 페이징 계산
		UserPaging userPagingRes = new UserPaging(totalCount, curPage2);
		
		logger.info("getSearchPagingServiceImpl 2 : {}", totalCount);
		logger.info("getSearchPagingServiceImpl 2 : {}", curPage2);

		return userPagingRes;
	}

	// 관리자 방 목록 페이징 처리
	@Override
	public Paging getPagingRoom(int curPage) {
		
		// 방 목록 조회
		int totalCount = adminDao.selectCntRoom();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	// 관리자 결제 목록 페이징 처리	
	@Override
	public Paging getPagingPayment(int curPage) {
		
		// 결제 목록 조회
		int totalCount = adminDao.selectCntPayment();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	// 관리자 공지사항 목록 페이징 처리
	@Override
	public Paging getPagingNotice(int curPage) {
		
		// 공지사항 목록 조회
		int totalCount = adminDao.selectCntNotice();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	// 관리자 Q&A 목록 페이징 처리
	@Override
	public Paging getPagingQnA(int curPage) {
		
		// Q&A 목록 조회
		int totalCount = adminDao.selectCntQnA();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	// 관리자 1:1 목록 페이징 처리
	@Override
	public Paging getPagingInquiry(int curPage) {
		
		// 1:1 문의 목록 조회
		int totalCount = adminDao.selectCntInquiry();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	// 관리자 회원 목록 조회
	@Override
	public List<Member> memberList(UserPaging userPaging) {
		
		logger.info("memberlistServiceImpl 1 : {}", userPaging);
		
		List<Member> memberlist = adminDao.selectMember(userPaging);
		
		logger.info("memberlistServiceImpl 2 : {}", userPaging);
		logger.info("memberlistServiceImpl 2 : {}", memberlist);
		
		return memberlist;
	}
	
	// 관리자 회원 목록 조회 POST
	@Override
	public List<Member> memberSearchList(UserPaging userPaging) {
		
		logger.info("memberSearchListServiceImpl 1 : {}", userPaging);
		
		List<Member> searchlist = adminDao.selectSearch(userPaging);
		
		logger.info("memberSearchListServiceImpl 2 : {}", userPaging);
		logger.info("memberSearchListServiceImpl 2 : {}", searchlist);
		
		return searchlist;
	}

	// 관리자 방 목록 조회
	@Override
	public List<Room> roomList(Paging paging) {
		
		logger.info("RoomListServiceImpl : {}", paging);
		
		return adminDao.selectRoomList(paging);
	}
	
	// 관리자 결제 목록 조회
	@Override
	public List<Payment> paymentList(Paging paging) {
		
		logger.info("PaymentListServiceImpl : {}", paging);

		return adminDao.selectPaymentList(paging);
	}
	
	// 관리자 공지사항 목록 조회
	@Override
	public List<Notice> noticeList(Paging paging) {
		
		logger.info("NoticeListServiceImpl : {}", paging);

		return adminDao.selectNoticeList(paging);
	}

	// 관리자 Q&A 목록 조회
	@Override
	public List<QnA> qnaList(Paging paging) {
		
		logger.info("QnAListServiceImpl : {}", paging);

		return adminDao.selectQnAList(paging);
	}
	
	// 관리자 1:1 목록 조회
	@Override
	public List<Inquiry> inquiryList(Paging paging) {
		
		logger.info("InquiryListServiceImpl : {}", paging);

		return adminDao.selectInquiryList(paging);
	}

	// 관리자 회원 상세 조회
	@Override
	public Member memberDetailView(Member member) {
		
		logger.info("MemberDetailServiceImpl : {}", member);

		return adminDao.selectMemberDetail(member);
	}

	// 관리자 방 상세 조회
	@Override
	public Room roomDetailView(Room room) {

		logger.info("RoomDetailServiceImpl : {}", room);
		
		return adminDao.selectRoomDetail(room);
	}
	
	// 관리자 결제 상세 조회
	@Override
	public Payment paymentDetailView(Payment payment) {
		
		logger.info("PaymentDetailServiceImpl : {}", payment);

		return adminDao.selectPaymentDetail(payment);
	}
	
	// 관리자 공지사항 상세 조회
	@Override
	public Notice noticeDetailView(Notice viewNotice) {
		
		logger.info("NoticeDetailServiceImpl 1 : {}", viewNotice);

		adminDao.updateNoticeHit(viewNotice);
		
		logger.info("NoticeDetailServiceImpl 2 : {}", viewNotice);

		return adminDao.selelctNoticeView(viewNotice);
	}
	
	// 관리자 Q&A 상세 조회
	@Override
	public QnA qnaDetailView(QnA viewQna) {
		
		logger.info("QnADetailServiceImpl : {}", viewQna);

		return adminDao.selelctdQnaView(viewQna);
	}
	
	// 관리자 1:1 문의 상세 조회
	@Override
	public Inquiry inquiryDetailView(Inquiry viewInquiry) {
		
		logger.info("InquiryDetailServiceImpl : {}", viewInquiry);

		return adminDao.selectInquiryView(viewInquiry);
	}
	
	// 관리자 파일 정보 조회
	@Override
	public CsFile getFile(CsFile csFile) {
		
		logger.info("GetFileServiceImpl : {}", csFile);
		
		return adminDao.selectCsFileByCsFileNo(csFile);
	}
	
	// 관리자 공지사항 작성
	@Override
	public void noticeWrite(Notice notice, MultipartFile file) {
		
		logger.info("NoticeWriteServiceImpl 1 : {}", notice);
		logger.info("NoticeWriteServiceImpl 1 : {}", file);
		
		// 공지사항 처리
		if( "".equals( notice.getNoticeTitle() ) ) {
			notice.setNoticeTitle("(제목없음)");
		}
		
		logger.info("NoticeWriteServiceImpl 2 : {}", notice);
		logger.info("NoticeWriteServiceImpl 2 : {}", file);

		// 공지사항 작성
		adminDao.insertNotice(notice);
		
		// 첨부파일 처리
		
//		// 빈 파일
//		if( file.getSize() <= 0 ) {
//			return;
//		}
//		
//		// 파일이 저장될 경로
//		String storedPath = context.getRealPath("upload");
//		File storedFolder = new File( storedPath );
//		if( !storedFolder.exists() ) {
//			storedFolder.mkdir();
//		}
//		
//		// 파일이 저장될 이름
//		String originName = file.getOriginalFilename();
//		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
//		
//		// 저장할 파일의 정보 객체
//		File dest = new File( storedFolder, storedName );
//		
//		try {
//			file.transferTo(dest);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		// 첨부파일 정보 DB 기록
//		CsFile csFile = new CsFile();
//		csFile.setNoticeNo( notice.getNoticeNo() );
//		csFile.setOriginName(originName);
//		csFile.setStoredName(storedName);
//		
//		// 공지사항에 새로운 첨부파일 첨부
//		adminDao.insertNoticeFile(csFile);
	}
	
	// 관리자 공지사항 수정
	@Override
	public void noticeModify(Notice notice, MultipartFile file) {
		
		logger.info("NoticeModifyServiceImpl 1 : {}", notice);
		
		// 공지사항 처리
		if( "".equals( notice.getNoticeTitle() ) ) {
			notice.setNoticeTitle("(제목없음)");
		}
		
		logger.info("NoticeModifyServiceImpl 2 : {}", notice);
		logger.info("NoticeModifyServiceImpl 2 : {}", file);

//		// 공지사항 수정
//		adminDao.updateNotice(notice);
//		
//		// 첨부파일 처리
//		
//		// 빈 파일
//		if( file.getSize() <= 0 ) {
//			return;
//		}
//		
//		// 파일이 저장될 경로
//		String storedPath = context.getRealPath("upload");
//		File storedFolder = new File( storedPath );
//		if( !storedFolder.exists() ) {
//			storedFolder.mkdir();
//		}
//		
//		// 파일이 저장될 이름
//		String originName = file.getOriginalFilename();
//		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
//		
//		// 저장할 파일의 정보 객체
//		File dest = new File( storedFolder, storedName );
//		
//		try {
//			file.transferTo(dest);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		// 첨부파일 정보 DB 기록
//		CsFile csFile = new CsFile();
//		csFile.setNoticeNo( notice.getNoticeNo());
//		csFile.setOriginName(originName);
//		csFile.setStoredName(storedName);
//		
//		// 공지사항에 연결된 첨부파일 삭제
//		adminDao.deleteNoticeFile(notice);
//		
//		// 공지사항에 새로운 첨부파일 첨부
//		adminDao.insertNoticeFile(csFile);
	}
	
	// 관리자 공지사항 삭제
	@Override
	public void noticeDelete(Notice notice) {
		
		// 공지사항 삭제
		adminDao.deleteNotice(notice);
	}
	
	// 관리자 공지사항 파일 정보 조회
	@Override
	public CsFile getNoticeFile(Notice viewNotice) {
		
		logger.info("GetNoticeFileServiceImpl : {}", viewNotice);
		
		return adminDao.selelctCsFileByNoticeNo(viewNotice);
	}

	// 관리자 Q&A 작성
	@Override
	public void qnaWrite(QnA qna) {
		
		logger.info("QnAWriteServiceImpl 1 : {}", qna);
		
		// Q&A 처리
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}
		
		logger.info("QnAWriteServiceImpl 2 : {}", qna);

		// Q&A 작성
		adminDao.insertQna(qna);
	}
	
	// 관리자 Q&A 수정
	@Override
	public void qnaModify(QnA qna) {
		
		logger.info("QnAModifyServiceImpl 1 : {}", qna);
		
		// Q&A 처리
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}
		
		logger.info("QnAModifyServiceImpl 2 : {}", qna);

		// Q&A 수정
		adminDao.updateQna(qna);
	}

	// 관리자 Q&A 삭제
	@Override
	public void qnaDelete(QnA qna) {
		
		// Q&A 삭제
		adminDao.deleteQna(qna);
	}

	@Override
	public int getMemberCount() {

		return adminDao.MemberCount();
	}

	@Override
	public int getRoomCount() {

		return  adminDao.RoomCount();
	}

	@Override
	public int getPaymentCount() {

		return adminDao.PaymentCount();
	}

	@Override
	public int getNoticeCount() {

		return adminDao.NoticeCount();
	}

	@Override
	public int getQnaCount() {

		return adminDao.QnaCount();
	}

	@Override
	public int getInquiryCount() {

		return adminDao.InquiryCount();
	}

//	// 관리자 회원 목록 페이징 처리
//	@Override
//	public Paging getPagingMember(int curPage) {
//		
//		// 회원 목록 조회
//		int totalCount = adminDao.selectCntMember();
//		
//		// 페이징 계산
//		Paging paging = new Paging(totalCount, curPage);
//		
//		return paging;
//	}

//	// 관리자 회원 목록 조회
//	@Override
//	public List<Member> memberList(Paging paging) {
//		
//		return adminDao.selectMemberList(paging);
//	}
}