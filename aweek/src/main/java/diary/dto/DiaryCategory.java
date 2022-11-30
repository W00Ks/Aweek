package diary.dto;

public class DiaryCategory {
	
	private int diaryCateNo;
	private int roomNo;
	private String diaryCateName;
	
	public DiaryCategory() {}

	public DiaryCategory(int diaryCateNo, int roomNo, String diaryCateName) {
		super();
		this.diaryCateNo = diaryCateNo;
		this.roomNo = roomNo;
		this.diaryCateName = diaryCateName;
	}

	@Override
	public String toString() {
		return "DiaryCategory [diaryCateNo=" + diaryCateNo + ", roomNo=" + roomNo + ", diaryCateName=" + diaryCateName
				+ "]";
	}

	public int getDiaryCateNo() {
		return diaryCateNo;
	}

	public void setDiaryCateNo(int diaryCateNo) {
		this.diaryCateNo = diaryCateNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getDiaryCateName() {
		return diaryCateName;
	}

	public void setDiaryCateName(String diaryCateName) {
		this.diaryCateName = diaryCateName;
	}
	
}
