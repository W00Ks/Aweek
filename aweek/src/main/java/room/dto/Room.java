package room.dto;

public class Room {

	private int roomNo;
	private int userNo;
	private int roomCategoryNo;
	private String roomName;
	private String introduce;
	private int roomMember;
	private int roomPublic;
	
	public Room() {	}

	public Room(int roomNo, int userNo, int roomCategoryNo, String roomName, String introduce, int roomMember,
			int roomPublic) {
		super();
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.roomCategoryNo = roomCategoryNo;
		this.roomName = roomName;
		this.introduce = introduce;
		this.roomMember = roomMember;
		this.roomPublic = roomPublic;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", userNo=" + userNo + ", roomCategoryNo=" + roomCategoryNo + ", roomName="
				+ roomName + ", introduce=" + introduce + ", roomMember=" + roomMember + ", roomPublic=" + roomPublic
				+ "]";
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

	public int getRoomCategoryNo() {
		return roomCategoryNo;
	}

	public void setRoomCategoryNo(int roomCategoryNo) {
		this.roomCategoryNo = roomCategoryNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getRoomMember() {
		return roomMember;
	}

	public void setRoomMember(int roomMember) {
		this.roomMember = roomMember;
	}

	public int getRoomPublic() {
		return roomPublic;
	}

	public void setRoomPublic(int roomPublic) {
		this.roomPublic = roomPublic;
	}

	
}
