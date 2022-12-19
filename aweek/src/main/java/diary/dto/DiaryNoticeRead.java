package diary.dto;

public class DiaryNoticeRead {
	
	private int userNo;
	private int diaryNo;
	private int noticeRead;
	
	public DiaryNoticeRead() {}

	public DiaryNoticeRead(int userNo, int diaryNo, int noticeRead) {
		super();
		this.userNo = userNo;
		this.diaryNo = diaryNo;
		this.noticeRead = noticeRead;
	}

	@Override
	public String toString() {
		return "DiaryNoticeRead [userNo=" + userNo + ", diaryNo=" + diaryNo + ", noticeRead=" + noticeRead + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getDiaryNo() {
		return diaryNo;
	}

	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}

	public int getNoticeRead() {
		return noticeRead;
	}

	public void setNoticeRead(int noticeRead) {
		this.noticeRead = noticeRead;
	}
	
}
