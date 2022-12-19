package diary.dto;

public class DiaryAdmin {
	
	private int roomNo;
	private int userNo;
	private String userId;
	
	public DiaryAdmin() {}

	public DiaryAdmin(int roomNo, int userNo, String userId) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "DiaryAdmin [roomNo=" + roomNo + ", userNo=" + userNo + ", userId=" + userId + "]";
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
