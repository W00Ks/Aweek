package diary.dto;

import java.util.Date;

public class DiaryComment {
	
	private int diaryCommNo;
	private int diaryNo;
	private int userNo;
	private String diaryCommContent;
	private Date diaryCommDate;
	
	public DiaryComment() {}

	public DiaryComment(int diaryCommNo, int diaryNo, int userNo, String diaryCommContent, Date diaryCommDate) {
		super();
		this.diaryCommNo = diaryCommNo;
		this.diaryNo = diaryNo;
		this.userNo = userNo;
		this.diaryCommContent = diaryCommContent;
		this.diaryCommDate = diaryCommDate;
	}

	@Override
	public String toString() {
		return "DiaryComment [diaryCommNo=" + diaryCommNo + ", diaryNo=" + diaryNo + ", userNo=" + userNo
				+ ", diaryCommContent=" + diaryCommContent + ", diaryCommDate=" + diaryCommDate + "]";
	}

	public int getDiaryCommNo() {
		return diaryCommNo;
	}

	public void setDiaryCommNo(int diaryCommNo) {
		this.diaryCommNo = diaryCommNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getDiaryCommContent() {
		return diaryCommContent;
	}

	public void setDiaryCommContent(String diaryCommContent) {
		this.diaryCommContent = diaryCommContent;
	}

	public Date getDiaryCommDate() {
		return diaryCommDate;
	}

	public void setDiaryCommDate(Date diaryCommDate) {
		this.diaryCommDate = diaryCommDate;
	}
	
}
