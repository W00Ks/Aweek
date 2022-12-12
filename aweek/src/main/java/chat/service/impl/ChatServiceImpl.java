package chat.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import chat.dao.face.ChatDao;
import chat.dto.Chat;
import chat.dto.ChatCreatRoomInfo;
import chat.dto.ChatFile;
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
	
	@Autowired private ServletContext context;
	
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
	
	@Override
	public ChatFile chatFileUpload(MultipartFile file, int chatRoomNo, int userNo) {
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return null;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		ChatFile chatFile = new ChatFile();
		chatFile.setChatOriginName(originName);
		chatFile.setChatStoredName(storedName);
		
		//현재 시간 구하기
		String format = "aa hh:mm";
		Calendar today = Calendar.getInstance();

		SimpleDateFormat type = new SimpleDateFormat(format);
		
		System.out.println("originName con : " + originName.contains(".png"));
		
		//파일 업로드용 채팅 INSERT
		Chat chat = new Chat();
		chat.setUserNo(userNo);
		chat.setChatRoomNo(chatRoomNo);
		chat.setChatContent(storedName);
		chat.setChatTime(type.format(today.getTime()));
		if(originName.contains(".jpg") || originName.contains(".png") || originName.contains(".gif")) {
			chat.setChatKind("3");
		} else {
			chat.setChatKind("5");
		}
		
		chatDao.insertMessage(chat);
		
		chat = chatDao.selectMaxChatNo(chatRoomNo);
		int chatNo = chat.getChatNo();
		chatFile.setChatNo(chatNo);
		
		//파일 정보 INSERT
		chatDao.insertFile(chatFile);								
		
		chatFile = chatDao.getChatFile(chatNo);
		logger.info("chatFile - {}", chatFile);
		
		return chatFile;
	}
	
	@Override
	public ChatFile getFile(ChatFile chatFile) {
		return chatDao.selectChatFileBychatFileNo(chatFile);
	}
	
}














