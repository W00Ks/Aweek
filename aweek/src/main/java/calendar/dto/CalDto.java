package calendar.dto;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


public class CalDto {
	
	
	
	private int calNo;
	private int userNo;
	private String calTitle;
	private String startDate;
	private String startTime;
	private String calPlace;
	private String calMemo;
	private String calAlarm;
	
	public CalDto() {}

	public CalDto(int calNo, int userNo, String calTitle, String startDate, String startTime, String calPlace,
			String calMemo, String calAlarm) {
		super();
		this.calNo = calNo;
		this.userNo = userNo;
		this.calTitle = calTitle;
		this.startDate = startDate;
		this.startTime = startTime;
		this.calPlace = calPlace;
		this.calMemo = calMemo;
		this.calAlarm = calAlarm;
	}

	@Override
	public String toString() {
		return "CalDto [calNo=" + calNo + ", userNo=" + userNo + ", calTitle=" + calTitle + ", startDate=" + startDate
				+ ", startTime=" + startTime + ", calPlace=" + calPlace + ", calMemo=" + calMemo + ", calAlarm="
				+ calAlarm + "]";
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
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
