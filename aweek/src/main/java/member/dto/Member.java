package member.dto;

import java.util.Date;

public class Member {
    private int userNo;
    private String userId;
    private String userPw;
    private String userName;
    private String userPhone;
    private String userAddress;
    private String userBirth;
    private String userEmail;
    private Date userJoin;
    
    public Member() {}

	public Member(int userNo, String userId, String userPw, String userName, String userPhone, String userAddress,
			String userBirth, String userEmail, Date userJoin) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userBirth = userBirth;
		this.userEmail = userEmail;
		this.userJoin = userJoin;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", userAddress=" + userAddress + ", userBirth=" + userBirth
				+ ", userEmail=" + userEmail + ", userJoin=" + userJoin + "]";
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

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserJoin() {
		return userJoin;
	}

	public void setUserJoin(Date userJoin) {
		this.userJoin = userJoin;
	}
    
}
