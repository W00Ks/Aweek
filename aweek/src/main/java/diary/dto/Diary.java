package diary.dto;

import java.util.Date;

public class Diary {
	
	private int diaryNo;
	private int diaryCateNo;
	private int userNo;
	private int diaryFileNo;
	private int roomNo;
	private String diaryTitle;
	private String diaryContent;
	private Date diaryDate;
	private int diaryHit;
	private int diaryPublic;
	private int diaryRecommend;
	
	public Diary() {}

	public Diary(int diaryNo, int diaryCateNo, int userNo, int diaryFileNo, int roomNo, String diaryTitle,
			String diaryContent, Date diaryDate, int diaryHit, int diaryPublic, int diaryRecommend) {
		super();
		this.diaryNo = diaryNo;
		this.diaryCateNo = diaryCateNo;
		this.userNo = userNo;
		this.diaryFileNo = diaryFileNo;
		this.roomNo = roomNo;
		this.diaryTitle = diaryTitle;
		this.diaryContent = diaryContent;
		this.diaryDate = diaryDate;
		this.diaryHit = diaryHit;
		this.diaryPublic = diaryPublic;
		this.diaryRecommend = diaryRecommend;
	}

	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", diaryCateNo=" + diaryCateNo + ", userNo=" + userNo + ", diaryFileNo="
				+ diaryFileNo + ", roomNo=" + roomNo + ", diaryTitle=" + diaryTitle + ", diaryContent=" + diaryContent
				+ ", diaryDate=" + diaryDate + ", diaryHit=" + diaryHit + ", diaryPublic=" + diaryPublic
				+ ", diaryRecommend=" + diaryRecommend + "]";
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

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getDiaryTitle() {
		return diaryTitle;
	}

	public void setDiaryTitle(String diaryTitle) {
		this.diaryTitle = diaryTitle;
	}

	public String getDiaryContent() {
		return diaryContent;
	}

	public void setDiaryContent(String diaryContent) {
		this.diaryContent = diaryContent;
	}

	public Date getDiaryDate() {
		return diaryDate;
	}

	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}

	public int getDiaryHit() {
		return diaryHit;
	}

	public void setDiaryHit(int diaryHit) {
		this.diaryHit = diaryHit;
	}

	public int getDiaryPublic() {
		return diaryPublic;
	}

	public void setDiaryPublic(int diaryPublic) {
		this.diaryPublic = diaryPublic;
	}

	public int getDiaryRecommend() {
		return diaryRecommend;
	}

	public void setDiaryRecommend(int diaryRecommend) {
		this.diaryRecommend = diaryRecommend;
	}
	
}
