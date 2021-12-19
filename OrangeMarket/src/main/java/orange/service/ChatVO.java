package orange.service;

public class ChatVO {
	
	private int channel;
	private String title;
	private String price;
	private int seller;
	private int buyer;
	private String rdate;
	private String udate;
	private String sellerNik;
	private String buyerNik;
	private String lastContent;
	private String buyerProfile;
	private String sellerProfile;
	
	
	public int getChannel() {
		return channel;
	}
	public void setChannel(int channel) {
		this.channel = channel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price.trim();
	}
	public int getSeller() {
		return seller;
	}
	public void setSeller(int seller) {
		this.seller = seller;
	}
	public int getBuyer() {
		return buyer;
	}
	public void setBuyer(int buyer) {
		this.buyer = buyer;
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
	public String getLastContent() {
		return lastContent;
	}
	public void setLastContent(String lastContent) {
		this.lastContent = lastContent;
	}
	public String getBuyerProfile() {
		return buyerProfile;
	}
	public void setBuyerProfile(String buyerProfile) {
		this.buyerProfile = buyerProfile;
	}
	public String getSellerProfile() {
		return sellerProfile;
	}
	public void setSellerProfile(String sellerProfile) {
		this.sellerProfile = sellerProfile;
	}
	
}
