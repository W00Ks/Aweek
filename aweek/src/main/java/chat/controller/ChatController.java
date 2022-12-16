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
import org.springframework.web.multipart.MultipartFile;

import chat.dto.Chat;
import chat.dto.ChatCreatRoomInfo;
import chat.dto.ChatFile;
import chat.dto.ChatProfile;
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
	public void chatMain(HttpSession session, Model model) {
//		session.setAttribute("userNo", userno); //테스트용 세션 설정
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
		
		//모임별로 가입한 유저 전체목록 조회
		List<ChatCreatRoomInfo> roomJoinMemberList = chatService.getRoomJoinList(userNo);
		logger.info("roomJoinMemberList - {}", roomJoinMemberList);
		
		model.addAttribute("chatList", chatRoomList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomJoinMemberList", roomJoinMemberList);
		
	}
	
	@PostMapping("/create")
	@ResponseBody
	public int chatCreate(ChatRoom chatRoom, int inviteUserNo, HttpSession session, Model model) {
		logger.info("+ + + Create Chat Room - Info : {} + + +", chatRoom);
		logger.info("+ + + inviteUserNo - Info : {} + + +", inviteUserNo);
		
		int userNo = (int) session.getAttribute("userNo");
		
		//채팅방 생성
		int result = chatService.createChatRoom(chatRoom, userNo, inviteUserNo);
		
		return result;
	}
	
	@RequestMapping("/delete")
	public void chatDelete() {
		
	}
	
	@RequestMapping("/enter")
	public void chatEnter(int chatRoomNo, HttpSession session, Model model) {
		logger.info("+ + + Enter Chat Room - chatRoomNo : {} + + +", chatRoomNo);
		
		//회원 번호
		session.setAttribute("chatRoomNo", chatRoomNo);
		int userNo = (int)session.getAttribute("userNo");
		
		//회원 정보 조회
		Member member = chatService.getUserInfo(userNo);
		logger.info("member == {}", member);
		
		//채팅 내역 조회
		List<Chat> chatHistory = chatService.getChatHistory(chatRoomNo, userNo);  
		logger.info("채팅 내역 조회 : {}", chatHistory);
		logger.info("asdasdaschatRoomNo : {}", chatRoomNo);
		
		//회원의 프로필 사진 조회
		ChatProfile chatProfile = chatService.getProfileInfo(userNo);
		logger.info("chatProfile : {}", chatProfile);
		
		model.addAttribute("member", member);
		model.addAttribute("chatHistory", chatHistory);
		model.addAttribute("chatProfile", chatProfile);
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public int chatInsert(Chat chat, HttpSession session) {
		logger.info("+ + + Insert chat message : {} + + +", chat);
		int userNo = (int)session.getAttribute("userNo");
		int result = chatService.saveMessage(chat, userNo);
		
		return result;
	}
	
	@RequestMapping("/mainRight")
	public void chatMainRight() {
		logger.info("+ + + Leave Chat Room + + +");
	}
	
	@PostMapping("/fileUpload")
	@ResponseBody
	public ChatFile fileUpload(HttpSession session, MultipartFile file) {
		int userNo = (int)session.getAttribute("userNo");
		int chatRoomNo = (int)session.getAttribute("chatRoomNo");
		logger.info("{}", file);
		logger.info("chatRoomNo {}", chatRoomNo);
		
		ChatFile chatFile = chatService.chatFileUpload(file, chatRoomNo, userNo);
		
		return chatFile;
	}
	
	@RequestMapping("/fileDownload")
	public String fileDownload(ChatFile chatFile, Model model) {
		
		//첨부파일 정보 객체
		chatFile = chatService.getFile(chatFile);
		logger.debug("{}", chatFile);
		
		//모델값 전달
		model.addAttribute("downFile", chatFile);
		
		return "chatDown";
	}
	
	@PostMapping("/profileUpload")
	@ResponseBody
	public ChatProfile profileUpload(HttpSession session, MultipartFile file) {
		logger.info("{}", file);
		ChatProfile chatProfile = chatService.profileUpload(file, session);
		
		logger.info("chatProfile {}", chatProfile);
		return chatProfile;
	}
	
}


























