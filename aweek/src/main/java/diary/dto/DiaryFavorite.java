package diary.dto;

public class DiaryFavorite {
	
	private int user_no;
	private int user_favorite;
	private String room_name;
	
	public DiaryFavorite() {}

	public DiaryFavorite(int user_no, int user_favorite) {
		super();
		this.user_no = user_no;
		this.user_favorite = user_favorite;
	}

	public DiaryFavorite(int user_no, int user_favorite, String room_name) {
		super();
		this.user_no = user_no;
		this.user_favorite = user_favorite;
		this.room_name = room_name;
	}

	@Override
	public String toString() {
		return "DiaryFavorite [user_no=" + user_no + ", user_favorite=" + user_favorite + ", room_name=" + room_name
				+ "]";
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getUser_favorite() {
		return user_favorite;
	}

	public void setUser_favorite(int user_favorite) {
		this.user_favorite = user_favorite;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	
}
