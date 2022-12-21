package diary.dto;

public class DiaryNoticeRead {

	private int userNo;
	private int diaryNo;
	private int roomNo;
	private int noticeRead;
	
	public DiaryNoticeRead() {}

	public DiaryNoticeRead(int userNo, int diaryNo, int roomNo, int noticeRead) {
		super();
		this.userNo = userNo;
		this.diaryNo = diaryNo;
		this.roomNo = roomNo;
		this.noticeRead = noticeRead;
	}

	@Override
	public String toString() {
		return "DiaryNoticeRead [userNo=" + userNo + ", diaryNo=" + diaryNo + ", roomNo=" + roomNo + ", noticeRead="
				+ noticeRead + "]";
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


	public int getRoomNo() {
		return roomNo;
	}


	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}


	public int getNoticeRead() {
		return noticeRead;
	}


	public void setNoticeRead(int noticeRead) {
		this.noticeRead = noticeRead;
	}	
	
}
