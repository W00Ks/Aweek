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
	
	//서비스 객체
	@Autowired private ChatService chatService;
	
	@RequestMapping("/login")
	public void chatLogin() {}
	
	@RequestMapping("/main") 
	public void chatMain(HttpSession session, Model model) {
		//세션에 저장하고 사용하던 채팅방 번호 초기화
		session.removeAttribute("chatRoomNo");
		
		//세션의 회원 번호
		int userNo = (int) session.getAttribute("userNo");
		logger.info("+ userNo : {}", userNo);
		
		//회원의 전체 채팅방 목록 조회
		List<ChatRoom> chatRoomList = chatService.getChatRoomList(userNo);
		logger.info("+ chatRoomList : {}", chatRoomList);
		
		//회원이 가입한 모임 목록 조회
		List<ChatCreatRoomInfo> roomList = chatService.getRoomList(userNo);
		logger.info("+ roomList : {}", roomList);
		
		//모임별 가입한 유저 전체목록 조회
		List<ChatCreatRoomInfo> roomJoinMemberList = chatService.getRoomJoinList(userNo);
		logger.info("+ roomJoinMemberList : {}", roomJoinMemberList);
		
		//모델 값 전달
		model.addAttribute("chatList", chatRoomList);
		model.addAttribute("roomList", roomList);
		model.addAttribute("roomJoinMemberList", roomJoinMemberList);
		
	}
	
	@ResponseBody
	@PostMapping("/create")
	public int chatCreate(ChatRoom chatRoom, int inviteUserNo, HttpSession session, Model model) {
		logger.info("+ Create Chat Room : {}", chatRoom);
		logger.info("+ inviteUserNo : {}", inviteUserNo);
		
		//회원 번호
		int userNo = (int) session.getAttribute("userNo");
		
		//채팅방 생성
		int result = chatService.createChatRoom(chatRoom, userNo, inviteUserNo);
		
		//AJAX 결과 반환
		return result;
	}
	
	@RequestMapping("/delete")
	public void chatDelete() {}
	
	@RequestMapping("/enter")
	public void chatEnter(int chatRoomNo, HttpSession session, Model model) {
		logger.info("+ Enter Chat Room >> chatRoomNo : {}", chatRoomNo);
		
		//채팅방 번호 session에 저장
		session.setAttribute("chatRoomNo", chatRoomNo);
		
		//회원 번호
		int userNo = (int)session.getAttribute("userNo");
		
		//회원 정보 조회
		Member member = chatService.getUserInfo(userNo);
		logger.info("+ Member DTO : {}", member);
		
		//채팅 내역 조회
		List<Chat> chatHistory = chatService.getChatHistory(chatRoomNo, userNo);  
		logger.info("+ chatRoomNo : {}", chatRoomNo);
		logger.info("+ chatHistory : {}", chatHistory);
		
		//회원의 프로필 사진 조회
		ChatProfile chatProfile = chatService.getProfileInfo(userNo);
		logger.info("+ chatProfile : {}", chatProfile);
		
		//모델 값 전달
		model.addAttribute("member", member);
		model.addAttribute("chatHistory", chatHistory);
		model.addAttribute("chatProfile", chatProfile);
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public int chatInsert(Chat chat, HttpSession session) {
		logger.info("+ Insert chat message : {}", chat);
		
		//회원 번호
		int userNo = (int)session.getAttribute("userNo");
		
		//전송된 채팅을 DB에 저장
		int result = chatService.saveMessage(chat, userNo);
		
		//INSERT 결과 전달
		return result;
	}
	
	@RequestMapping("/mainRight")
	public void chatMainRight() {
		logger.info("+ Leave Chat Room...");
	}
	
	@ResponseBody
	@PostMapping("/fileUpload")
	public ChatFile fileUpload(HttpSession session, MultipartFile file) {
		logger.info("+ file : {}", file);
		
		//회원 번호
		int userNo = (int)session.getAttribute("userNo");
		
		//채팅방 번호
		int chatRoomNo = (int)session.getAttribute("chatRoomNo");
		
		//파일 업로드 후 성공 시 정보 반환
		ChatFile chatFile = chatService.chatFileUpload(file, chatRoomNo, userNo);
		
		//AJAX 결과 전달
		return chatFile;
	}
	
	@RequestMapping("/fileDownload")
	public String fileDownload(ChatFile chatFile, Model model) {
		
		//첨부파일 정보 객체
		chatFile = chatService.getFile(chatFile);
		logger.debug("+ chatFile : {}", chatFile);
		
		//모델값 전달
		model.addAttribute("downFile", chatFile);
		
		return "chatDown";
	}
	
	@ResponseBody
	@PostMapping("/profileUpload")
	public ChatProfile profileUpload(HttpSession session, MultipartFile file) {
		logger.info("+ profile file : {}", file);
		
		//프로필 파일 DB에 저장
		ChatProfile chatProfile = chatService.profileUpload(file, session);
		logger.info("chatProfile {}", chatProfile);
		
		//AJAX 결과 반환
		return chatProfile;
	}
	
}


























