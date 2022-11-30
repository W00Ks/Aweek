package chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import chat.dto.ChatList;
import chat.service.face.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {

	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired private ChatService chatService;
	
	@RequestMapping("/login")
	public void chatLogin() {
		logger.info("/chat/login");
	}
	
	@RequestMapping("/main") 
	public void chatMain(String userno, HttpSession session) {
		logger.info("/chat/main");
		session.setAttribute("userno", userno); //테스트용 세션 설정
		
		//회원 번호 가져오기
		String userNo = (String) session.getAttribute("userno");
		List<ChatList> chatList = chatService.getChatList(userNo);
		for(ChatList cl : chatList) logger.info("chatList : {}", cl);
	}
	
	@RequestMapping("/create")
	public void chatCreate() {
		logger.info("/chat/create");
		
		
	}
	
}


























