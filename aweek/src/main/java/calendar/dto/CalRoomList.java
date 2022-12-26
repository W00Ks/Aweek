package calendar.dto;

public class CalRoomList {

	private int roomNo;
	private int userNo;
	private String roomName;
	private String userName;
	
	public CalRoomList() {}

	public CalRoomList(int roomNo, int userNo, String roomName, String userName) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.roomName = roomName;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "CalRoomList [roomNo=" + roomNo + ", userNo=" + userNo + ", roomName=" + roomName + ", userName="
				+ userName + "]";
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

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	
	
}
