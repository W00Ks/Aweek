package chat.dto;

public class Chat {
	
	private int chatNo;
	private String chatKind;
	private String chatContent;
	private String chatTime;
	private int chatReadCnt;
	private int userNo;
	private int chatRoomNo;
	
	public Chat() {}

	public Chat(int chatNo, String chatKind, String chatContent, String chatTime, int chatReadCnt, int userNo,
			int chatRoomNo) {
		super();
		this.chatNo = chatNo;
		this.chatKind = chatKind;
		this.chatContent = chatContent;
		this.chatTime = chatTime;
		this.chatReadCnt = chatReadCnt;
		this.userNo = userNo;
		this.chatRoomNo = chatRoomNo;
	}

	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", chatKind=" + chatKind + ", chatContent=" + chatContent + ", chatTime="
				+ chatTime + ", chatReadCnt=" + chatReadCnt + ", userNo=" + userNo + ", chatRoomNo=" + chatRoomNo + "]";
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}

	public String getChatKind() {
		return chatKind;
	}

	public void setChatKind(String chatKind) {
		this.chatKind = chatKind;
	}

	public String getChatContent() {
		return chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	public String getChatTime() {
		return chatTime;
	}

	public void setChatTime(String chatTime) {
		this.chatTime = chatTime;
	}

	public int getChatReadCnt() {
		return chatReadCnt;
	}

	public void setChatReadCnt(int chatReadCnt) {
		this.chatReadCnt = chatReadCnt;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getChatRoomNo() {
		return chatRoomNo;
	}

	public void setChatRoomNo(int chatRoomNo) {
		this.chatRoomNo = chatRoomNo;
	}
	
}
