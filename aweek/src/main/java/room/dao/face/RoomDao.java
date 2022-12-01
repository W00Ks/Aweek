package room.dao.face;

import room.dto.Room;

public interface RoomDao {

	/**
	 * roomCategoryNo 가져오기
	 * 
	 * @param roomCategoryNo - 카테고리 번호
	 */
	public void selectRoomCategoryNo(int roomCategoryNo);
	
	/**
	 * 모임 생성 정보 insert
	 * 
	 * @param room - 모임 정보 객체 
	 */
	public void insertRoom(Room room);


	
}
