package payment.dto;

import java.util.Date;

public class Payment {
	
	private String payNo;
	private int userNo;
	private int productNo;
	private String payType;
	private String orderno;
	private String paymentMethod;
	private String bankAccount;
	private int paymentAmount;
	private Date createDate;
	private Date paymentDate;
	private Date expirationDate;
	private Date nextOrderDate;
	private String billingKey;
	private String resultstatus;
	
	public Payment() {}

	public Payment(String payNo, int userNo, int productNo, String payType, String orderno, String paymentMethod,
			String bankAccount, int paymentAmount, Date createDate, Date paymentDate, Date expirationDate,
			Date nextOrderDate, String billingKey, String resultstatus) {
		super();
		this.payNo = payNo;
		this.userNo = userNo;
		this.productNo = productNo;
		this.payType = payType;
		this.orderno = orderno;
		this.paymentMethod = paymentMethod;
		this.bankAccount = bankAccount;
		this.paymentAmount = paymentAmount;
		this.createDate = createDate;
		this.paymentDate = paymentDate;
		this.expirationDate = expirationDate;
		this.nextOrderDate = nextOrderDate;
		this.billingKey = billingKey;
		this.resultstatus = resultstatus;
	}

	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", userNo=" + userNo + ", productNo=" + productNo + ", payType=" + payType
				+ ", orderno=" + orderno + ", paymentMethod=" + paymentMethod + ", bankAccount=" + bankAccount
				+ ", paymentAmount=" + paymentAmount + ", createDate=" + createDate + ", paymentDate=" + paymentDate
				+ ", expirationDate=" + expirationDate + ", nextOrderDate=" + nextOrderDate + ", billingKey="
				+ billingKey + ", resultstatus=" + resultstatus + "]";
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

	public String getOrderno() {
		return orderno;
	}

	public void setOrderno(String orderno) {
		this.orderno = orderno;
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

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
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

	public Date getNextOrderDate() {
		return nextOrderDate;
	}

	public void setNextOrderDate(Date nextOrderDate) {
		this.nextOrderDate = nextOrderDate;
	}

	public String getBillingKey() {
		return billingKey;
	}

	public void setBillingKey(String billingKey) {
		this.billingKey = billingKey;
	}

	public String getResultstatus() {
		return resultstatus;
	}

	public void setResultstatus(String resultstatus) {
		this.resultstatus = resultstatus;
	}


	
	

}
