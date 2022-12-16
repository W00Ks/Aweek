package chat.dto;

import java.util.Date;

public class ChatProfile {
	
	private int chatProfileNo;
	private String chatProfileOriginName;
	private String chatProfileStoredName;
	private int chatProfileFileSize;
	private Date chatProfileFileDate;
	private int userNo;
	
	public ChatProfile() {}

	public ChatProfile(int chatProfileNo, String chatProfileOriginName, String chatProfileStoredName,
			int chatProfileFileSize, Date chatProfileFileDate, int userNo) {
		super();
		this.chatProfileNo = chatProfileNo;
		this.chatProfileOriginName = chatProfileOriginName;
		this.chatProfileStoredName = chatProfileStoredName;
		this.chatProfileFileSize = chatProfileFileSize;
		this.chatProfileFileDate = chatProfileFileDate;
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "ChatProfile [chatProfileNo=" + chatProfileNo + ", chatProfileOriginName=" + chatProfileOriginName
				+ ", chatProfileStoredName=" + chatProfileStoredName + ", chatProfileFileSize=" + chatProfileFileSize
				+ ", chatProfileFileDate=" + chatProfileFileDate + ", userNo=" + userNo + "]";
	}

	public int getChatProfileNo() {
		return chatProfileNo;
	}

	public void setChatProfileNo(int chatProfileNo) {
		this.chatProfileNo = chatProfileNo;
	}

	public String getChatProfileOriginName() {
		return chatProfileOriginName;
	}

	public void setChatProfileOriginName(String chatProfileOriginName) {
		this.chatProfileOriginName = chatProfileOriginName;
	}

	public String getChatProfileStoredName() {
		return chatProfileStoredName;
	}

	public void setChatProfileStoredName(String chatProfileStoredName) {
		this.chatProfileStoredName = chatProfileStoredName;
	}

	public int getChatProfileFileSize() {
		return chatProfileFileSize;
	}

	public void setChatProfileFileSize(int chatProfileFileSize) {
		this.chatProfileFileSize = chatProfileFileSize;
	}

	public Date getChatProfileFileDate() {
		return chatProfileFileDate;
	}

	public void setChatProfileFileDate(Date chatProfileFileDate) {
		this.chatProfileFileDate = chatProfileFileDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
