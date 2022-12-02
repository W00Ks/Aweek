package room.dao.face;

import java.util.List;

import room.dto.Room;
import room.dto.RoomCategory;

public interface RoomDao {

	/**
	 * RoomCategory list select해서 얻기
	 * 
	 * @return - List<RoomCategory> 객체
	 */
	public List<RoomCategory> selectRoomCategory();
	
	/**
	 * 모임 생성 정보 insert
	 * 
	 * @param room - 모임 정보 객체 
	 */
	public void insertRoom(Room room);

	



	
}
