package chat.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import chat.dao.face.ChatDao;
import chat.dto.Chat;
import chat.dto.ChatCreatRoomInfo;
import chat.dto.ChatList;
import chat.dto.ChatRoom;
import chat.service.face.ChatService;
import member.dto.Member;
import room.dto.RoomList;

@Service
public class ChatServiceImpl implements ChatService {
	
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ChatDao chatDao;
	
	@Override
	public List<ChatRoom> getChatRoomList(int userNo) {
		
		List<ChatRoom> chatRoomList = chatDao.selectChatRoomList(userNo);
		
		return chatRoomList;
	}
	
	@Override
	public Member getUserInfo(int userNo) {
		
		Member member = chatDao.selectUserInfo(userNo);
		
		return member;
	}
	
	@Override
	public List<ChatCreatRoomInfo> getRoomList(int userNo) {
		
		List<ChatCreatRoomInfo> roomList = chatDao.selectRoomList(userNo);
		
		return roomList;
	}
	
	@Override
	@Transactional
	public int createChatRoom(ChatRoom chatRoom, int userNo) {
		
		//채팅방 INSERT
		chatDao.insertChatRoom(chatRoom);
		System.out.println("insert 후 dto 정보 : " + chatRoom);
		
		//INSERT한 데이터 ChatList DTO에 담기
		ChatList chatList = new ChatList();
		chatList.setChatRoomNo(chatRoom.getChatRoomNo());
		chatList.setRoomNo(chatRoom.getRoomNo());
		chatList.setUserNo(userNo);
		
		//채팅방 목록 INSERT
		chatDao.insertChatList(chatList);
		
		return chatRoom.getChatRoomNo();
	}

	@Override
	public int saveMessage(Chat chat, int userNo) {
		
		chat.setUserNo(userNo);
		int result = chatDao.insertMessage(chat);
		
		return result;
	}
	
	@Override
	public List<Chat> getChatHistory(int chatRoomNo, int userNo) {
		
		Chat chat = new Chat();
		chat.setChatRoomNo(chatRoomNo);
		chat.setUserNo(userNo);
		
		List<Chat> chatList = chatDao.selectChatHistory(chat);
		
		return chatList;
	}
	
}














