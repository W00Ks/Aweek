package room.dto;

public class RoomList {

	private int roomListNo;
	private int roomNo;
	private int userNo;
	
	public RoomList() {	}

	public RoomList(int roomListNo, int roomNo, int userNo) {
		super();
		this.roomListNo = roomListNo;
		this.roomNo = roomNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "RoomList [roomListNo=" + roomListNo + ", roomNo=" + roomNo + ", userNo=" + userNo + "]";
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

}