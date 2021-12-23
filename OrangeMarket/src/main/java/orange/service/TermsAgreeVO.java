package orange.service;

public class TermsAgreeVO {
	private int termCode;
	private int userId;
	private String agree;
	
	public int getTermCode() {
		return termCode;
	}
	public void setTermCode(int termCode) {
		this.termCode = termCode;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
}
