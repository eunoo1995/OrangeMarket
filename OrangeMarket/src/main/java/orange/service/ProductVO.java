package orange.service;

public class ProductVO extends ProductSubVO {
	private int proCode;
	private int seller;
	private int proCategoryCode;
	private String title;
	private String keyword;
	private String addr;
	private int price;
	private String content;
	private String rdate;
	private String udate;
	private String status;
	private int hits;
	private int buyer;
	private int refund;
	private int nego;
	private String sellerNik;
	private String buyerNik;

	public int getProCode() {
		return proCode;
	}

	public void setProCode(int proCode) {
		this.proCode = proCode;
	}

	public int getSeller() {
		return seller;
	}

	public void setSeller(int seller) {
		this.seller = seller;
	}

	public int getProCategoryCode() {
		return proCategoryCode;
	}

	public void setProCategoryCode(int proCategoryCode) {
		this.proCategoryCode = proCategoryCode;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	public String getUdate() {
		return udate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getBuyer() {
		return buyer;
	}

	public void setBuyer(int buyer) {
		this.buyer = buyer;
	}

	public int getRefund() {
		return refund;
	}

	public void setRefund(int refund) {
		this.refund = refund;
	}

	public int getNego() {
		return nego;
	}

	public void setNego(int nego) {
		this.nego = nego;
	}

	public String getSellerNik() {
		return sellerNik;
	}

	public void setSellerNik(String sellerNik) {
		this.sellerNik = sellerNik;
	}

	public String getBuyerNik() {
		return buyerNik;
	}

	public void setBuyerNik(String buyerNik) {
		this.buyerNik = buyerNik;
	}

}
