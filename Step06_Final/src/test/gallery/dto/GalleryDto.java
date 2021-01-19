package test.gallery.dto;

public class GalleryDto {
	//필드
	private int num;
	private String writer;
	private String caption;
	private String imagePath;
	private String regdate;
	
	//페이징 처리 필드
	private int startRowNum;
	private int endRowNum;
	
	//이전, 다음 버튼 필드
	private int prevNum;
	private int nextNum;
	
	//디폴트 생성자
	public GalleryDto() {}
	
	//생성자
	public GalleryDto(int num, String writer, String caption, String imagePath, String regdate, int startRowNum,
			int endRowNum, int prevNum, int nextNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.caption = caption;
		this.imagePath = imagePath;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	//getter setter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	
}
