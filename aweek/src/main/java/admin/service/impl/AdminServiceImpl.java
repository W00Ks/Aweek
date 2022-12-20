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
import admin.dto.Search;
import admin.service.face.AdminService;
import common.Paging;
import cs.dto.CsFile;
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
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
			
			logger.info("admin() : {}", admin);
			
			if(loginChk > 0) {
				return true;
			}
		return false;
	}
	
	@Override
	public Admin getAdminLogin(Admin admin) {
		
		admin = adminDao.selectAdminInfo(admin);
		
		return admin;
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
	
	// 관리자 회원 목록 페이징 처리
	@Override
	public Paging getPagingMember(int curPage) {
		
		// 회원 목록 조회
		int totalCount = adminDao.selectCntMember();
		
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
	
	// 관리자 1:1 목록 페이징 처리
	@Override
	public Paging getPagingInquiry(int curPage) {
		
		// 1:1 문의 목록 조회
		int totalCount = adminDao.selectCntInquiry();
		
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
	
	// 관리자 방 목록 조회
	@Override
	public List<Room> roomList(Paging paging) {
		
		return adminDao.selectRoomList(paging);
	}

	// 관리자 회원 목록 조회
	@Override
	public List<Member> memberList(Paging paging) {
		
		return adminDao.selectMemberList(paging);
	}
	
	// 관리자 결제 목록 조회
	@Override
	public List<Payment> paymentList(Paging paging) {
		
		return adminDao.selectPaymentList(paging);
	}
	
	// 관리자 1:1 목록 조회
	@Override
	public List<Inquiry> inquiryList(Paging paging) {
		
		return adminDao.selectInquiryList(paging);
	}
	
	// 관리자 공지사항 목록 조회
	@Override
	public List<Notice> noticeList(Paging paging) {
		
		return adminDao.selectNoticeList(paging);
	}

	// 관리자 Q&A 목록 조회
	@Override
	public List<QnA> qnaList(Paging paging) {
		
		return adminDao.selectQnAList(paging);
	}

	// 관리자 회원 상세 조회
	@Override
	public Member memberDetailView(Member member) {
		
		return adminDao.selectMemberDetail(member);
	}
	
	// 관리자 결제 상세 조회
	@Override
	public Payment paymentDetailView(Payment payment) {
		
		return adminDao.selectPaymentDetail(payment);
	}
	
	// 관리자 공지사항 상세 조회
	@Override
	public Notice noticeDetailView(Notice viewNotice) {
		
		adminDao.updateNoticeHit(viewNotice);
		
		return adminDao.selelctNoticeView(viewNotice);
	}
	
	// 관리자 Q&A 상세 조회
	@Override
	public QnA qnaDetailView(QnA viewQna) {
		
		return adminDao.selelctdQnaView(viewQna);
	}
	
	// 관리자 공지사항 작성
	@Override
	public void noticeWrite(Notice notice, MultipartFile file) {
		
		logger.info("NoticeWrite Impl 1 - {}", notice);
		logger.info("NoticeWrite Impl 1 - {}", file);
		
		// 공지사항 처리
		if( "".equals( notice.getNoticeTitle() ) ) {
			notice.setNoticeTitle("(제목없음)");
		}
		
		logger.info("NoticeWrite Impl 2 - {}", notice);
		logger.info("NoticeWrite Impl 2 - {}", file);

		adminDao.insertNotice(notice);
		
		// 첨부파일 처리
		
		// 빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 첨부파일 정보 DB 기록
		CsFile csFile = new CsFile();
		csFile.setNoticeNo( notice.getNoticeNo() );
		csFile.setOriginName(originName);
		csFile.setStoredName(storedName);
		
		adminDao.insertNoticeFile(csFile);
	}
	
	// 관리자 공지사항 수정
	@Override
	public void noticeModify(Notice notice, MultipartFile file) {
		
		logger.info("NoticeModify Impl 1 - {}", notice);
		
		// 공지사항 처리
		if( "".equals( notice.getNoticeTitle() ) ) {
			notice.setNoticeTitle("(제목없음)");
		}
		
		logger.info("NoticeModify Impl 2 - {}", notice);
		logger.info("NoticeModify Impl 2 - {}", file);

		adminDao.updateNotice(notice);
		
		// 첨부파일 처리
		
		// 빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 첨부파일 정보 DB 기록
		CsFile csFile = new CsFile();
		csFile.setNoticeNo( notice.getNoticeNo());
		csFile.setOriginName(originName);
		csFile.setStoredName(storedName);
		
		// 공지사항에 연결된 첨부파일 삭제
		adminDao.deleteNoticeFile(notice);
		
		adminDao.insertNoticeFile(csFile);
	}
	
	// 관리자 공지사항 삭제
	@Override
	public void noticeDelete(Notice notice) {
		
		// 공지사항 삭제
		adminDao.deleteNotice(notice);
	}

	// 관리자 Q&A 작성
	@Override
	public void qnaWrite(QnA qna, MultipartFile file) {
		
		logger.info("QnaWrite Impl 1 - {}", qna);
		logger.info("QnaWrite Impl 1 - {}", file);
		
		// Q&A 처리
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}
		
		logger.info("QnaWrite Impl 2 - {}", qna);
		logger.info("QnaWrite Impl 2 - {}", file);

		adminDao.insertQna(qna);
		
		// 첨부파일 처리
		
		// 빈파일
		if( file.getSize() <= 0 ) {
			return;
		}

		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 첨부파일 정보 DB 기록
		CsFile csFile = new CsFile();
		csFile.setQnaNo( qna.getQnaNo() );
		csFile.setOriginName(originName);
		csFile.setStoredName(storedName);
		
//		adminDao.insertQnaFile(csFile);
	}
	
	// 관리자 Q&A 수정
	@Override
	public void qnaModify(QnA qna, MultipartFile file) {
		
		logger.info("QnaModify Impl 1 - {}", qna);
		logger.info("QnaModify Impl 1 - {}", file);
		
		// Q&A 처리
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}
		
		logger.info("QnaModify Impl 2 - {}", qna);
		logger.info("QnaModify Impl 2 - {}", file);

		adminDao.updateQna(qna);
		
		// 첨부파일 처리
		
		// 빈 파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		// 파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 첨부파일 정보 DB 기록
		CsFile csFile = new CsFile();
		csFile.setQnaNo( qna.getQnaNo());
		csFile.setOriginName(originName);
		csFile.setStoredName(storedName);
		
		// 공지사항에 연결된 첨부파일 삭제
//		adminDao.deleteQnaFile(qna);
		
//		adminDao.insertQnaFile(csFile);
	}

	// 관리자 Q&A 삭제
	@Override
	public void qnaDelete(QnA qna) {
		
		// Q&A 삭제
		adminDao.deleteQna(qna);
	}

	@Override
	public CsFile getFile(CsFile csFile) {
		
		return adminDao.selectCsFileByCsFileNo(csFile);
	}

	@Override
	public Object getSearchPaging(Search search) {
		
		return adminDao.getSearchPaging(search);
	}

	@Override
	public int getTotal(Search search) {
		
		return adminDao.getTotal(search);
	}

	@Override
	public CsFile getNoticeFile(Notice viewNotice) {
		return adminDao.selelctCsFileByNoticeNo(viewNotice);
	}

	@Override
	public CsFile getQnaFile(QnA viewQna) {
		return adminDao.selelctCsFileByQnaNo(viewQna);
	}
}