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
import cs.service.face.CsService;
import member.dto.Member;

@Controller
@RequestMapping("/cs")
public class CsController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CsService csService;
	
	@RequestMapping("/notice")
	public void notice(HttpSession session, Model model, Member member) {
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		int userno = (int) session.getAttribute("userNo");
		logger.info("userno : {}",userno);
		
		//공지사항 리스트 불러오기
		List<Notice> noticeList = csService.getNoticeList();
		logger.info("noticeList : {}", noticeList);
		model.addAttribute("noticeList", noticeList);
		
	}
	@RequestMapping("/noticeList")
	public void noticeList(HttpSession session, Model model, Member member) {
		
	}
	@RequestMapping("/qna")
	public void qna(HttpSession session, Model model, Member member) {
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
		
		//공지사항 리스트 불러오기
		List<QnA> qnaList = csService.getQnAList();
		logger.info("noticeList : {}", qnaList);
		model.addAttribute("noticeList", qnaList);
		
	}
	@GetMapping("/inquiry")
	public void inquiry(HttpSession session, Member member) {
		
		//로그인 후 userNo저장
		session.setAttribute("userNo", member.getUserNo());
				
	}
	@PostMapping("/inquiry")
	public void inquiryProc(HttpSession session, Model model, Member member) {
		
		Inquiry inquiry = new Inquiry();
		csService.createInquiry(inquiry);
		
		session.setAttribute("userNo", member.getUserNo());
		
	}
	
}
