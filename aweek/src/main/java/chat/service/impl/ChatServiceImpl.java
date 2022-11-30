package chat.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chat.dao.face.ChatDao;
import chat.dto.ChatList;
import chat.service.face.ChatService;

@Service
public class ChatServiceImpl implements ChatService {
	
	//로그객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private ChatDao chatDao;
	
	@Override
	public List<ChatList> getChatList(String userNo) {
		logger.info("getChatList() - start");
		
		int userno = Integer.parseInt(userNo);
		logger.info("userno {}", userno);
		
		List<ChatList> chatList = chatDao.selectChatList(userno);
		logger.info("chatList1 : {}", chatList);
		return chatList;
	}
	
}
