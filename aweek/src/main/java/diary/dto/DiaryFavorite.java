package diary.dto;

public class DiaryFavorite {
	
	private int userNo;
	private int userFavorite;
	private String roomName;
	
	public DiaryFavorite() {}

	public DiaryFavorite(int userNo, int userFavorite, String roomName) {
		super();
		this.userNo = userNo;
		this.userFavorite = userFavorite;
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "DiaryFavorite [userNo=" + userNo + ", userFavorite=" + userFavorite + ", roomName=" + roomName + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getUserFavorite() {
		return userFavorite;
	}

	public void setUserFavorite(int userFavorite) {
		this.userFavorite = userFavorite;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

}
