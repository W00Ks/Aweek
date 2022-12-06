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
	 * roomMain에서 내가 가입한 방 목록 조회
	 * 
	 * @return List<Room> - roomList
	 */
	public List<Room> myRoomList(int userno);
	/**
	 * 모임 개설
	 * 
	 * @param room - 모임 정보 객체
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
	 * roomNo로 RoomList 객체에서 userNo 정보 불러오기
	 * 
	 * @param roomNo
	 * @return RoomList userNo를 포함한 모임목록 객체
	 */
	public RoomList getUerNoListByRoomNo(int roomNo);

	








	


	

}
