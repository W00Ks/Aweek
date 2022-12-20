package cs.dto;

import java.util.Date;

public class CsFile {

	private int fileNo;
	private int noticeNo;
	private int qnaNo;
	private String originName;
	private String storedName;
	private int fileSize;
	private String fileType;
	private Date fileDate;
	
	public CsFile() {	}

	public CsFile(int fileNo, int noticeNo, int qnaNo, String originName, String storedName, int fileSize,
			String fileType, Date fileDate) {
		super();
		this.fileNo = fileNo;
		this.noticeNo = noticeNo;
		this.qnaNo = qnaNo;
		this.originName = originName;
		this.storedName = storedName;
		this.fileSize = fileSize;
		this.fileType = fileType;
		this.fileDate = fileDate;
	}

	@Override
	public String toString() {
		return "CsFile [fileNo=" + fileNo + ", noticeNo=" + noticeNo + ", qnaNo=" + qnaNo + ", originName=" + originName
				+ ", storedName=" + storedName + ", fileSize=" + fileSize + ", fileType=" + fileType + ", fileDate="
				+ fileDate + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public Date getFileDate() {
		return fileDate;
	}

	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	
}
