package calendar.dto;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class Calendar {
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	private int calNo;
	private int userNo;
	private String calTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	private String startTime;
	private String endTime;
	private String calPlace;
	private String calMemo;
	private String calAlarm;
	
	public Calendar() {}

	public Calendar(int calNo, int userNo, String calTitle, Date startDate, Date endDate, String startTime,
			String endTime, String calPlace, String calMemo, String calAlarm) {
		super();
		this.calNo = calNo;
		this.userNo = userNo;
		this.calTitle = calTitle;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.calPlace = calPlace;
		this.calMemo = calMemo;
		this.calAlarm = calAlarm;
	}

	@Override
	public String toString() {
		return "Calendar [calNo=" + calNo + ", userNo=" + userNo + ", calTitle=" + calTitle + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", startTime=" + startTime + ", endTime=" + endTime + ", calPlace="
				+ calPlace + ", calMemo=" + calMemo + ", calAlarm=" + calAlarm + "]";
	}

	public int getCalNo() {
		return calNo;
	}

	public void setCalNo(int calNo) {
		this.calNo = calNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getCalTitle() {
		return calTitle;
	}

	public void setCalTitle(String calTitle) {
		this.calTitle = calTitle;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getCalPlace() {
		return calPlace;
	}

	public void setCalPlace(String calPlace) {
		this.calPlace = calPlace;
	}

	public String getCalMemo() {
		return calMemo;
	}

	public void setCalMemo(String calMemo) {
		this.calMemo = calMemo;
	}

	public String getCalAlarm() {
		return calAlarm;
	}

	public void setCalAlarm(String calAlarm) {
		this.calAlarm = calAlarm;
	}

	
	

	

	


}
