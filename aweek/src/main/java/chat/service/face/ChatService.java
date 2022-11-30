package chat.service.face;

import java.util.List;

import chat.dto.ChatList;

public interface ChatService {
	
	/**
	 * 회원의 전체 채팅방을 가져온다
	 * 
	 * @param userNo - 회원 번호
	 * @return 전체 채팅방 목록 리스트
	 */
	public List<ChatList> getChatList(String userNo);

}
