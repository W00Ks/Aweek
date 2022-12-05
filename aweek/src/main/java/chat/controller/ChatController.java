package chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import chat.dto.Chat;
import chat.dto.ChatCreatRoomInfo;
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
	public void chatLogin() {}
	
	@RequestMapping("/main") 
	public void chatMain(int userno, HttpSession session, Model model) {
		session.setAttribute("userNo", userno); //테스트용 세션 설정
		session.removeAttribute("chatRoomNo");
		//회원 번호 가져오기
		int userNo = (int) session.getAttribute("userNo");
		logger.info("userNo - {}", userNo);
		
		//회원의 전체 채팅방 목록 조회
		List<ChatRoom> chatRoomList = chatService.getChatRoomList(userNo);
		logger.info("chatRoomList - {}", chatRoomList);
		
		//회원이 가입한 모임 목록 조회
		List<ChatCreatRoomInfo> roomList = chatService.getRoomList(userNo);
		logger.info("roomList - {}", roomList);
		
		model.addAttribute("chatList", chatRoomList);
		model.addAttribute("roomList", roomList);
	}
	
	@PostMapping("/create")
	@ResponseBody
	public int chatCreate(ChatRoom chatRoom, HttpSession session, Model model) {
		logger.info("{}", chatRoom);
		
		int userNo = (int) session.getAttribute("userNo");
		
		//채팅방 생성
		int result = chatService.createChatRoom(chatRoom, userNo);
		
		return result;
	}
	
	@RequestMapping("/delete")
	public void chatDelete() {
		
	}
	
	@RequestMapping("/enter")
	public void chatEnter(int chatRoomNo, HttpSession session, Model model) {
		
		session.setAttribute("chatRoomNo", chatRoomNo);

		Member member = chatService.getUserInfo((int)session.getAttribute("userNo"));
		model.addAttribute("member", member);
		
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public int chatInsert(Chat chat, HttpSession session) {
		logger.info("insert chat : {}", chat);
		int userNo = (int)session.getAttribute("userNo");
		int result = chatService.saveMessage(chat, userNo);
		
		return result;
	}
	
}


























