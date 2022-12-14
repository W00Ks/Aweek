package cs.dao.face;

import java.util.List;

import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;

public interface CsDao {

	/**
	 * 공지사항 리스트 조회하기
	 * 
	 * @return List<Notice> - 공지사항 리스트
	 */
	public List<Notice> selectNoticeAll();

	/**
	 * 자주하는 질문 리스트 불러오기
	 * 
	 * @return List<QnA> - 자주하는 질문 리스트
	 */
	public List<QnA> selectQnAAll();

	/**
	 * 1대1 질문 작성
	 * 
	 * @param inquiry - 1대1 질문 객체
	 */
	public void insertInquiry(Inquiry inquiry);

}
