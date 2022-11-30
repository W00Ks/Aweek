package payment.dto;

public class Product {
	
	private int prodeuctNo;
	private int price;
	private int durnation;
	
	public Product() {}

	public Product(int prodeuctNo, int price, int durnation) {
		super();
		this.prodeuctNo = prodeuctNo;
		this.price = price;
		this.durnation = durnation;
	}

	@Override
	public String toString() {
		return "Product [prodeuctNo=" + prodeuctNo + ", price=" + price + ", durnation=" + durnation + "]";
	}

	public int getProdeuctNo() {
		return prodeuctNo;
	}

	public void setProdeuctNo(int prodeuctNo) {
		this.prodeuctNo = prodeuctNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDurnation() {
		return durnation;
	}

	public void setDurnation(int durnation) {
		this.durnation = durnation;
	}
	
	 

}
