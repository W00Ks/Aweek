package chat.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import chat.service.face.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {

	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	private ChatService chatService;
	
	@GetMapping("/login")
	public void chatLogin() {
		logger.info("/chat/login");
	}
	
	@PostMapping("/login")
	public String loginProc(String id, HttpSession session) {
		logger.info("/chat/loginProc");
		
		session.setAttribute("id", id);
		
		return "redirect:/chat/main";
	}
	
	
	
}


























