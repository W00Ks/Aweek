package diary.dto;

public class MyDiaryCategory {
	
	private int diaryCateNo;
	private String diaryCateName;
	
	public MyDiaryCategory() {}

	public MyDiaryCategory(int diaryCateNo, String diaryCateName) {
		super();
		this.diaryCateNo = diaryCateNo;
		this.diaryCateName = diaryCateName;
	}

	@Override
	public String toString() {
		return "MyDiaryCategory [diaryCateNo=" + diaryCateNo + ", diaryCateName=" + diaryCateName + "]";
	}

	public int getDiaryCateNo() {
		return diaryCateNo;
	}

	public void setDiaryCateNo(int diaryCateNo) {
		this.diaryCateNo = diaryCateNo;
	}

	public String getDiaryCateName() {
		return diaryCateName;
	}

	public void setDiaryCateName(String diaryCateName) {
		this.diaryCateName = diaryCateName;
	}

}
