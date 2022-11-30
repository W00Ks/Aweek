package chat.dao.face;

import java.util.List;

import chat.dto.ChatList;

public interface ChatDao {
	
	/**
	 * 회원의 전체 채팅방을 조회한다
	 * 
	 * @param userNo - 회원 번호
	 * @return 전체 채팅방 목록 리스트
	 */
	public List<ChatList> selectChatList(int userno);

}
