package Userlist;

//부가 정보
public class EtcinfoDataBean {
	private String etcid;
	private String profilename;
	private int profilesize;
	private String facelink;
	private String instalink;
	private String soundlink;
	
	public String getEtcid() {
		return etcid;
	}
	public void setEtcid(String etcid) {
		this.etcid = etcid;
	}
	public String getProfilename() {
		return profilename;
	}
	public void setProfilename(String profilename) {
		this.profilename = profilename;
	}
	public int getProfilesize() {
		return profilesize;
	}
	public void setProfilesize(int profilesize) {
		this.profilesize = profilesize;
	}
	public String getFacelink() {
		return facelink;
	}
	public void setFacelink(String facelink) {
		this.facelink = facelink;
	}
	public String getInstalink() {
		return instalink;
	}
	public void setInstalink(String instalink) {
		this.instalink = instalink;
	}
	public String getSoundlink() {
		return soundlink;
	}
	public void setSoundlink(String soundlink) {
		this.soundlink = soundlink;
	}
	
	@Override
	public String toString() {
		return "EtcinfoDataBean [etcid=" + etcid + ", profilename=" + profilename + ", profilesize=" + profilesize
				+ ", facelink=" + facelink + ", instalink=" + instalink + ", soundlink=" + soundlink + "]";
	}
	
	
	
	

}
