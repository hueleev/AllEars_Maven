package Userlist;

import java.util.Date;

//타임라인
public class TimeDataBean {

	private String friendid;
	private String profilename;
	private String displayname;
	private String position;
	private int snum;
	private String stitle;
	private String cfilename;
	private String sfilename;
	private String sbio;
	private String sgenre;
	private Date sreg_date;
	
	//음원or영상 확장자 확인
	public String getType() {		
		String type= sfilename.substring(sfilename.indexOf(".")+1);
		return type;
	}
	
	public String getFriendid() {
		return friendid;
	}
	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}
	public String getProfilename() {
		return profilename;
	}
	public void setProfilename(String profilename) {
		this.profilename = profilename;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
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
	public String getCfilename() {
		return cfilename;
	}
	public void setCfilename(String cfilename) {
		this.cfilename = cfilename;
	}
	public String getSfilename() {
		return sfilename;
	}
	public void setSfilename(String sfilename) {
		this.sfilename = sfilename;
	}
	public String getSbio() {
		return sbio;
	}
	public void setSbio(String sbio) {
		this.sbio = sbio;
	}
	public String getSgenre() {
		return sgenre;
	}
	public void setSgenre(String sgenre) {
		this.sgenre = sgenre;
	}
	public Date getSreg_date() {
		return sreg_date;
	}
	public void setSreg_date(Date sreg_date) {
		this.sreg_date = sreg_date;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	
	

}
