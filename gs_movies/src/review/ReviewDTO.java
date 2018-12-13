package review;

public class ReviewDTO {
private int rno   ;
private String rtitle    ;
private String writer    ;
private String rdate    ;
private String rcontent   ;
private String passwd    ;
private int viewcnt   ;
private int rate   ;


public int getRate() {
	return rate;
}
public void setRate(int rate) {
	this.rate = rate;
}
public int getRno() {
	return rno;
}
public void setRno(int rno) {
	this.rno = rno;
}
public String getRtitle() {
	return rtitle;
}
public void setRtitle(String rtitle) {
	this.rtitle = rtitle;
}
public String getWriter() {
	return writer;
}
public void setWriter(String writer) {
	this.writer = writer;
}
public String getRdate() {
	return rdate;
}
public void setRdate(String rdate) {
	this.rdate = rdate;
}
public String getRcontent() {
	return rcontent;
}
public void setRcontent(String rcontent) {
	this.rcontent = rcontent;
}
public String getPasswd() {
	return passwd;
}
public void setPasswd(String passwd) {
	this.passwd = passwd;
}
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}
}
