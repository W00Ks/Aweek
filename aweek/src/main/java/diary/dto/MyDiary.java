package diary.dto;

import java.util.Date;

public class MyDiary {
	
	private int diaryNo;
	private int diaryCateNo;
	private int userNo;
	private int diaryFileNo;
	private String diaryTitle;
	private String diaryContent;
	private Date diaryDate;
	private int diaryPublic;
	
	public MyDiary() {}

	public MyDiary(int diaryNo, int diaryCateNo, int userNo, int diaryFileNo, String diaryTitle, String diaryContent,
			Date diaryDate, int diaryPublic) {
		super();
		this.diaryNo = diaryNo;
		this.diaryCateNo = diaryCateNo;
		this.userNo = userNo;
		this.diaryFileNo = diaryFileNo;
		this.diaryTitle = diaryTitle;
		this.diaryContent = diaryContent;
		this.diaryDate = diaryDate;
		this.diaryPublic = diaryPublic;
	}

	@Override
	public String toString() {
		return "MyDiary [diaryNo=" + diaryNo + ", diaryCateNo=" + diaryCateNo + ", userNo=" + userNo + ", diaryFileNo="
				+ diaryFileNo + ", diaryTitle=" + diaryTitle + ", diaryContent=" + diaryContent + ", diaryDate="
				+ diaryDate + ", diaryPublic=" + diaryPublic + "]";
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getDiaryCateNo() {
		return diaryCateNo;
	}

	public void setDiaryCateNo(int diaryCateNo) {
		this.diaryCateNo = diaryCateNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getDiaryFileNo() {
		return diaryFileNo;
	}

	public void setDiaryFileNo(int diaryFileNo) {
		this.diaryFileNo = diaryFileNo;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getdiaryContent() {
		return diaryContent;
	}

	public void setdiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

	public int getDiaryPublic() {
		return diaryPublic;
	}

	public void setDiaryPublic(int diaryPublic) {
		this.diaryPublic = diaryPublic;
	}
	
}
