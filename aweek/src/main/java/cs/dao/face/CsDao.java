package cs.dao.face;

import java.util.List;

import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import cs.dto.QnACategory;

public interface CsDao {

	/**
	 * 공지사항 리스트 조회하기
	 * 
	 * @return List<Notice> - 공지사항 리스트
	 */
	public List<Notice> selectNoticeAll();

	/**
	 * 공지사항 조회수 증가
	 * 
	 * @param notice
	 */
	public void updateNoticeHit(Notice notice);
	
	/**
	 * 공지사항 상세보기
	 * 
	 * @param notice - 공지사항 객체
	 * @return Notice - 공지사항 객체
	 */
	public Notice selectNoticeDetail(Notice notice);
	
	/**
	 * 자주하는 질문 카테고리 리스트 불러오기
	 * 
	 * @return List<QnACategory> - 자주하는 질문 카테고리 리스트
	 */
	public List<QnACategory> selectQnACategoryAll();

	/**
	 * 자주하는 질문 리스트 불러오기
	 * 
	 * @return List<QnA> - 자주하는 질문 리스트
	 */
	public List<QnA> selectQnAAll();

	/**
	 * 카테고리 번호에 해당하는 자주하는 질문 리스트 불러오기
	 * 
	 * @param qnaCategoryNo - 카테고리 번호
	 * @return List<QnA> - 자주하는 질문 리스트
	 */
	public List<QnA> selectQnAEqualCaNo(int qnaCategoryNo);
	/**
	 * 1대1 질문 작성
	 * 
	 * @param inquiry - 1대1 질문 객체
	 */
	public void insertInquiry(Inquiry inquiry);





}
