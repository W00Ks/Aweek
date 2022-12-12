package room.service.face;

import java.util.List;

import room.dto.Room;
import room.dto.RoomCategory;
import room.dto.RoomList;

public interface RoomService {

	/**
	 * 모든 방 목록 조회
	 * 
	 * @return List<Room> - roomList
	 */
	public List<Room> roomList();
	
	/**
	 * 카테고리 목록 불러오기
	 * 
	 * @return
	 */
	public List<RoomCategory> getRoomCategoryList();
	
	/**
	 * roomMain에서 내가 가입한 방 목록 조회
	 * 
	 * @return List<Room> - roomList
	 */
	public List<Room> myRoomList(int userno);
	
	/**
	 * 모임 개설
	 * 
	 * @param room - 모임 정보 객체
	 * @param roomList - 모임목록 정보 객체
	 */
	public void createRoom(Room room, RoomList roomList);

	/**
	 * 개설한 모임 정보 불러오기
	 * 
	 * @param room - 모임 정보 객체
	 * @return room 모임 정보 객체
	 */
	public Room getRoomInfo(Room room);

	/**
	 * room 에 있는 roomCategoryNo 로 roomCategoryName 불러오기
	 * 
	 * @param room
	 * @return roomCaName - 카테고리 이름
	 */
	public String getRoomCategoryName(int roomCategoryNo);
	
	/**
	 * roomNo로 RoomList 객체에서 userNo 정보 불러오기
	 * 
	 * @param roomNo - 모임 번호
	 * @return RoomList userNo를 포함한 모임목록 객체
	 */
	public List<RoomList> getUerNoListByRoomNo(int roomNo);

	/**
	 * 모임 가입
	 * 
	 * @param room - 모임 정보 객체
	 * @param roomList - 모임목록 정보 객체
	 */
	public void joinRoom(RoomList roomList, int userno);
	
	/**
	 * 
	 * 
	 * @param roomNo 
	 * @param userno
	 * @return
	 */
	public boolean joinUserNoChk(int userno, int roomNo);

	/**
	 * 모임 정보 수정
	 * 
	 * @param room - 모임 정보 객체
	 */
	public void updateRoom(Room room);
	
	/**
	 * 모임 탈퇴
	 * 
	 * @param roomList - 모임목록 정보 객체
	 */
	public void dropOut(RoomList roomList);

	/**
	 * 모임 삭제
	 * 
	 * @param room - 모임 정보 객체
	 */
	public void deleteRoom(int roomNo);

	




	








	


	

}
