package orange.service;

public class PagingVO {

	// 한 화면 출력 게시글 수
	private int pageUnit;
	// 페이징 출력 단위
	private int pageSize = 5;
	// 현재 페이지 번호
	private int pageNo = 1;
	// 전체 게시글 수
	private int total;
	// 시작 페이지 번호
	private int startPage;
	// 끝 페이지 번호
	private int endPage;
	// 마지막 페이지 번호
	private int totalPage;
	// sql 시작 번호
	private int startIndex;
	// sql 끝 번호
	private int endIndex;
	// 행 번호
	private int rownum;
	// 검색 필드
	private String field;
	// 검색 단어
	private String word;
	
	public PagingVO() {
		
	}
	
	public PagingVO(int total, int pageNo, int pageUnit) {
		setPageNo(pageNo);
		setPageUnit(pageUnit);
		setTotal(total);
		totalPage(total,pageUnit);
		getIndex(pageNo, pageUnit);
		pageSize(pageNo, pageUnit);
		setRownum(total - (getStartIndex()-1));
	}
	// 전체 페이지 수 세팅 메소드
	public void totalPage(int total, int pageUnit) {
		setTotalPage((int)(Math.ceil((double)total/pageUnit)));
	}
	// sql 검색 인덱스 메소드 
	public void getIndex(int pageNo, int pageUnit) {
		setEndIndex(pageNo * pageUnit);
		setStartIndex(getEndIndex() - pageUnit + 1);
	}
	// 페이지 시작, 끝 번호 메소드
	public void pageSize(int pageNo, int pageSize) {
		setStartPage(((pageNo-1)/pageSize)*pageSize + 1);
		setEndPage(getStartPage()+(pageSize-1));
		if(getEndPage() > getTotalPage()) {
			setEndPage(getTotalPage());
		}
	}
	
	
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
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
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
}
