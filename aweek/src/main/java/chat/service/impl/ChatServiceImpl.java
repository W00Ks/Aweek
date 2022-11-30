package chat.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chat.dao.face.ChatDao;
import chat.dto.ChatRoom;
import chat.service.face.ChatService;
import member.dto.Member;

@Service
public class ChatServiceImpl implements ChatService {
	
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ChatDao chatDao;
	
	@Override
	public List<ChatRoom> getChatRoomList(int userNo) {
		logger.info("getChatRoomList() - start");
		
		List<ChatRoom> chatRoomList = chatDao.selectChatRoomList(userNo);
		
		return chatRoomList;
	}
	
	@Override
	public Member getUserInfo(int userNo) {
		logger.info("getUserInfo() - start");
		
		Member member = chatDao.selectUserInfo(userNo);
		
		return member;
	}
	
}














