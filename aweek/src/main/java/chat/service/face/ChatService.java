package chat.service.face;

import java.util.List;

import chat.dto.ChatRoom;
import member.dto.Member;

public interface ChatService {
	
	/**
	 * 회원의 전체 채팅방을 가져온다
	 * 
	 * @param userNo - 회원 번호
	 * @return 전체 채팅방 목록 리스트
	 */
	public List<ChatRoom> getChatRoomList(int userNo);
	
	/**
	 * 회원 정보를 조회한다
	 * 
	 * @param userNo - 회원 번호
	 * @return 회원 정보가 담긴 DTO
	 */
	public Member getUserInfo(int userNo);

}
