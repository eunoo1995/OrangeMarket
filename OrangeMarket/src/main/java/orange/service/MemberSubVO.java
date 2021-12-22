package orange.service;

public class MemberSubVO {

	/* 회원권한 */
	private int memAuthorCode;
	private String author;
	
	
	/* 회원상태 */
	private int memStateCode;
	private String reason;
	
	
	public int getMemAuthorCode() {
		return memAuthorCode;
	}
	public void setMemAuthorCode(int memAuthorCode) {
		this.memAuthorCode = memAuthorCode;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getMemStateCode() {
		return memStateCode;
	}
	public void setMemStateCode(int memStateCode) {
		this.memStateCode = memStateCode;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
}
