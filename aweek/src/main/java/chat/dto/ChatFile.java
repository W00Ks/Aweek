package chat.dto;

import java.util.Date;

public class ChatFile {
	
	private int chatFileNo;
	private String chatOriginName;
	private String chatStoredName;
	private int chatFileSize;
	private String chatFileType;
	private Date chatFileDate;
	private int chatNo;
	
	public ChatFile() {}

	public ChatFile(int chatFileNo, String chatOriginName, String chatStoredName, int chatFileSize, String chatFileType,
			Date chatFileDate, int chatNo) {
		super();
		this.chatFileNo = chatFileNo;
		this.chatOriginName = chatOriginName;
		this.chatStoredName = chatStoredName;
		this.chatFileSize = chatFileSize;
		this.chatFileType = chatFileType;
		this.chatFileDate = chatFileDate;
		this.chatNo = chatNo;
	}

	@Override
	public String toString() {
		return "ChatFile [chatFileNo=" + chatFileNo + ", chatOriginName=" + chatOriginName + ", chatStoredName="
				+ chatStoredName + ", chatFileSize=" + chatFileSize + ", chatFileType=" + chatFileType
				+ ", chatFileDate=" + chatFileDate + ", chatNo=" + chatNo + "]";
	}

	public int getChatFileNo() {
		return chatFileNo;
	}

	public void setChatFileNo(int chatFileNo) {
		this.chatFileNo = chatFileNo;
	}

	public String getChatOriginName() {
		return chatOriginName;
	}

	public void setChatOriginName(String chatOriginName) {
		this.chatOriginName = chatOriginName;
	}

	public String getChatStoredName() {
		return chatStoredName;
	}

	public void setChatStoredName(String chatStoredName) {
		this.chatStoredName = chatStoredName;
	}

	public int getChatFileSize() {
		return chatFileSize;
	}

	public void setChatFileSize(int chatFileSize) {
		this.chatFileSize = chatFileSize;
	}

	public String getChatFileType() {
		return chatFileType;
	}

	public void setChatFileType(String chatFileType) {
		this.chatFileType = chatFileType;
	}

	public Date getChatFileDate() {
		return chatFileDate;
	}

	public void setChatFileDate(Date chatFileDate) {
		this.chatFileDate = chatFileDate;
	}

	public int getChatNo() {
		return chatNo;
	}

	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	
}
