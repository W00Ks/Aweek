package admin.dto;

public class Admin {

	private int adminNo;
	private String adminId;
	private String adminPw;
	private String adminNick;
	
	public Admin() {}

	public Admin(int adminNo, String adminId, String adminPw, String adminNick) {
		super();
		this.adminNo = adminNo;
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminNick = adminNick;
	}

	@Override
	public String toString() {
		return "Admin [adminNo=" + adminNo + ", adminId=" + adminId + ", adminPw=" + adminPw + ", adminNick="
				+ adminNick + "]";
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getAdminNick() {
		return adminNick;
	}

	public void setAdminNick(String adminNick) {
		this.adminNick = adminNick;
	}
}