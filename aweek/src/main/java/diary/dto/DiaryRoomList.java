package diary.dto;

import java.util.Objects;

public class DiaryRoomList {

	private int roomListNo;
	private int roomNo;
	private int userNo;
	private String userId;
	
	public DiaryRoomList() {}

	public DiaryRoomList(int roomListNo, int roomNo, int userNo, String userId) {
		super();
		this.roomListNo = roomListNo;
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "DiaryRoomList [roomListNo=" + roomListNo + ", roomNo=" + roomNo + ", userNo=" + userNo + ", userId="
				+ userId + "]";
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
