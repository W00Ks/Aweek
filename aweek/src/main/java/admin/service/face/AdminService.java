package admin.service.face;

import java.util.List;

import admin.dto.Admin;
import common.Paging;
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import member.dto.Member;
import payment.dto.Payment;
import room.dto.Room;

public interface AdminService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param admin - 입력한 ID와 PW 정보
	 * @return - 로그인 인증 결과
	 */
	public boolean AdminLogin(Admin admin);
	
	/**
	 * 게시글 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징이 적용된 회원 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 회원 목록
	 */
	public List<Member> memberList(Paging paging);

	/**
	 * 페이징이 적용된 방 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 방 목록
	 */
	public List<Room> roomList(Paging paging);
	
	/**
	 * 페이징이 적용된 결제 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 결제 목록
	 */
	public List<Payment> paymentList(Paging paging);
	
	/**
	 * 페이징이 적용된 공지사항 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 공지사항 목록
	 */
	public List<Notice> noticeList(Paging paging);
	
	/**
	 * 페이징이 적용된 1:1 문의 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 1:1 문의 목록
	 */
	public List<Inquiry> inquiryList(Paging paging);
	
	/**
	 * 페이징이 적용된 Q&A 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 Q&A 목록
	 */
	public List<QnA> qnaList(Paging paging);

	/**
	 * 회원 상세보기
	 * 
	 * @param member - 상세 조회할 회원 번호 객체
	 * @return - 조회된 상세 회원 객체
	 */
	public Member memberDetailView(Member member);
	
	/**
	 * 결제 상세보기
	 * 
	 * @param payment - 상세 조회할 결제 번호 객체
	 * @return - 조회된 상세 결제 객체
	 */
	public Payment paymentDetailView(Payment payment);
	
	/**
	 * 공지사항 상세보기
	 * 
	 * @param notice - 상세 조회할 공지사항 번호 객체
	 * @return - 조회된 상세 공지사항 객체
	 */
	public Notice noticeView(Notice viewNotice);

	/**
	 * 공지사항 정보, 첨부파일을 함께 처리
	 * 
	 * @param notice - 공지사항 정보 객체
	 */
	public void noticeWrite(Notice notice);
	
	/**
	 * 공지사항 정보, 첨부파일을 함께 처리
	 * 
	 * @param notice - 공지사항 정보 객체
	 */
	public void noticeModify(Notice notice);
	
	/**
	 * 공지사항 삭제 + 첨부파일 삭제
	 * 
	 * @param notice
	 */
	public void noticeDelete(Notice notice);
	
	/**
	 * Q&A 상세보기
	 * 
	 * @param qna - 상세 조회할 Q&A 번호 객체
	 * @return - 조회된 상세 Q&A 객체
	 */
	public QnA qnaView(QnA qna);
	
	/**
	 * Q&A 정보, 첨부파일을 함께 처리
	 * 
	 * @param qna - Q&A 정보 객체
	 */
	public void qnaWrite(QnA qna);
	
	/**
	 * Q&A 정보, 첨부파일을 함께 처리
	 * 
	 * @param qna
	 */
	public void qnaModify(QnA qna);

	/**
	 * Q&A 삭제 + 첨부파일 삭제
	 * 
	 * @param qna
	 */
	public void qnaDelete(QnA qna);
}