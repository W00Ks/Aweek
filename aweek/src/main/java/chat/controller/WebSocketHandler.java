package chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

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
	
	//서비스 객체
	@Autowired private ChatService chatService;
	
	//입장 시 WebSocketSession ID 저장할 List
	List<WebSocketSession> sessionsList = new ArrayList<>();
	
	// Key : WebSocketSession, Value : chatRoomNo
	Map<WebSocketSession, Integer> chatRoomSessions = new HashMap<>();
	
	// Key : userId, Value : WebSocketSession
	Map<String, WebSocketSession> idSessions = new HashMap<>();
	
	// Key : chatRoomNo+":"+userNo, Value : userId (중복 입장 처리용)
	Map<String, String> roomId = new HashMap<>();
	
	//메시지 보낸사람 ID를 담을 Stack
	Stack<String> stack = new Stack<String>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//List에 WebSocketSession 저장 
		sessionsList.add(session);
		
		//채팅 관련 메시지일 때
		if(session.getAttributes().get("chatRoomNo") != null) {
	
			//HttpSesssion에서 저장된 정보 가져오기
			
			//유저 번호
			int userNo = (int) session.getAttributes().get("userNo");
			
			//방 번호
			int chatRoomNo = (int) session.getAttributes().get("chatRoomNo");
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
			
			//스택에 쌓인 ID 초기화
			stack.clear();
			
			//메시지 보내기
			if(roomId.containsKey(chatRoomNo+":"+userNo)) {
				for(String key : idSessions.keySet()) {
					
					//해당 채팅방에 들어와 있지 않은 사람일 때 (첫 입장일 때)
					if(!member.getUserId().equals(roomId.get(chatRoomNo+":"+userNo))) {
						
						//같은 방 사람들에게만 보내기
						if(chatRoomSessions.get(idSessions.get(key)) == chatRoomNo) {
							idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + "님이 입장하셨습니다. " + chatRoomNo));
							
							//입장한 사람 Map에 저장 (중복 입장 처리용)
							roomId.put(chatRoomNo+":"+userNo, member.getUserId());
						}
					}
				}
			} else {
				for(String key : idSessions.keySet()) {
					if(chatRoomSessions.get(idSessions.get(key)) == chatRoomNo) {
						idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + "님이 입장하셨습니다. " + chatRoomNo));
					}
				}
				roomId.put(chatRoomNo+":"+userNo, member.getUserId());
			}
			
		} else {
			int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			logger.info("### 채팅 메인 페이지 입장");
			logger.info("### WebSocketSession ID : {}", session.getId());
			
			//해당 유저번호를 이용해 회원정보 가져오기
			Member member = chatService.getUserInfo(userNo);
			logger.info("### member : {}", member);
			
			//유저 정보 세션 Map에 유저 아이디 저장
			idSessions.put(member.getUserId(), session);
			chatRoomSessions.put(session, 1);
		}
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		int userNo = 0; 		//유저번호
		int chatRoomNo = 0;		//방번호
		Member member = null;	//유저 정보 객체
		
		//채팅 관련 메시지일 때
		if(session.getAttributes().get("chatRoomNo") != null && !message.getPayload().contains(":")) {
			
			userNo = (int) session.getAttributes().get("userNo"); //유저 번호
			chatRoomNo = (int) session.getAttributes().get("chatRoomNo"); //방번호
			
			//유저 정보 가져오기
			member = chatService.getUserInfo(userNo);
			
			logger.info("+ + + session.getId() : {}, message.getPayload() : {}", session.getId(), message.getPayload());
			logger.info("+ + + {}님, {}번방에 메시지 보냄", member.getUserId(), chatRoomNo);
			
			//메시지 보낸사람 추가
			stack.push(member.getUserId());
			
			//같은 방 유저에게만 메시지 전송
			for(String key : idSessions.keySet()) {
				if(chatRoomSessions.get(idSessions.get(key)) == chatRoomNo) {
					//일반 메시지일 때 처리
					if(!message.getPayload().contains(".png.emo")) {
						
						if(stack.size() > 1) {
							//전에 메시지 보낸 사람과 동일한지 검사 후 처리
							if(stack.get(stack.size()-2).equals(member.getUserId())) {
								//동일한 사람이면 'id' 추가
								idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + ":id" + ":" + message.getPayload() + ":" + chatRoomNo));
							} else {
								idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + ":" + message.getPayload() + ":" + chatRoomNo));
							}
						} else {
							idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + ":" + message.getPayload() + ":" + chatRoomNo));
						}
					
					//이미지 파일일 때 처리	
					} else {
						
						//.emo 제거하기
						String emoMsg = message.getPayload().replaceAll(".emo", "");
						
						//이모티콘 메시지
						idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + ":" + emoMsg + ":emoticon:" + chatRoomNo));
					}
				}
			}
			
		} else {
			
			userNo = (int) session.getAttributes().get("userNo"); //유저 번호
//			chatRoomNo = 0; //방번호
			
			//채팅 나가기 동작에서만 방번호 구하기
			String[] exitMsg = message.getPayload().split(":");
			if(exitMsg[0].equals("exit")) {
				//방번호 구하기
				chatRoomNo = (int) session.getAttributes().get("chatRoomNo");
			}
			
			logger.info("+ + + 채팅방 생성 메시지.");
			logger.info("+ + + WebSocketSession ID - {}, 채팅방 이름:모임 번호:방 번호:상대 ID - {}", session.getId(), message.getPayload());
			
			//유저 정보 가져오기
			member = chatService.getUserInfo(userNo);
			logger.info("+ + + member2 : {}", member);
			
			//전체 사용자에게 채팅방 생성
			for(String key : idSessions.keySet()) {
				
				//본인 제외 메시지 보내기
				if(key != member.getUserId()) {
					
					//나가기 이벤트가 아닐 경우
					if(!exitMsg[0].equals("exit")) {
						idSessions.get(key).sendMessage(new TextMessage("Create Room:" + message.getPayload() + ":" + member.getUserId() + ":" + key));
					} else {
						
						//같은 방 유저에게만 입장 메시지 전송
						if(chatRoomSessions.get(idSessions.get(key)) == chatRoomNo) {
							idSessions.get(key).sendMessage(new TextMessage(member.getUserId() + "님이 나가셨습니다. " + chatRoomNo));
							roomId.remove(chatRoomNo+":"+userNo);
						}
						
					}
				}
			}
			
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		int userNo = (int) session.getAttributes().get("userNo"); //유저 번호
		
		//유저 정보 가져오기
		Member member = chatService.getUserInfo(userNo);
		
		//유저 정보 지우기
		sessionsList.remove(session);
		chatRoomSessions.remove(session);
		idSessions.remove(member.getUserId());
		
		//세션에 roomNo 지우기
		session.getAttributes().remove("chatRoomNo");
		
		logger.info("### {} 연결 끊김.", session.getId());
	}
		
}
