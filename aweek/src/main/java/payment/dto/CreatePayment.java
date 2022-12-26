package payment.dto;

public class CreatePayment {
	
	private int amount; 
	private int userNo;
	private String payNo; 
	private String productName;
	private String paymentMethod;
	
	public CreatePayment() {
		// TODO Auto-generated constructor stub
	}

	public CreatePayment(int amount, int userNo, String payNo, String productName, String paymentMethod) {
		super();
		this.amount = amount;
		this.userNo = userNo;
		this.payNo = payNo;
		this.productName = productName;
		this.paymentMethod = paymentMethod;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	
	
	

}
