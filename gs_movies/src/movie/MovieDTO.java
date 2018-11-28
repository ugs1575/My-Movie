package movie;

public class MovieDTO {
	private int no 		    ;
	private String mainPoster;
	private String poster	;
	private String title 	;
	private String ryear	;
	private String viewLevel;
	private String genre    ;
	private String director ;
	private String country  ;
	private String viewer   ;
	private String content  ;
	private int viewcnt     ;
	private int grpno 	    ;
	private int indent	    ;
	private int ansnum 	    ;
	
	public String getViewer() {
		return viewer;
	}
	public void setViewer(String viewer) {
		this.viewer = viewer;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getViewLevel() {
		return viewLevel;
	}
	public void setViewLevel(String viewLevel) {
		this.viewLevel = viewLevel;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getMainPoster() {
		return mainPoster;
	}
	public void setMainPoster(String mainPoster) {
		this.mainPoster = mainPoster;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRyear() {
		return ryear;
	}
	public void setRyear(String ryear) {
		this.ryear = ryear;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getGrpno() {
		return grpno;
	}
	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getAnsnum() {
		return ansnum;
	}
	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}
	
}
