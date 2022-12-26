package diary.dto;

import java.util.List;

import room.dto.Room;

public class DiaryPagingAndRoom {

	private DiaryPaging diaryPaging;
	private List<Room> userRoom;
	
	public DiaryPagingAndRoom() {}
	
	public DiaryPagingAndRoom(DiaryPaging diaryPaging, List<Room> userRoom) {
		super();
		this.diaryPaging = diaryPaging;
		this.userRoom = userRoom;
	}

	@Override
	public String toString() {
		return "DiaryPagingAndRoom [diaryPaging=" + diaryPaging + ", userRoom=" + userRoom + "]";
	}

	public DiaryPaging getDiaryPaging() {
		return diaryPaging;
	}

	public void setDiaryPaging(DiaryPaging diaryPaging) {
		this.diaryPaging = diaryPaging;
	}

	public List<Room> getUserRoom() {
		return userRoom;
	}

	public void setUserRoom(List<Room> userRoom) {
		this.userRoom = userRoom;
	}
	
}
