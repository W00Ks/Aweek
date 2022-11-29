package room.dto;

public class RoomCategory {
	
	private int roomCategoryNo;
	private String roomCategotyName;
	
	public RoomCategory() {	}

	public RoomCategory(int roomCategoryNo, String roomCategotyName) {
		super();
		this.roomCategoryNo = roomCategoryNo;
		this.roomCategotyName = roomCategotyName;
	}

	@Override
	public String toString() {
		return "RoomCategory [roomCategoryNo=" + roomCategoryNo + ", roomCategotyName=" + roomCategotyName + "]";
	}

	public int getRoomCategoryNo() {
		return roomCategoryNo;
	}

	public void setRoomCategoryNo(int roomCategoryNo) {
		this.roomCategoryNo = roomCategoryNo;
	}

	public String getRoomCategotyName() {
		return roomCategotyName;
	}

	public void setRoomCategotyName(String roomCategotyName) {
		this.roomCategotyName = roomCategotyName;
	}


}
