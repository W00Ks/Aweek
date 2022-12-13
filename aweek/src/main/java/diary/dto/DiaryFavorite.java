package diary.dto;

public class DiaryFavorite {
	
	private int roomNo;
	private int userNo;
	private String roomName;

	public DiaryFavorite() {}

	public DiaryFavorite(int roomNo, int userNo, String roomName) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "DiaryFavorite [roomNo=" + roomNo + ", userNo=" + userNo + ", roomName=" + roomName + "]";
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
	
}
