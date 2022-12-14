package room.dao.face;

import java.util.List;

import diary.dto.DiaryCategory;
import room.dto.Room;
import room.dto.RoomCategory;
import room.dto.RoomList;

public interface RoomDao {
	
	/**
	 * 모임 목록 조회
	 * 
	 * @return List<Room> - 모임 목록
	 */
	public List<Room> selectAll();

	/**
	 * 카테고리 리스트 조회
	 * 
	 * @return
	 */
	public List<RoomCategory> selectCategoryAll();
	
	/**
	 * 
	 * 
	 * @param userno
	 * @return
	 */
	public List<Room> selectRoomListByUserNo(int userno);
	
	/**
	 * 모임 생성 정보 insert
	 * 
	 * @param room - 모임 정보 객체 
	 */
	public void insertRoom(Room room);
	
	/**
	 * 모임 생성에서 생긴 정보 RoomList dto에 insert
	 * 
	 * @param roomList - 모임 목록 정보 객체
	 */
	public void insertRoomInfo(RoomList roomList);
	
	/**
	 * 
	 * 
	 */
//	public void insertDiaryCategory(DiaryCategory diaryCategory);
	
	/**
	 * 개설한 모임 정보 select
	 * 
	 * @param room - 모임 정보 객체
	 * @return room - 모임 정보 객체
	 */
	public Room selectRoomInfo(Room room);

	/**
	 * room 정보로 roomCategoryName 가져오기
	 * 
	 * @param room
	 * @return
	 */
	public String selectRoomCaName(int roomCategoryNo);
	
	/**
	 * roomNo로 RoomList 객체에서 userNo 정보 불러오기
	 * 
	 * @param roomNo
	 * @return List<RoomList> userNo를 포함한 모임목록 객체
	 */
	public List<RoomList> selectUserNoFromRoomList(int roomNo);
	
	/**
	 * 
	 * 
	 * @param roomList
	 * @return
	 */
	public int selectUserNoChk(RoomList roomList);

	/**
	 * 모임 정보 수정
	 * 
	 * @param room
	 */
	public void updateRoom(Room room);
	
	/**
	 * userNo에 해당하는 RoomList 삭제 (모임 탈퇴)
	 * 
	 * @param roomList - 모임 목록 정보 객체
	 */
	public void deleteRoomList(RoomList roomList);

	/**
	 * roomNo에 해당하는 Room 삭제 (모임 삭재)
	 * 
	 * @param room - 모임 정보 삭제
	 */
	public void deleteRoom(int roomNo);

	

	

	










	



	
}
