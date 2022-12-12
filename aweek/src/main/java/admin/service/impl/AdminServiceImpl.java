package admin.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.dao.face.AdminDao;
import admin.dto.Admin;
import admin.service.face.AdminService;
import common.Paging;
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
	public Paging getPaging(int curPage) {
		
		// 총 게시글 수 조회
		int totalCount = adminDao.selectCntAll();
		
		// 페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<Member> memberList(Paging paging) {
		
		return adminDao.selectMemberList(paging);
	}
	
	@Override
	public List<Room> roomList(Paging paging) {
		
		return adminDao.selectRoomList(paging);
	}
	
	@Override
	public List<Payment> paymentList(Paging paging) {
		
		return adminDao.selectPaymentList(paging);
	}
	
	@Override
	public List<Notice> noticeList(Paging paging) {
		
		return adminDao.selectNoticeList(paging);
	}
	
	@Override
	public List<Inquiry> inquiryList(Paging paging) {

		return adminDao.selectInquiryList(paging);
	}
	
	@Override
	public List<QnA> qnaList(Paging paging) {
		
		return adminDao.selectQnAList(paging);
	}

	@Override
	public Member memberDetailView(Member member) {
		
		return adminDao.selectMemberDetail(member);
	}
	
	@Override
	public Payment paymentDetailView(Payment payment) {
		
		return adminDao.selectPaymentDetail(payment);
	}
	
	@Override
	public Notice noticeView(Notice viewNotice) {
		
		adminDao.updateNoticeHit(viewNotice);
		
		return adminDao.selelctNoticeView(viewNotice);
	}
	
	@Override
	public void noticeWrite(Notice notice) {
		
		// 공지사항 처리
		if( "".equals( notice.getNoticeTitle() ) ) {
			notice.setNoticeTitle("(제목없음");
		}
		adminDao.insertNotice(notice);
	}
	
	@Override
	public void noticeModify(Notice notice) {
		
		// 공지사항 처리
		if( "".equals( notice.getNoticeTitle() ) ) {
			notice.setNoticeTitle("(제목없음)");
		}
		adminDao.updateNotice(notice);
	}
	
	@Override
	public void noticeDelete(Notice notice) {
		
		// 공지사항 삭제
		adminDao.deleteNotice(notice);
	}
	
	@Override
	public QnA qnaView(QnA qna) {
		
		return adminDao.selelctdQnaView(qna);
	}
	
	@Override
	public void qnaWrite(QnA qna) {
		
		// Q&A 처리
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}
		adminDao.insertQna(qna);
	}
	
	@Override
	public void qnaModify(QnA qna) {
		
		// Q&A 처리
		if( "".equals( qna.getQnaTitle() ) ) {
			qna.setQnaTitle("(제목없음)");
		}
		adminDao.updateQna(qna);
	}

	@Override
	public void qnaDelete(QnA qna) {
		
		// Q&A 삭제
		adminDao.deleteQna(qna);
	}
}