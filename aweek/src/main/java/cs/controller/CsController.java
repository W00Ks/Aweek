package cs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import cs.dto.Inquiry;
import cs.dto.Notice;
import cs.dto.QnA;
import cs.dto.QnACategory;
import cs.service.face.CsService;
import member.dto.Member;

@Controller
@RequestMapping("/cs")
public class CsController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsService csService;
	
	@RequestMapping("/notice")
	public void notice(HttpSession session, Model model) {
		
		//로그인 후 userNo저장
		session.getAttribute("userNo");
		
		//공지사항 리스트 불러오기
		List<Notice> noticeList = csService.getNoticeList();
//		logger.info("noticeList : {}", noticeList);
		model.addAttribute("noticeList", noticeList);
		
	}
	
	@RequestMapping("/noticeView")
	public void noticeView(HttpSession session, Model model, Notice notice) {
		
		//로그인 후 userNo저장
		session.getAttribute("userNo");
		
		//공지사항 상세보기
		notice = csService.getNoticeView(notice);
		model.addAttribute("notice", notice);
	}
	
	@RequestMapping("/qna")
	public void qna(HttpSession session, Model model) {
		
		//로그인 후 userNo저장
		session.getAttribute("userNo");
		
		List<QnACategory> qnaCategoryList = csService.getQnACategoryList();
		model.addAttribute("qnaCategoryList",qnaCategoryList);
		
		//자주하는 질문 리스트 불러오기
		List<QnA> qnaList = csService.getQnAList();
		logger.info("qnaList : {}", qnaList);
		model.addAttribute("qnaList", qnaList);
		
	}
	@GetMapping("/inquiry")
	public void inquiry(HttpSession session) {
		
		//로그인 후 userNo저장
		session.getAttribute("userNo");
				
	}
	@PostMapping("/inquiry")
	public String inquiryProc(HttpSession session, Inquiry inquiry) {
		
		session.getAttribute("userNo");
		
		csService.createInquiry(inquiry);
		return "/member/myInquiry";
		
	}
	
}
