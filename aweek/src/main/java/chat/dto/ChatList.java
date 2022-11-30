package chat.dto;

public class ChatList {
	
	private int chatListNo; //PK 채팅방 목록 번호
	private String enterState; //접속상태
	private int chatRoomNo; //FK 채팅방 번호
	private int roomNo; //FK 모임 번호
	private int userNo; //FK 회원번호
	
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
