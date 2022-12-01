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

import chat.service.face.ChatService;
import member.dto.Member;

@RequestMapping(value = "/replyEcho", method = RequestMethod.GET)
public class WebSocketHandler extends TextWebSocketHandler {
		
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ChatService chatService;
	
	List<WebSocketSession> sessionsList = new ArrayList<>();
	
	// Key : WebSocketSession, Value : roomNo
	Map<WebSocketSession, Integer> roomSessions = new HashMap<>();
	
	// Key : userId, Value : WebSocketSession
	Map<String, WebSocketSession> idSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionsList.add(session);
		if(session.getAttributes().get("chatRoomNo") != null) {
			roomSessions.put(session, (int)session.getAttributes().get("chatRoomNo"));
			int chatRoomNo = (int) session.getAttributes().get("chatRoomNo"); //방번호
		
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			
			//유저 정보 가져오기
			Member member = chatService.getUserInfo(userNo);
			idSessions.put(member.getUserId(), session);
			
			logger.info("WebSocketSession ID : {}", session.getId());
			logger.info("{}님, {}번방에 연결", member.getUserId(), chatRoomNo);
			
			for(String key : idSessions.keySet()) {
				if(roomSessions.get(idSessions.get(key)) == chatRoomNo) { //같은 방 유저에게만 입장 메시지 전송
					idSessions.get(key).sendMessage(new TextMessage("---- " + member.getUserId() + "님이 입장하셨습니다. ----"));
				}
			}
		}
		
//		for(WebSocketSession sess : sessionsList) {
//			if(userSessions.get(sess) == chatRoomNo) { //같은 방 유저에게만 입장 메시지 전송
//				sess.sendMessage(new TextMessage("---- " + member.getUserId() + "님이 입장하셨습니다. ----"));
//			}
//		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		if(session.getAttributes().get("chatRoomNo") != null) {
			int chatRoomNo = (int) session.getAttributes().get("chatRoomNo"); //방번호
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			
			//유저 정보 가져오기
			Member member = chatService.getUserInfo(userNo);
			idSessions.put(member.getUserId(), session);
			
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
			logger.info("{}님, {}번방에 메시지 보냄", member.getUserId(), chatRoomNo);
			
			for(String key : idSessions.keySet()) {
				if(roomSessions.get(idSessions.get(key)) == chatRoomNo) { //같은 방 유저에게만 입장 메시지 전송
					idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + ": " + message.getPayload()));
				}
			}
		} else {
//			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			logger.info("들어옴");
			//유저 정보 가져오기
//			Member member = chatService.getUserInfo(userNo);
//			idSessions.put(member.getUserId(), session);
			
			logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
//			logger.info("{}님, {}번방에 메시지 보냄", member.getUserId(), chatRoomNo);
			
			for(WebSocketSession sess : sessionsList) {
				logger.info(sess.toString());
				sess.sendMessage(new TextMessage("방 생성 메시지:" + message.getPayload()));
			}
		}
		
//		for(WebSocketSession sess : sessionsList) {
//			if(userSessions.get(sess) == chatRoomNo) { //같은 방 유저에게만 메시지 전송
//				sess.sendMessage(new TextMessage(member.getUserId() + ": " + message.getPayload()));
//			}
//		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
		
		sessionsList.remove(session);
		roomSessions.remove(session);
		
		//유저 정보 가져오기
		Member member = chatService.getUserInfo(userNo);
		idSessions.remove(member.getUserId());
		
		//세션에 roomNo 지우기
		session.getAttributes().remove("chatRoomNo");
		
		logger.info("{} 연결 끊김.", session.getId());
	}
		
}
