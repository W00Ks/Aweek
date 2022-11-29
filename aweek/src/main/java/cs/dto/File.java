package cs.dto;

import java.util.Date;

public class File {

	private int fileNo;
	private String originName;
	private String storedName;
	private int fileSize;
	private String fileType;
	private Date fileDate;
	
	public File() {	}

	public File(int fileNo, String originName, String storedName, int fileSize, String fileType, Date fileDate) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.storedName = storedName;
		this.fileSize = fileSize;
		this.fileType = fileType;
		this.fileDate = fileDate;
	}

	@Override
	public String toString() {
		return "File [fileNo=" + fileNo + ", originName=" + originName + ", storedName=" + storedName + ", fileSize="
				+ fileSize + ", fileType=" + fileType + ", fileDate=" + fileDate + "]";
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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
