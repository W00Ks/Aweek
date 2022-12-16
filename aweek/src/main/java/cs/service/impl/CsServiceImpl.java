package cs.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Notice> getNoticeList() {

		List<Notice> noticeList = csDao.selectNoticeAll();
		
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
	public void createInquiry(Inquiry inquiry) {
		csDao.insertInquiry(inquiry);
	}
}
