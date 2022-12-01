package room.service.face;

import room.dto.Room;

public interface RoomService {

	/**
	 * 모임 개설
	 * 
	 * @param room - 모임 정보 객체
	 */
	public void createRoom(Room room);

	

}
