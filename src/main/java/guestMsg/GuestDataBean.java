package guestMsg;

import java.util.Date;

//¹æ¸í·Ï
public class GuestDataBean {
	
		 private String gboardid;
		 private int gnum;
		 private String writer;
		 private String gtitle;
		 private String gcontent;
		 private Date greg_date;
		 private int ref;
		 private int re_step;
		 private int re_level;
		 private String gemail;
		 
		public String getGboardid() {
			return gboardid;
		}
		public void setGboardid(String gboardid) {
			this.gboardid = gboardid;
		}
		public int getGnum() {
			return gnum;
		}
		public void setGnum(int gnum) {
			this.gnum = gnum;
		}
		public String getWriter() {
			return writer;
		}
		public void setWriter(String writer) {
			this.writer = writer;
		}
		public String getGtitle() {
			return gtitle;
		}
		public void setGtitle(String gtitle) {
			this.gtitle = gtitle;
		}
		public String getGcontent() {
			return gcontent;
		}
		public void setGcontent(String gcontent) {
			this.gcontent = gcontent;
		}
		public Date getGreg_date() {
			return greg_date;
		}
		public void setGreg_date(Date greg_date) {
			this.greg_date = greg_date;
		}
		public int getRef() {
			return ref;
		}
		public void setRef(int ref) {
			this.ref = ref;
		}
		public int getRe_step() {
			return re_step;
		}
		public void setRe_step(int re_step) {
			this.re_step = re_step;
		}
		public int getRe_level() {
			return re_level;
		}
		public void setRe_level(int re_level) {
			this.re_level = re_level;
		}
		
		
		
	
		public String getGemail() {
			return gemail;
		}
		public void setGemail(String gemail) {
			this.gemail = gemail;
		}
		@Override
		public String toString() {
			return "GuestDataBean [gboardid=" + gboardid + ", gnum=" + gnum + ", writer=" + writer + ", gtitle="
					+ gtitle + ", gcontent=" + gcontent + ", gemail=" + gemail + ", greg_date=" + greg_date + ", ref="
					+ ref + ", re_step=" + re_step + ", re_level=" + re_level + "]";
		}
		
		

		

}
