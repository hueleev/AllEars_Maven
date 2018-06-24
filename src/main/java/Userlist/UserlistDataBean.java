package Userlist;

import java.util.Date;

//회원 정보
public class UserlistDataBean {

	private int num;
	private String userid;
	private String passwd;
	private String username;
	private String displayname;
	private String position;
	private String gender;
	private String hp;
	private String address;
	private String email;
	private Date reg_date;
	private String bio;
	private String filename;
	private int filesize;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getDisplayname() {
		return displayname;
	}
	public void setDisplayname(String displayname) {
		this.displayname = displayname;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "UserlistDataBean [num=" + num + ", userid=" + userid + ", passwd=" + passwd + ", username=" + username
				+ ", displayname=" + displayname + ", position=" + position + ", gender=" + gender + ", hp=" + hp
				+ ", address=" + address + ", email=" + email + ", reg_date=" + reg_date + ", bio=" + bio
				+ ", filename=" + filename + ", filesize=" + filesize + "]";
	}
	


}
