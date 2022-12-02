package room.service.face;

import java.util.List;

import room.dto.Room;
import room.dto.RoomCategory;

public interface RoomService {

	/**
	 * 
	 * 
	 * 
	 * @return List<RoomCategory> - 
	 */
	public List<RoomCategory> roomCategoryList();
	
	/**
	 * 모임 개설
	 * 
	 * @param room - 모임 정보 객체
	 */
	public void createRoom(Room room);

	


	

}
