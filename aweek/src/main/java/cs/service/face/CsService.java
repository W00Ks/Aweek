package cs.service.face;

import java.util.List;

import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;

public interface CsService {

	/**
	 * 공지사항 리스트 불러오기
	 * 
	 * @return List<Notice> - 공지사항 리스트
	 */
	public List<Notice> getNoticeList();

	/**
	 * 공지사항 상세보기
	 * 
	 * @param notice - 공지사항 객체
	 * @return Notice - 공지사항 객체
	 */
	public Notice getNoticeView(Notice notice);
	
	/**
	 * 자주하는 질문 리스트 불러오기
	 * 
	 * @return List<QnA> - 자주하는 질문 리스트
	 */
	public List<QnA> getQnAList();

	/**
	 * 1대1 질문 작성
	 * 
	 * @param inquiry - 1대1 질문 객체
	 */
	public void createInquiry(Inquiry inquiry);


	

	
}
