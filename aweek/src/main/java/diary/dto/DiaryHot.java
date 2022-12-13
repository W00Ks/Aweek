package diary.dto;

public class DiaryHot {
	
	private int roomNo;
	private int diaryHot;
	
	public DiaryHot() {}

	public DiaryHot(int roomNo, int diaryHot) {
		super();
		this.roomNo = roomNo;
		this.diaryHot = diaryHot;
	}

	@Override
	public String toString() {
		return "DiaryHot [roomNo=" + roomNo + ", diaryHot=" + diaryHot + "]";
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getDiaryHot() {
		return diaryHot;
	}

	public void setDiaryHot(int diaryHot) {
		this.diaryHot = diaryHot;
	}

}
