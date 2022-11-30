package chat.dao.face;

import java.util.List;

import chat.dto.ChatRoom;
import member.dto.Member;

public interface ChatDao {
	
	/**
	 * 회원의 전체 채팅방을 조회한다
	 * 
	 * @param userNo - 회원 번호
	 * @return 전체 채팅방 목록 리스트
	 */
	public List<ChatRoom> selectChatRoomList(int userNo);
	
	/**
	 * 회원 정보를 조회한다
	 * 
	 * @param userNo - 회원번호
	 * @return 회원 정보 DTO
	 */
	public Member selectUserInfo(int userNo);

}














