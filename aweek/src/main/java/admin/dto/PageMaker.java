package admin.dto;

public class PageMaker {

	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	
	private Search search;
	
	public PageMaker(Search search, int total) {
		
		this.search = search;
		this.total = total;
		
		this.endPage = (int)( Math.ceil(search.getPageNum() / 10.0) ) * 10;
		
		this.startPage = this.endPage -9;
		
		int realEnd = (int)( Math.ceil( total * 1.0 / search.getAmount() ) );
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public Search getSearch() {
		return search;
	}

	public void setSearch(Search search) {
		this.search = search;
	}
}