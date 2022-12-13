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
	private int diaryBest;
	private String userName;
	private String roomName;
	private int diaryHot;
	
	public Diary() {}

	public Diary(int diaryNo, int diaryCateNo, int userNo, int diaryFileNo, int roomNo, String diaryTitle,
			String diaryContent, Date diaryDate, int diaryHit, int diaryPublic, int diaryRecommend, int diaryBest,
			String userName, String roomName, int diaryHot) {
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
		this.diaryBest = diaryBest;
		this.userName = userName;
		this.roomName = roomName;
		this.diaryHot = diaryHot;
	}

	@Override
	public String toString() {
		return "Diary [diaryNo=" + diaryNo + ", diaryCateNo=" + diaryCateNo + ", userNo=" + userNo + ", diaryFileNo="
				+ diaryFileNo + ", roomNo=" + roomNo + ", diaryTitle=" + diaryTitle + ", diaryContent=" + diaryContent
				+ ", diaryDate=" + diaryDate + ", diaryHit=" + diaryHit + ", diaryPublic=" + diaryPublic
				+ ", diaryRecommend=" + diaryRecommend + ", diaryBest=" + diaryBest + ", userName=" + userName
				+ ", roomName=" + roomName + ", diaryHot=" + diaryHot + "]";
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

	public int getDiaryBest() {
		return diaryBest;
	}

	public void setDiaryBest(int diaryBest) {
		this.diaryBest = diaryBest;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public int getDiaryHot() {
		return diaryHot;
	}

	public void setDiaryHot(int diaryHot) {
		this.diaryHot = diaryHot;
	}
	
}
