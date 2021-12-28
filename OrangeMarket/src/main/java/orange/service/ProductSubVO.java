package orange.service;

public class ProductSubVO {

	private int proCode;
	private int proCategoryCode;
	private String rdate;
	private String udate;
	private int unq;
	private String category;
	private String cateStatus;
	private int userId;
	private String imgs;
	private int liker;
	private String userLevel;
	
	public String getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}

	public int getProCode() {
		return proCode;
	}

	public void setProCode(int proCode) {
		this.proCode = proCode;
	}

	public int getProCategoryCode() {
		return proCategoryCode;
	}

	public void setProCategoryCode(int proCategoryCode) {
		this.proCategoryCode = proCategoryCode;
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

	public int getUnq() {
		return unq;
	}

	public void setUnq(int unq) {
		this.unq = unq;
	}

}
