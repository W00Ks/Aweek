package cs.dto;

import java.util.Date;

public class QnA {

	private int qnaNo;
	private int fileNo;
	private String writerId;
	private String writerNick;
	private int qnaCategoryNo;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
   
   public QnA() {}

	public QnA(int qnaNo, int fileNo, String writerId, String writerNick, int qnaCategoryNo, String qnaTitle,
			String qnaContent, Date qnaDate) {
		super();
		this.qnaNo = qnaNo;
		this.fileNo = fileNo;
		this.writerId = writerId;
		this.writerNick = writerNick;
		this.qnaCategoryNo = qnaCategoryNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
	}
	
	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", fileNo=" + fileNo + ", writerId=" + writerId + ", writerNick=" + writerNick
				+ ", qnaCategoryNo=" + qnaCategoryNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent
				+ ", qnaDate=" + qnaDate + "]";
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
	
	public String getWriterId() {
		return writerId;
	}
	
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	
	public String getWriterNick() {
		return writerNick;
	}
	
	public void setWriterNick(String writerNick) {
		this.writerNick = writerNick;
	}
	
	public int getQnaCategoryNo() {
		return qnaCategoryNo;
	}
	
	public void setQnaCategoryNo(int qnaCategoryNo) {
		this.qnaCategoryNo = qnaCategoryNo;
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