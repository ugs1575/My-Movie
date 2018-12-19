package notice;

public class NoticeDTO {
private int ntno 		;
private String nttitle 	;
private String ntdate  ;
private String ntcontent;
private int viewcnt;
public int getViewcnt() {
	return viewcnt;
}
public void setViewcnt(int viewcnt) {
	this.viewcnt = viewcnt;
}
public int getNtno() {
	return ntno;
}
public void setNtno(int ntno) {
	this.ntno = ntno;
}
public String getNttitle() {
	return nttitle;
}
public void setNttitle(String nttitle) {
	this.nttitle = nttitle;
}
public String getNtdate() {
	return ntdate;
}
public void setNtdate(String ntdate) {
	this.ntdate = ntdate;
}
public String getNtcontent() {
	return ntcontent;
}
public void setNtcontent(String ntcontent) {
	this.ntcontent = ntcontent;
}

}
