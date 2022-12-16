package cs.dto;

public class QnACategory {

	private int qnaCategoryNo;
	private String qnaCategoryName;
	
	public QnACategory() {	}

	public QnACategory(int qnaCategoryNo, String qnaCategoryName) {
		super();
		this.qnaCategoryNo = qnaCategoryNo;
		this.qnaCategoryName = qnaCategoryName;
	}

	@Override
	public String toString() {
		return "QnACategory [qnaCategoryNo=" + qnaCategoryNo + ", qnaCategoryName=" + qnaCategoryName + "]";
	}

	public int getQnaCategoryNo() {
		return qnaCategoryNo;
	}

	public void setQnaCategoryNo(int qnaCategoryNo) {
		this.qnaCategoryNo = qnaCategoryNo;
	}

	public String getQnaCategoryName() {
		return qnaCategoryName;
	}

	public void setQnaCategoryName(String qnaCategoryName) {
		this.qnaCategoryName = qnaCategoryName;
	}
	
}