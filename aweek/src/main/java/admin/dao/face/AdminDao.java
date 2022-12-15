package admin.dao.face;

import java.util.List;

import admin.dto.Admin;
import common.Paging;
import cs.dto.File;
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import member.dto.Member;
import payment.dto.Payment;
import room.dto.Room;

public interface AdminDao {

	/**
	 * 로그인 ID와 PW가 일치하는 관리자 찾기
	 * -> 로그인 인증에 활용함
	 * 
	 * @param admin - 조회할 ID와 PW 정보
	 * @return - 조회된 행 수
	 */
	public int selectAdmin(Admin adminParam);
	
	/**
	 * 로그인 ID와 PW가 일치하는 관리자 정보
	 * 
	 * @param admin - 조회할 ID와 PW 정보
	 * @return - 조회된 관리자
	 */
	public Admin selectAdminInfo(Admin admin);

	/**
	 * 전체 방 목록을 조회함
	 * 
	 * @return - 전체 방 목록 수
	 */
	public int selectCntRoom();
	
	/**
	 * 전체 회원 목록을 조회함
	 * 
	 * @return - 전체 회원 목록 수
	 */
	public int selectCntMember();
	
	/**
	 * 전체 결제 목록을 조회함
	 * 
	 * @return - 전체 결제 목록 수
	 */
	public int selectCntPayment();
	
	/**
	 * 전체 1:1 문의 목록을 조회함
	 * 
	 * @return - 전체 1:1 문의 목록 수
	 */
	public int selectCntInquiry();
	
	/**
	 * 전체 공지사항 목록을 조회함
	 * 
	 * @return - 전체 공지사항 목록 수
	 */
	public int selectCntNotice();
	
	/**
	 * 전체 Q&A 목록을 조회함
	 * 
	 * @return - 전체 Q&A 목록 수
	 */
	public int selectCntQnA();

	/**
	 * 페이징을 적용하여 회원 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 회원 목록
	 */
	public List<Member> selectMemberList(Paging paging);

	/**
	 * 페이징을 적용하여 방 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 방 목록
	 */
	public List<Room> selectRoomList(Paging paging);
	
	/**
	 * 페이징을 적용하여 결제 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 결제 목록
	 */
	public List<Payment> selectPaymentList(Paging paging);
	
	/**
	 * 페이징을 적용하여 공지사항 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 공지사항 목록
	 */

	public List<Notice> selectNoticeList(Paging paging);
	
	/**
	 * 페이징을 적용하여 Q&A 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 Q&A 목록
	 */
	public List<QnA> selectQnAList(Paging paging);
	
	/**
	 * 페이징을 적용하여 1:1 문의 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 1:1 문의 목록
	 */
	public List<Inquiry> selectInquiryList(Paging paging);
	
	/**
	 * 회원 번호를 이용하여 회원 내역을 조회
	 * 
	 * @param member - 조회하려는 회원 번호
	 * @return - 조회된 회원 정보
	 */
	public Member selectMemberDetail(Member member);

	/**
	 * 결제 번호를 이용하여 결제 내역을 조회
	 * 
	 * @param payment - 조회하려는 결제 번호
	 * @return - 조회된 결제 정보
	 */
	public Payment selectPaymentDetail(Payment payment);
	
	/**
	 * 공지사항 번호를 이용하여 공지사항을 조회
	 * 
	 * @param viewNotice - 조회하려는 공지사항 번호
	 * @return - 조회된 공지사항 번호
	 */
	public Notice selelctNoticeView(Notice viewNotice);
	
	/**
	 * Q&A 번호를 이용하여 Q&A를 조회
	 * 
	 * @param qna - 조회하려는 Q&A 번호
	 * @return - 조회된 Q&A 번호
	 */
	public QnA selelctdQnaView(QnA qna);
	
	/**
	 * 조회하려는 공지사항의 조회수를 1 증가시킴
	 * 
	 * @param viewNotice - 조회된 공지사항 번호
	 */
	public void updateNoticeHit(Notice viewNotice);

	/**
	 * 공지사항 정보를 삽입
	 * 
	 * @param notice - 삽입할 공지사항 정보
	 */
	public void insertNotice(Notice notice);

	/**
	 * 공지사항 정보를 수정
	 * 
	 * @param notice - 수정할 공지사항 정보
	 */
	public void updateNotice(Notice notice);

	/**
	 * 공지사항 삭제
	 * 
	 * @param notice - 삭제할 공지사항 정보
	 */
	public void deleteNotice(Notice notice);

	/**
	 * Q&A 정보를 삽입
	 * 
	 * @param qna - 삽입할 Q&A 정보
	 */
	public void insertQna(QnA qna);

	/**
	 * Q&A 정보를 수정
	 * 
	 * @param qna - 수정할 Q&A 정보
	 */
	public void updateQna(QnA qna);

	/**
	 * Q&A 삭제
	 * 
	 * @param qna - 삭제할 Q&A 정보
	 */
	public void deleteQna(QnA qna);

	/**
	 * 회원 검색 기능
	 * 
	 * @param memberSelect
	 * @param keyword
	 * @return
	 */
	public List<Member> memberSearch(Member member);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회
	 * 
	 * @param file - 조회할 첨부파일 객체
	 * @return - 조회된 첨부파일 정보
	 */
	public File selectCsFileByCsFileNo(File file);
	
	/**
	 * 공지사항 번호를 이용하여 첨부파일 정보를 조회
	 * 
	 * @param viewNotice - 조회된 공지사항 번호
	 * @return - 조회된 첨부파일 정보
	 */
	public File selelctNoticeFileByNoticeNo(Notice viewNotice);
}