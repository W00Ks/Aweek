package chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import chat.dto.ChatList;
import chat.dto.ChatRoom;
import chat.service.face.ChatService;
import member.dto.Member;

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
	public void chatMain(int userno, HttpSession session, Model model) {
		logger.info("/chat/main");
		session.setAttribute("userNo", userno); //테스트용 세션 설정
		
		//회원 번호 가져오기
		int userNo = (int) session.getAttribute("userNo");
		logger.info("userNo {}", userNo);
		
		//전체 채팅방 목록 조회
		List<ChatRoom> chatRoomList = chatService.getChatRoomList(userNo);
		logger.info("{}", chatRoomList);
		
		model.addAttribute("chatList", chatRoomList);
	}
	
	@RequestMapping("/create")
	public void chatCreate() {
		logger.info("/chat/create");
		
	}
	
	@RequestMapping("/enter")
	public void chatEnter(int chatRoomNo, HttpSession session, Model model) {
		logger.info("/chat/enter");
		
		session.setAttribute("chatRoomNo", chatRoomNo);

		Member member = chatService.getUserInfo((int)session.getAttribute("userNo"));
		model.addAttribute("member", member);
		
	}
	
}


























