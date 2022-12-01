package room.service.face;

import room.dto.Room;

public interface RoomService {

	/**
	 * select로 가져온 roomCategoryNo
	 * 
	 * @param roomCategoryNo - 카테고리 번호
	 */
	public void getRoomCategoryNo(int roomCategoryNo);
	
	/**
	 * 모임 개설
	 * 
	 * @param room - 모임 정보 객체
	 */
	public void createRoom(Room room);


	

}
