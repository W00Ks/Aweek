package diary.dto;

import java.util.Date;

public class DiaryFile {
	
	private int diaryFileNo;
	private int diaryNo;
	private int roomNo;
	private String diaryOriginName;
	private String diaryStoredName;
	private int diaryFileSize;
	private Date diaryFileDate;
	
	public DiaryFile() {}

	public DiaryFile(int diaryFileNo, int diaryNo, int roomNo, String diaryOriginName, String diaryStoredName,
			int diaryFileSize, Date diaryFileDate) {
		super();
		this.diaryFileNo = diaryFileNo;
		this.diaryNo = diaryNo;
		this.roomNo = roomNo;
		this.diaryOriginName = diaryOriginName;
		this.diaryStoredName = diaryStoredName;
		this.diaryFileSize = diaryFileSize;
		this.diaryFileDate = diaryFileDate;
	}

	@Override
	public String toString() {
		return "DiaryFile [diaryFileNo=" + diaryFileNo + ", diaryNo=" + diaryNo + ", roomNo=" + roomNo
				+ ", diaryOriginName=" + diaryOriginName + ", diaryStoredName=" + diaryStoredName + ", diaryFileSize="
				+ diaryFileSize + ", diaryFileDate=" + diaryFileDate + "]";
	}

	public int getDiaryFileNo() {
		return diaryFileNo;
	}

	public void setDiaryFileNo(int diaryFileNo) {
		this.diaryFileNo = diaryFileNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getDiaryOriginName() {
		return diaryOriginName;
	}

	public void setDiaryOriginName(String diaryOriginName) {
		this.diaryOriginName = diaryOriginName;
	}

	public String getDiaryStoredName() {
		return diaryStoredName;
	}

	public void setDiaryStoredName(String diaryStoredName) {
		this.diaryStoredName = diaryStoredName;
	}

	public int getDiaryFileSize() {
		return diaryFileSize;
	}

	public void setDiaryFileSize(int diaryFileSize) {
		this.diaryFileSize = diaryFileSize;
	}

	public Date getDiaryFileDate() {
		return diaryFileDate;
	}

	public void setDiaryFileDate(Date diaryFileDate) {
		this.diaryFileDate = diaryFileDate;
	}
	
}
