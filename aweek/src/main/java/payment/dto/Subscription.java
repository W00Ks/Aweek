package payment.dto;

import java.util.Date;

public class Subscription {
	
	private int refundNo;
	private String payNo;
	private int userNo;
	private int productNo;
	private Date successAtTime;
	private Date createAtTime;
	private int isSubscription;
	
	public Subscription() {}

	public Subscription(int refundNo, String payNo, int userNo, int productNo, Date successAtTime, Date createAtTime,
			int isSubscription) {
		super();
		this.refundNo = refundNo;
		this.payNo = payNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.successAtTime = successAtTime;
		this.createAtTime = createAtTime;
		this.isSubscription = isSubscription;
	}

	@Override
	public String toString() {
		return "Subscription [refundNo=" + refundNo + ", payNo=" + payNo + ", userNo=" + userNo + ", productNo="
				+ productNo + ", successAtTime=" + successAtTime + ", createAtTime=" + createAtTime
				+ ", isSubscription=" + isSubscription + "]";
	}

	public int getRefundNo() {
		return refundNo;
	}

	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Date getSuccessAtTime() {
		return successAtTime;
	}

	public void setSuccessAtTime(Date successAtTime) {
		this.successAtTime = successAtTime;
	}

	public Date getCreateAtTime() {
		return createAtTime;
	}

	public void setCreateAtTime(Date createAtTime) {
		this.createAtTime = createAtTime;
	}

	public int getIsSubscription() {
		return isSubscription;
	}

	public void setIsSubscription(int isSubscription) {
		this.isSubscription = isSubscription;
	}
	
	

}
