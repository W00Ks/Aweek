package calendar.dto;

public class groupCalDto {

	private int gcalNo;
	private int roomNo;
	private int userNo;
	private String gcalTitle;
	private String gcalStartDate;
	private String gcalStartTime;
	private String gcalPlace;
	private String gcalMemo;
	private String gcalAlarm;
	private String participator;
	private String importance;
	
	public groupCalDto() {}

	public groupCalDto(int gcalNo, int roomNo, int userNo, String gcalTitle, String gcalStartDate, String gcalStartTime,
			String gcalPlace, String gcalMemo, String gcalAlarm, String participator, String importance) {
		super();
		this.gcalNo = gcalNo;
		this.roomNo = roomNo;
		this.userNo = userNo;
		this.gcalTitle = gcalTitle;
		this.gcalStartDate = gcalStartDate;
		this.gcalStartTime = gcalStartTime;
		this.gcalPlace = gcalPlace;
		this.gcalMemo = gcalMemo;
		this.gcalAlarm = gcalAlarm;
		this.participator = participator;
		this.importance = importance;
	}

	@Override
	public String toString() {
		return "groupCalDto [gcalNo=" + gcalNo + ", roomNo=" + roomNo + ", userNo=" + userNo + ", gcalTitle="
				+ gcalTitle + ", gcalStartDate=" + gcalStartDate + ", gcalStartTime=" + gcalStartTime + ", gcalPlace="
				+ gcalPlace + ", gcalMemo=" + gcalMemo + ", gcalAlarm=" + gcalAlarm + ", participator=" + participator
				+ ", importance=" + importance + "]";
	}

	public int getGcalNo() {
		return gcalNo;
	}

	public void setGcalNo(int gcalNo) {
		this.gcalNo = gcalNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getGcalTitle() {
		return gcalTitle;
	}

	public void setGcalTitle(String gcalTitle) {
		this.gcalTitle = gcalTitle;
	}

	public String getGcalStartDate() {
		return gcalStartDate;
	}

	public void setGcalStartDate(String gcalStartDate) {
		this.gcalStartDate = gcalStartDate;
	}

	public String getGcalStartTime() {
		return gcalStartTime;
	}

	public void setGcalStartTime(String gcalStartTime) {
		this.gcalStartTime = gcalStartTime;
	}

	public String getGcalPlace() {
		return gcalPlace;
	}

	public void setGcalPlace(String gcalPlace) {
		this.gcalPlace = gcalPlace;
	}

	public String getGcalMemo() {
		return gcalMemo;
	}

	public void setGcalMemo(String gcalMemo) {
		this.gcalMemo = gcalMemo;
	}

	public String getGcalAlarm() {
		return gcalAlarm;
	}

	public void setGcalAlarm(String gcalAlarm) {
		this.gcalAlarm = gcalAlarm;
	}

	public String getParticipator() {
		return participator;
	}

	public void setParticipator(String participator) {
		this.participator = participator;
	}

	public String getImportance() {
		return importance;
	}

	public void setImportance(String importance) {
		this.importance = importance;
	}
	
	
}
