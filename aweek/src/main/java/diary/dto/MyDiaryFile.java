package diary.dto;

import java.util.Date;

public class MyDiaryFile {

	private int diaryFileno;
	private int diaryNo;
	private String diaryOriginName;
	private String diaryStoredName;
	private int diaryFileSize;
	private Date diaryFileDate;
	
	public MyDiaryFile() {}

	public MyDiaryFile(int diaryFileno, int diaryNo, String diaryOriginName, String diaryStoredName, int diaryFileSize,
			Date diaryFileDate) {
		super();
		this.diaryFileno = diaryFileno;
		this.diaryNo = diaryNo;
		this.diaryOriginName = diaryOriginName;
		this.diaryStoredName = diaryStoredName;
		this.diaryFileSize = diaryFileSize;
		this.diaryFileDate = diaryFileDate;
	}

	@Override
	public String toString() {
		return "MyDiaryFile [diaryFileno=" + diaryFileno + ", diaryNo=" + diaryNo + ", diaryOriginName="
				+ diaryOriginName + ", diaryStoredName=" + diaryStoredName + ", diaryFileSize=" + diaryFileSize
				+ ", diaryFileDate=" + diaryFileDate + "]";
	}

	public int getDiaryFileno() {
		return diaryFileno;
	}

	public void setDiaryFileno(int diaryFileno) {
		this.diaryFileno = diaryFileno;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public String getDiaryOriginName() {
		return diaryOriginName;
	}

	public void setDiaryOriginName(String diaryOriginName) {
		this.diaryOriginName = diaryOriginName;
	}

	public String getdiaryStoredName() {
		return diaryStoredName;
	}

	public void setdiaryStoredName(String diaryStoredName) {
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
