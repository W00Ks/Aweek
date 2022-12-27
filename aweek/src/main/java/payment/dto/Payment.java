package payment.dto;

import java.util.Date;

public class Payment {
	
	private String payNo;
	private int userNo;
	private int productNo;
	private String payType;
	private String paymentMethod;
	private String bankAccount;
	private int paymentAmount;
	private Date paymentDate;
	private Date expirationDate;
	private String resultStatus;
	private int duration;
	
	public Payment() {}

	public Payment(String payNo, int userNo, int productNo, String payType, String paymentMethod, String bankAccount,
			int paymentAmount, Date paymentDate, Date expirationDate, String resultStatus, int duration) {
		super();
		this.payNo = payNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.payType = payType;
		this.paymentMethod = paymentMethod;
		this.bankAccount = bankAccount;
		this.paymentAmount = paymentAmount;
		this.paymentDate = paymentDate;
		this.expirationDate = expirationDate;
		this.resultStatus = resultStatus;
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", userNo=" + userNo + ", productNo=" + productNo + ", payType=" + payType
				+ ", paymentMethod=" + paymentMethod + ", bankAccount=" + bankAccount + ", paymentAmount="
				+ paymentAmount + ", paymentDate=" + paymentDate + ", expirationDate=" + expirationDate
				+ ", resultStatus=" + resultStatus + ", duration=" + duration + "]";
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

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getResultStatus() {
		return resultStatus;
	}

	public void setResultStatus(String resultStatus) {
		this.resultStatus = resultStatus;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

}
