package chat.dto;

import java.util.Date;

public class ChatRoom {
	
	private int chat_room_no; //PK 채팅방 번호
	private String chat_room_name; //채팅방 이름
	private Date chat_room_date; //채팅방 생성날짜
	private int room_no; //FK 모임번호
	
	public ChatRoom() {}

	public ChatRoom(int chat_room_no, String chat_room_name, Date chat_room_date, int room_no) {
		super();
		this.chat_room_no = chat_room_no;
		this.chat_room_name = chat_room_name;
		this.chat_room_date = chat_room_date;
		this.room_no = room_no;
	}

	@Override
	public String toString() {
		return "ChatRoom [chat_room_no=" + chat_room_no + ", chat_room_name=" + chat_room_name + ", chat_room_date="
				+ chat_room_date + ", room_no=" + room_no + "]";
	}

	public int getChat_room_no() {
		return chat_room_no;
	}

	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}

	public String getChat_room_name() {
		return chat_room_name;
	}

	public void setChat_room_name(String chat_room_name) {
		this.chat_room_name = chat_room_name;
	}

	public Date getChat_room_date() {
		return chat_room_date;
	}

	public void setChat_room_date(Date chat_room_date) {
		this.chat_room_date = chat_room_date;
	}

	public int getRoom_no() {
		return room_no;
	}

	public void setRoom_no(int room_no) {
		this.room_no = room_no;
	}
	
}
