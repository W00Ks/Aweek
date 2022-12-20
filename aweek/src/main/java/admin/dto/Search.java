package admin.dto;

import java.util.Arrays;

public class Search {
	
	private int pageNum;
	private int amount;
	private String keyword;
	private String type;
	private String[] typeArr;
	
	public Search() {
		this(1, 10);
	}

	public Search(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public Search(int pageNum, int amount, String keyword, String type, String[] typeArr) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.keyword = keyword;
		this.type = type;
		this.typeArr = typeArr;
	}

	@Override
	public String toString() {
		return "Search [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr;
	}
}