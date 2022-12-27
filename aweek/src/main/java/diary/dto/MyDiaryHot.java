package diary.dto;

public class MyDiaryHot {
	
	private int userNo;
	private int diaryHot;
	
	public MyDiaryHot() {}

	public MyDiaryHot(int userNo, int diaryHot) {
		super();
		this.userNo = userNo;
		this.diaryHot = diaryHot;
	}

	@Override
	public String toString() {
		return "DiaryHot [userNo=" + userNo + ", diaryHot=" + diaryHot + "]";
	}

	public int getuserNo() {
		return userNo;
	}

	public void setuserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getDiaryHot() {
		return diaryHot;
	}

	public void setDiaryHot(int diaryHot) {
		this.diaryHot = diaryHot;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
