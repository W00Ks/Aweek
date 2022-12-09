package diary.dto;

public class DiaryCategory {
	
	private int diaryCateNo;
	private String diaryCateName;
	
	public DiaryCategory() {}

	public DiaryCategory(int diaryCateNo, String diaryCateName) {
		super();
		this.diaryCateNo = diaryCateNo;
		this.diaryCateName = diaryCateName;
	}

	@Override
	public String toString() {
		return "DiaryCategory [diaryCateNo=" + diaryCateNo + ", diaryCateName=" + diaryCateName + "]";
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
