package cs.dto;

import java.util.Date;

public class QnA {

	private int qnaNo;
	private int fileNo;
	private int adminNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	
	public QnA() {}

	public QnA(int qnaNo, int fileNo, int adminNo, String qnaTitle, String qnaContent, Date qnaDate) {
		super();
		this.qnaNo = qnaNo;
		this.fileNo = fileNo;
		this.adminNo = adminNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
	}

	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", fileNo=" + fileNo + ", adminNo=" + adminNo + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate + "]";
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public Date getQnaDate() {
		return qnaDate;
	}

	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	
}
