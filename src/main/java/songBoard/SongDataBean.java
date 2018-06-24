package songBoard;

//import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

//음원
public class SongDataBean {
	
	private String sboardid;
	private int snum;
	private String stitle;
	private String genre;
	private String cfilename;
	private int cfilesize;
	private String sfilename;
	private int sfilesize;
	private String sbio;
	private Date sreg_date;
	
	//음원 확장자 체크
	public String getType() {
		
		String type= sfilename.substring(sfilename.lastIndexOf(".")+1);
		return type;
	}
	
	public String getSboardid() {
		return sboardid;
	}
	public void setSboardid(String sboardid) {
		this.sboardid = sboardid;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getCfilename() {
		

		return cfilename;
	}
	public void setCfilename(String cfilename) {

		this.cfilename = cfilename;
	}
	public int getCfilesize() {
		return cfilesize;
	}
	public void setCfilesize(int cfilesize) {
		this.cfilesize = cfilesize;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		
		this.sfilename = sfilename;
	}
	public int getSfilesize() {
		return sfilesize;
	}
	public void setSfilesize(int sfilesize) {
		this.sfilesize = sfilesize;
	}
	public String getSbio() {
		return sbio;
	}
	public void setSbio(String sbio) {
		this.sbio = sbio;
	}
	public Date getSreg_date() {
		return sreg_date;
	}
	public void setSreg_date(Date sreg_date) {
		this.sreg_date = sreg_date;
	}
	
	
	
	@Override
	public String toString() {
		return "SongboardDataBean [sboardid=" + sboardid + ", snum=" + snum + ", stitle=" + stitle + ", genre=" + genre
				+ ", cfilename=" + cfilename + ", cfilesize=" + cfilesize + ", sfilename=" + sfilename + ", sfilesize="
				+ sfilesize + ", sbio=" + sbio + ", sreg_date=" + sreg_date + "]";
	}

	
}
