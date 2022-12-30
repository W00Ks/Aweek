package calendar.dto;

public class LoginUserInfo {
	private int userNo;
	private String userId;
	private String userName;
	
	public LoginUserInfo() {}

	public LoginUserInfo(int userNo, String userId, String userName) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "LoginUserInfo [userNo=" + userNo + ", userId=" + userId + ", userName=" + userName + "]";
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
}
