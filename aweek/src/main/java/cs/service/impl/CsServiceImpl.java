package cs.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import common.Paging;
import cs.dao.face.CsDao;
import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import cs.dto.QnACategory;
import cs.service.face.CsService;

@Service
public class CsServiceImpl implements CsService {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsDao csDao;
	
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = csDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Notice> getNoticeList(Paging paging) {

		List<Notice> noticeList = csDao.selectNoticeAll(paging);
		
		return noticeList;
	}
	
	@Override
	public Notice getNoticeView(Notice notice) {

		csDao.updateNoticeHit(notice);
		
		return csDao.selectNoticeDetail(notice);
	}
	
	@Override
	public List<QnACategory> getQnACategoryList() {

		List<QnACategory> qnaCategoryList = csDao.selectQnACategoryAll();
		return qnaCategoryList;
	}
	
	@Override
	public List<QnA> getQnAList() {

		List<QnA> qnaList = csDao.selectQnAAll();
		return qnaList;
	}
	
	@Override
	public List<QnA> getQnAListEqualCaNo(int qnaCategoryNo) {

		List<QnA> qnaList = csDao.selectQnAEqualCaNo(qnaCategoryNo);
		return qnaList;
	}
	
	@Override
	public void createInquiry(Inquiry inquiry) {
		csDao.insertInquiry(inquiry);
	}
}
