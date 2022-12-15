package chat.dto;

import java.util.Date;

public class ChatRoom {
	
	private int chatRoomNo; //PK 채팅방 번호
	private String chatRoomName; //채팅방 이름
	private Date chatRoomDate; //채팅방 생성날짜
	private int roomNo; //FK 모임번호
	private int inviteUserNo; //초대받은 사람 회원번호
	private String lastMessage; //채팅방의 마지막 메시지
	
	public ChatRoom() {}

	public ChatRoom(int chatRoomNo, String chatRoomName, Date chatRoomDate, int roomNo, int inviteUserNo,
			String lastMessage) {
		super();
		this.chatRoomNo = chatRoomNo;
		this.chatRoomName = chatRoomName;
		this.chatRoomDate = chatRoomDate;
		this.roomNo = roomNo;
		this.inviteUserNo = inviteUserNo;
		this.lastMessage = lastMessage;
	}

	@Override
	public String toString() {
		return "ChatRoom [chatRoomNo=" + chatRoomNo + ", chatRoomName=" + chatRoomName + ", chatRoomDate="
				+ chatRoomDate + ", roomNo=" + roomNo + ", inviteUserNo=" + inviteUserNo + ", lastMessage="
				+ lastMessage + "]";
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}

	public String getChatRoomName() {
		return chatRoomName;
	}

	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}

	public Date getChatRoomDate() {
		return chatRoomDate;
	}

	public void setChatRoomDate(Date chatRoomDate) {
		this.chatRoomDate = chatRoomDate;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getInviteUserNo() {
		return inviteUserNo;
	}

	public void setInviteUserNo(int inviteUserNo) {
		this.inviteUserNo = inviteUserNo;
	}

	public String getLastMessage() {
		return lastMessage;
	}

	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}

}
