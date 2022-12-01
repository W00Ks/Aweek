package room.dto;

public class RoomList {

	private int roomListNo;
	private int roomNo;
	private int userNo;
	private int gcalNo;
	private int roomCategoryNo;
	
	public RoomList() {	}

	public RoomList(int roomListNo, int roomNo, int userNo, int gcalNo, int roomCategoryNo) {
		super();
		this.roomListNo = roomListNo;
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.gcalNo = gcalNo;
		this.roomCategoryNo = roomCategoryNo;
	}

	@Override
	public String toString() {
		return "RoomList [roomListNo=" + roomListNo + ", roomNo=" + roomNo + ", userNo=" + userNo + ", gcalNo=" + gcalNo
				+ ", roomCategoryNo=" + roomCategoryNo + "]";
	}

	public int getRoomListNo() {
		return roomListNo;
	}

	public void setRoomListNo(int roomListNo) {
		this.roomListNo = roomListNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGcalNo() {
		return gcalNo;
	}

	public void setGcalNo(int gcalNo) {
		this.gcalNo = gcalNo;
	}

	public int getRoomCategoryNo() {
		return roomCategoryNo;
	}

	public void setRoomCategoryNo(int roomCategoryNo) {
		this.roomCategoryNo = roomCategoryNo;
	}
	
}
