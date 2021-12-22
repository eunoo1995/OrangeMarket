package orange.service;

public class ProductSubVO {

	private String category;
	private String cateStatus;
	private int userId;
	private String imgs;
	private int liker;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getCateStatus() {
		return cateStatus;
	}
	public void setCateStatus(String cateStatus) {
		this.cateStatus = cateStatus;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getImgs() {
		return imgs;
	}
	public void setImgs(String imgs) {
		this.imgs = imgs;
	}
	public int getLiker() {
		return liker;
	}
	public void setLiker(int liker) {
		this.liker = liker;
	}
	
}
