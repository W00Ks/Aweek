package cs.service.face;

import java.util.List;

import common.Paging;
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import cs.dto.QnACategory;

public interface CsService {

	/**
	 * 페이징
	 * 
	 * @param curPage
	 * @return
	 */
	public Paging getPaging(int curPage);
	/**
	 * 공지사항 리스트 불러오기
	 * @param paging 
	 * 
	 * @return List<Notice> - 공지사항 리스트
	 */
	public List<Notice> getNoticeList(Paging paging);

	/**
	 * 공지사항 상세보기
	 * 
	 * @param notice - 공지사항 객체
	 * @return Notice - 공지사항 객체
	 */
	public Notice getNoticeView(Notice notice);
	
	/**
	 * 자주하는 질문 카테고리 리스트 불러오기
	 * 
	 * @return List<QnACategory> - 자주하는 질문 카테고리 리스트
	 */
	public List<QnACategory> getQnACategoryList();
	
	/**
	 * 자주하는 질문 리스트 불러오기
	 * 
	 * @return List<QnA> - 자주하는 질문 리스트
	 */
	public List<QnA> getQnAList();

	/**
	 * 카테고리 번호에 해당하는 자주하는 질문 리스트 불러오기
	 * 
	 * @param qnaCategoryNo - 카테고리 번호
	 * @return List<QnA> - 자주하는 질문 리스트
	 */
	public List<QnA> getQnAListEqualCaNo(int qnaCategoryNo);
	/**
	 * 1대1 질문 작성
	 * 
	 * @param inquiry - 1대1 질문 객체
	 */
	public void createInquiry(Inquiry inquiry);





	

	
}
