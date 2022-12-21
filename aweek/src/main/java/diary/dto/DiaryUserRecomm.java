package diary.dto;

public class DiaryUserRecomm {
	
	private int userNo;
	private int diaryRecommend;
	
	public DiaryUserRecomm() {}

	public DiaryUserRecomm(int userNo, int diaryRecommend) {
		super();
		this.userNo = userNo;
		this.diaryRecommend = diaryRecommend;
	}

	@Override
	public String toString() {
		return "DiaryUserRecomm [userNo=" + userNo + ", diaryRecommend=" + diaryRecommend + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getDiaryRecommend() {
		return diaryRecommend;
	}

	public void setDiaryRecommend(int diaryRecommend) {
		this.diaryRecommend = diaryRecommend;
	}
	
}
