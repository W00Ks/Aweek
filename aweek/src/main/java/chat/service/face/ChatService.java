package chat.service.face;

import java.util.List;
import java.util.Map;

import chat.dto.Chat;
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
	
	/**
	 * 새로운 채팅방을 생성한다
	 * 
	 * @param chatRoom - 생성하려는 채팅방 정보
	 * @return 생성 결과
	 */
	public int createChatRoom(ChatRoom chatRoom, int userNo);
	
	/**
	 * 입력한 메시지를 DB에 저장한다
	 * 
	 * @param chat - 메시지 정보
	 * @return 저장 결과
	 */
	public int saveMessage(Chat chat, int userNo);
	
	/**
	 * 유저의 채팅 내역을 조회한다
	 * 
	 * @param chatRoomNo - 방 번호
	 * @param userNo - 회원 번호
	 * @return 채팅 내역 리스트
	 */
	public List<Chat> getChatHistory(int chatRoomNo, int userNo);
	
	
	
}



















