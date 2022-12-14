package chat.dao.face;

import java.util.List;
import java.util.Map;

import chat.dto.Chat;
import chat.dto.ChatCreatRoomInfo;
import chat.dto.ChatFile;
import chat.dto.ChatList;
import chat.dto.ChatProfile;
import chat.dto.ChatRoom;
import member.dto.Member;
import room.dto.RoomList;

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
	
	/**
	 * 가입한 모임 목록을 조회한다
	 * 
	 * @param userNo - 회원 번호
	 * @return 가입한 모임 목록
	 */
	public List<ChatCreatRoomInfo> selectRoomList(int userNo);
	
	/**
	 * 유저와 같은 모임의 유저를 조회한다
	 * 
	 * @param userNo - 유저 번호
	 * @return 같은 모임의 유저 전체 목록
	 */
	public List<ChatCreatRoomInfo> selectRoomJoinlist(int userNo);
	
	/**
	 * 회원의 프로필 사진을 조회한다
	 * 
	 * @param userNo - 회원 번호
	 * @return 프로필 사진 정보 객체
	 */
	public ChatProfile selectChatProfile(int userNo);
	
	/**
	 *  입력 받은 정보를 이용하여
	 * 새로운 채팅방을 생성한다 (INSERT)
	 * 
	 * @param chatRoom - INSERT 하려는 채팅방 정보
	 */
	public void insertChatRoom(ChatRoom chatRoom);
	
	/**
	 *  생성된 채팅방을 이용하여 
	 * 채팅방 목록에 INSERT한다
	 * 
	 * @param map - Key: 생성된 채팅방 정보, Value: userNo
	 * @return INSERT 실행 결과 (1 - 성공, 0 - 실패)
	 */
	public int insertChatList(ChatList chatList);
	
	/**
	 * 입력한 메시지를 DB에 INSERT한다
	 * 
	 * @param chat - 입력 메시지
	 * @return INSERT 결과 (1 - 성공, 0 - 실패)
	 */
	public int insertMessage(Chat chat);
	
	/**
	 * 유저의 채팅 내역을 SELECT한다
	 * 
	 * @param chat - 채팅 정보 (유저 정보)
	 * @return 채팅 내역 리스트
	 */
	public List<Chat> selectChatHistory(Chat chat);
	
	/**
	 * 파일 업로드용 채팅번호를 조회해 온다
	 * 
	 * @param chatRoomNo
	 * @return 파일 업로드용 채팅번호
	 */
	public Chat selectMaxChatNo(int chatRoomNo);

	/**
	 * 채팅방의 첨부파일 정보를 삽입한다 
	 * 
	 * @param chatFile
	 */
	public void insertFile(ChatFile chatFile);
	
	/**
	 *  방금 보낸 채팅파일 정보를 조회한다 
	 * 
	 * @param chatNo - 채팅번호
	 * @return 방금 보낸 채팅파일 정보
	 */
	public ChatFile getChatFile(int chatNo);
	
	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param chatFile - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public ChatFile selectChatFileBychatFileNo(ChatFile chatFile);
	
	/**
	 * 회원이 이미 등록한 프로필 사진이 있는지 확인
	 * 
	 * @param userNo - 회원 번호
	 * @return ( 0 - 없음, 0이상 - 있음 )
	 */
	public int isAlreadyProf(int userNo);
	
	/**
	 * 회원의 프로필 사진 정보를 DB에 INSERT한다
	 * 
	 * @param chatProfile - 프로필 사진 정보 객체
	 */
	public void insertChatProfile(ChatProfile chatProfile);
	
	/**
	 * 회원의 프로필을 변경한다
	 * 
	 * @param chatProfile - 프로필 사진 정보 객체 
	 */
	public void updateChatProfile(ChatProfile chatProfile);

	

	
	

}














