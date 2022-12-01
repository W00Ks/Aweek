package room.dao.face;

import room.dto.Room;

public interface RoomDao {

	/**
	 * 모임 생성 정보 insert
	 * 
	 * @param room - 모임 정보 객체 
	 */
	public void insertRoom(Room room);

	
}
