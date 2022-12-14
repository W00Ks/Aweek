package cs.dto;

import java.util.Date;

public class Inquiry {

	private int inquiryNo;
	private int fileNo;
	private int userNo;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryEmail;
	private Date inquiryDate;
	
	public Inquiry() {	}

	public Inquiry(int inquiryNo, int fileNo, int userNo, String inquiryTitle, String inquiryContent,
			String inquiryEmail, Date inquiryDate) {
		super();
		this.inquiryNo = inquiryNo;
		this.fileNo = fileNo;
		this.userNo = userNo;
		this.inquiryTitle = inquiryTitle;
		this.inquiryContent = inquiryContent;
		this.inquiryEmail = inquiryEmail;
		this.inquiryDate = inquiryDate;
	}

	@Override
	public String toString() {
		return "Inquiry [inquiryNo=" + inquiryNo + ", fileNo=" + fileNo + ", userNo=" + userNo + ", inquiryTitle="
				+ inquiryTitle + ", inquiryContent=" + inquiryContent + ", inquiryEmail=" + inquiryEmail
				+ ", inquiryDate=" + inquiryDate + "]";
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryEmail() {
		return inquiryEmail;
	}

	public void setInquiryEmail(String inquiryEmail) {
		this.inquiryEmail = inquiryEmail;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

}
