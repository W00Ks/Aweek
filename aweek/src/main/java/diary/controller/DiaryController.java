package diary.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import diary.service.face.DiaryService;
import member.dto.Member;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired DiaryService diaryService;
	
	@GetMapping("/login")
	public void diaryLogin() {}
	
	@PostMapping("/login")
	public String diaryLoginProc(Member member, HttpSession session) {
		logger.trace("##### login member : {}", member);
		
		boolean loginResult = diaryService.login(member);
		
		if( loginResult ) {
			
			member = diaryService.userInfo(member);
			
			logger.trace("##### userInfo : {}", member);
			
			session.setAttribute("loginResult", loginResult);
			session.setAttribute("userNo", member.getUserNo());
			session.setAttribute("userId", member.getUserId());
			
			return "redirect:/diary/main";
			
		} else {
			
			session.invalidate();
			
			return "redirect:/diary/login";
		}

	}
	
	@GetMapping("/fail")
	public void diaryFail() {
		
	}
	
	@GetMapping("/main")
	public void diaryMain() {
		
	}

}
