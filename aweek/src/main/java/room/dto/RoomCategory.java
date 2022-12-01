package room.dto;

public class RoomCategory {
	
	private int roomCategoryNo;
	private String roomCategoryName;
	
	public RoomCategory() {	}

	public RoomCategory(int roomCategoryNo, String roomCategoryName) {
		super();
		this.roomCategoryNo = roomCategoryNo;
		this.roomCategoryName = roomCategoryName;
	}

	@Override
	public String toString() {
		return "RoomCategory [roomCategoryNo=" + roomCategoryNo + ", roomCategoryName=" + roomCategoryName + "]";
	}

	public int getRoomCategoryNo() {
		return roomCategoryNo;
	}

	public void setRoomCategoryNo(int roomCategoryNo) {
		this.roomCategoryNo = roomCategoryNo;
	}

	public String getRoomCategoryName() {
		return roomCategoryName;
	}

	public void setRoomCategoryName(String roomCategoryName) {
		this.roomCategoryName = roomCategoryName;
	}
	

}
