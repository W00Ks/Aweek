package chat.service.face;

import java.util.List;
import java.util.Map;

import chat.dto.ChatCreatRoomInfo;
import chat.dto.ChatRoom;
import member.dto.Member;
import room.dto.RoomList;

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
	
	/**
	 * 회원이 가입한 모임 조회한다
	 * 
	 * @param userNo - 회원 번호
	 * @return 가입한 모임 목록
	 */
	public List<ChatCreatRoomInfo> getRoomList(int userNo);
	
	
	
}



















