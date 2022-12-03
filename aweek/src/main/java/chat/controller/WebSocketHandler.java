package chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import chat.dto.ChatList;
import chat.service.face.ChatService;
import member.dto.Member;

@RequestMapping(value = "/replyEcho", method = RequestMethod.GET)
public class WebSocketHandler extends TextWebSocketHandler {
		
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ChatService chatService;
	
	List<WebSocketSession> sessionsList = new ArrayList<>();
	
	// Key : WebSocketSession, Value : chatRoomNo
	Map<WebSocketSession, Integer> chatRoomSessions = new HashMap<>();
	
	// Key : userId, Value : WebSocketSession
	Map<String, WebSocketSession> idSessions = new HashMap<>();
	
	// Key : WebSocketSession, Value : userId
//	Map<WebSocketSession, String> roomSessions = new HashMap<>();
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//List에 WebSocketSession 저장 
		sessionsList.add(session);
		
		//채팅 관련 메시지일 때
		if(session.getAttributes().get("chatRoomNo") != null) { 
			//HttpSesssion에서 저장된 정보 가져오기
			int chatRoomNo = (int) session.getAttributes().get("chatRoomNo"); //방 번호
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			logger.info("chatRoomNo : {}", chatRoomNo);
			logger.info("채팅쪽 session, chatRoomNo : {}, {}", session, chatRoomNo);
			//방정보 세션 Map에 방 번호 저장
			chatRoomSessions.put(session, chatRoomNo); 
			
			//해당 유저번호를 이용해 회원정보 가져오기
			Member member = chatService.getUserInfo(userNo);
			
			//유저 정보 세션 Map에 유저 아이디 저장
			idSessions.put(member.getUserId(), session);
			
			logger.info("### WebSocketSession ID : {}", session.getId());
			logger.info("### {}님, {}번방에 연결", member.getUserId(), chatRoomNo);
			
			//메시지 보내기
			for(String key : idSessions.keySet()) {
				logger.info("### 확인{}, {}", session, idSessions.get(key));
				logger.info("### session{}, {}", chatRoomSessions.get(session), idSessions.get(key));
				if(chatRoomSessions.get(idSessions.get(key)) == chatRoomNo) { //같은 방 유저에게만 입장 메시지 전송
					idSessions.get(key).sendMessage(new TextMessage("---- " + member.getUserId() + "님이 입장하셨습니다. ---- "));
				}
			}
		} else {
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			logger.info("### 채팅 페이지에 들어옴.");
			logger.info("### WebSocketSession ID : {}", session.getId());
			
			//해당 유저번호를 이용해 회원정보 가져오기
			Member member = chatService.getUserInfo(userNo);
			
			//유저 정보 세션 Map에 유저 아이디 저장
			idSessions.put(member.getUserId(), session);
			chatRoomSessions.put(session, 1);
		}
		
//		for(WebSocketSession sess : sessionsList) {
//			if(userSessions.get(sess) == chatRoomNo) { //같은 방 유저에게만 입장 메시지 전송
//				sess.sendMessage(new TextMessage("---- " + member.getUserId() + "님이 입장하셨습니다. ----"));
//			}
//		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		
		//채팅 관련 메시지일 때
		if(session.getAttributes().get("chatRoomNo") != null && !message.getPayload().contains(":")) {
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			int chatRoomNo = (int) session.getAttributes().get("chatRoomNo"); //방번호
			
			//유저 정보 가져오기
			Member member = chatService.getUserInfo(userNo);
//			idSessions.put(member.getUserId(), session);
			
			logger.info("### {}로 부터 {} 받음", session.getId(), message.getPayload());
			logger.info("### {}님, {}번방에 메시지 보냄", member.getUserId(), chatRoomNo);
			
			//같은 방 유저에게만 입장 메시지 전송
			for(String key : idSessions.keySet()) {
				if(chatRoomSessions.get(idSessions.get(key)) == chatRoomNo) { 
					idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + ": " + message.getPayload()));
				}
			}
			
		} else {
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호

			logger.info("### 채팅방 생성 메시지.");
			logger.info("###  WebSocketSession ID - {}, 채팅방 이름:모임 번호:방 번호 - {}", session.getId(), message.getPayload());
			
			//유저 정보 가져오기
			Member member = chatService.getUserInfo(userNo);
//			idSessions.put(member.getUserId(), session);
			
			//전체 사용자에게 채팅방 생성
			for(String key : idSessions.keySet()) {
				if(key != member.getUserId()) {
					idSessions.get(key).sendMessage(new TextMessage("Create Room:" + message.getPayload()));
				}
			}
			
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
		
		sessionsList.remove(session);
		chatRoomSessions.remove(session);
		
		//유저 정보 가져오기
		Member member = chatService.getUserInfo(userNo);
		idSessions.remove(member.getUserId());
		
		//세션에 roomNo 지우기
		session.getAttributes().remove("chatRoomNo");
		
		logger.info("### {} 연결 끊김.", session.getId());
	}
		
}
