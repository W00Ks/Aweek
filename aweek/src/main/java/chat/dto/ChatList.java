package chat.dto;

public class ChatList {
	
	private int chatListNo;
	private String enterState;
	private int chatRoomNo;
	private int roomNo;
	private int userNo;
	
	public ChatList() {}

	public ChatList(int chatListNo, String enterState, int chatRoomNo, int roomNo, int userNo) {
		super();
		this.chatListNo = chatListNo;
		this.enterState = enterState;
		this.chatRoomNo = chatRoomNo;
		this.roomNo = roomNo;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "ChatList [chatListNo=" + chatListNo + ", enterState=" + enterState + ", chatRoomNo=" + chatRoomNo
				+ ", roomNo=" + roomNo + ", userNo=" + userNo + "]";
	}

	public int getChatListNo() {
		return chatListNo;
	}

	public void setChatListNo(int chatListNo) {
		this.chatListNo = chatListNo;
	}

	public String getEnterState() {
		return enterState;
	}

	public void setEnterState(String enterState) {
		this.enterState = enterState;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
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
