package chat.dto;

public class ChatCreatRoomInfo {
	
	private int roomNo;
	private int userNo;
	private String roomName;
	private String userId;
	
	public ChatCreatRoomInfo() {}

	public ChatCreatRoomInfo(int roomNo, int userNo, String roomName, String userId) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.roomName = roomName;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ChatCreatRoomInfo [roomNo=" + roomNo + ", userNo=" + userNo + ", roomName=" + roomName + ", userId="
				+ userId + "]";
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
