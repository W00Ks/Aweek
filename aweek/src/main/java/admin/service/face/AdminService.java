package admin.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import admin.dto.Admin;
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

public interface AdminService {

	/**
	 * 로그인 인증 처리
	 * 
	 * @param admin - 입력한 ID와 PW 정보
	 * @return - 로그인 인증 결과
	 */
	public boolean AdminLogin(Admin admin);
	
	/**
	 * 로그인 관리자 정보 반환
	 * 
	 * @param admin - 입력한 ID와 PW 정보
	 * @return - 로그인한 관리자 정보
	 */
	public Admin getAdminLogin(Admin admin);
	
	/**
	 * 회원 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totakCount(회원 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public UserPaging getUserPaging(String curPage);
	
	/**
	 * 검색 회원 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(회원 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param userPaging - 페이징 정보 객체
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public UserPaging getSearchPaging(UserPaging userPaging, String curPage);

	/**
	 * 방 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(방 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingRoom(int curPage);
	
	/**
	 * 결제 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(결제 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingPayment(int curPage);
	
	/**
	 * 공지사항 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(공지사항 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingNotice(int curPage);
	
	/**
	 * Q&A 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(Q&A 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingQnA(int curPage);
	
	/**
	 * 1:1 문의 목록을 위한 페이징 객체를 생성함
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(1:1 문의 목록)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return - 계산이 완료된 Paging 객체
	 */
	public Paging getPagingInquiry(int curPage);
	
	/**
	 * 페이징이 적용된 회원 목록 조회
	 * 
	 * @param userPaging - 페이징 정보 객체
	 * @return - 페이징이 적용된 회원 목록
	 */
	public List<Member> memberList(UserPaging userPaging);
	
	/**
	 * 페이징이 적용된 검색 회원 목록
	 * 
	 * @param userPaging - 페이징 정보 객체
	 * @return - 페이징이 적용된 회원 목록
	 */
	public List<Member> memberSearchList(UserPaging userPaging);
	
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
	 * 페이징이 적용된 Q&A 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 Q&A 목록
	 */
	public List<QnA> qnaList(Paging paging);
	
	/**
	 * 페이징이 적용된 1:1 문의 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return - 페이징이 적용된 1:1 문의 목록
	 */
	public List<Inquiry> inquiryList(Paging paging);

	/**
	 * 회원 상세보기
	 * 
	 * @param member - 상세 조회할 회원 번호 객체
	 * @return - 조회된 상세 회원 객체
	 */
	public Member memberDetailView(Member member);
	
	/**
	 * 방 상세보기
	 * 
	 * @param room - 상세 조회할 방 번호 객체
	 * @return - 조회된 상세 방 객체
	 */
	public Room roomDetailView(Room room);
	
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
	 * @param viewNotice - 상세 조회할 공지사항 번호 객체
	 * @return - 조회된 상세 공지사항 객체
	 */
	public Notice noticeDetailView(Notice viewNotice);
	
	/**
	 * Q&A 상세보기
	 * 
	 * @param viewQna - 상세 조회할 Q&A 번호 객체
	 * @return - 조회된 상세 Q&A 객체
	 */
	public QnA qnaDetailView(QnA viewQna);

	/**
	 * 1:1 문의 상세보기
	 * 
	 * @param viewInquiry - 상세 조회할 1:1 문의 번호 조회
	 * @return - 조회된 상세 1:1 문의 객체
	 */
	public Inquiry inquiryDetailView(Inquiry viewInquiry);
	
	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보를 조회
	 * 
	 * @param csFile - 조회할 파일 번호 객체
	 * @return - 첨부파일 정보
	 */
	public CsFile getFile(CsFile csFile);

	/**
	 * 공지사항 정보, 첨부파일을 함께 처리
	 * 
	 * @param notice - 공지사항 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void noticeWrite(Notice notice, MultipartFile file);
	
	/**
	 * 공지사항 정보, 첨부파일을 함께 처리
	 * 
	 * @param notice - 공지사항 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void noticeModify(Notice notice, MultipartFile file);
	
	/**
	 * 공지사항 삭제 + 첨부파일 삭제
	 * 
	 * @param notice
	 */
	public void noticeDelete(Notice notice);

	/**
	 * 공지사항 번호를 이용하여 업로드된 파일 정보를 조회
	 * 
	 * @param viewNotice - 조회할 공지사항 번호 객체
	 * @return - 첨부파일 정보
	 */
	public CsFile getNoticeFile(Notice viewNotice);

	/**
	 * Q&A 정보, 첨부파일을 함께 처리
	 * 
	 * @param qna - Q&A 정보 객체
	 */
	public void qnaWrite(QnA qna);
	
	/**
	 * Q&A 정보, 첨부파일을 함께 처리
	 * 
	 * @param qna - Q&A 정보 객체
	 */
	public void qnaModify(QnA qna);

	/**
	 * Q&A 삭제 + 첨부파일 삭제
	 * 
	 * @param qna
	 */
	public void qnaDelete(QnA qna);

	/**
	 * Q&A 카테고리 리스트 불러오기
	 * 
	 * @return List<QnACategory> - Q&A 카테고리 리스트
	 */
	/* public List<QnACategory> qnaCategoryList(); */

//	/**
//	 * 회원 목록을 위한 페이징 객체를 생성함
//	 * 
//	 * 파라미터 curPage(현재 페이지)
//	 * DB에서 조회한 totalCount(회원 목록)
//	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환함
//	 * 
//	 * @param curPage - 요청 페이지 번호
//	 * @return - 계산이 완료된 Paging 객체
//	 */

//	public Paging getPagingMember(int curPage);
//	/**
//	 * 페이징이 적용된 회원 목록 조회
//	 * 
//	 * @param paging - 페이징 정보 객체
//	 * @return - 페이징이 적용된 회원 목록
//	 */
//	public List<Member> memberList(Paging paging);
}