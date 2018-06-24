package controller;



import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Userlist.EtcinfoDBMybatis;
import Userlist.EtcinfoDataBean;
import Userlist.UserlistDBMybatis;
import Userlist.UserlistDataBean;
import guestMsg.GuestDBMybatis;
import guestMsg.GuestDataBean;
import songBoard.SongDBMybatis;
import songBoard.SongDataBean;



@Controller
@RequestMapping("/board")
public class BoardController{
	 
	String pageNum="1";
	
	GuestDBMybatis dbGuest = guestMsg.GuestDBMybatis.getInstance();
	SongDBMybatis dbSong = songBoard.SongDBMybatis.getInstance();
	EtcinfoDBMybatis dbEtc = Userlist.EtcinfoDBMybatis.getInstance();
	UserlistDBMybatis dbUser = Userlist.UserlistDBMybatis.getInstance();
	
	@ModelAttribute
	   public void addAttributes(String pageNum) {

	      if (pageNum!=null && pageNum !="") {
	         this.pageNum = pageNum;
	      }
//	      }
	      
	   }
	
	//로그인 전 메인 화면
	@RequestMapping("/intro")
	public ModelAndView intro() {
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/intro");
	      
		return mv;
	}
	
	//회원가입 
	@RequestMapping("/joinForm")
	public ModelAndView joinForm(String num) {
		int num2=0;
		if (num!=null) {
			num2=Integer.parseInt(num);
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", num2);
		mv.setViewName("/user/joinForm");

		return mv;
	}
	
	@RequestMapping("/joinPro")
	public String joinPro(UserlistDataBean user,String num) {
		if(num!=null&&!num.equals("")) {
		user.setNum(Integer.parseInt(num));
		}
		
		dbUser.insertUser(user);
		return "redirect:intro";
	}
	
	
	//아이디 중복확인
	@RequestMapping("/confirmId")
	public String confirmId(String userid,Model mv) {
		boolean result = dbUser.confirmId(userid);
		String none = null;
		mv.addAttribute("result", result);
		mv.addAttribute("userid",userid);
		return "confirmId";
	}
	
	//로그인
	@RequestMapping("/loginForm")
	public ModelAndView loginForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/user/loginForm");
		return mv;
	}
	
	@RequestMapping("/loginpro")
	public String loginpro(HttpServletRequest req,Model mv,String userid,String passwd) {
		int pwcheck = dbUser.login(userid, passwd);
		
		
		if (pwcheck!=1) {
			mv.addAttribute("pwcheck",pwcheck);
			return "/user/iderror";
		}
		
		HttpSession session=req.getSession();
		UserlistDataBean user = dbUser.getUser2(userid, passwd);
		String displayname = user.getDisplayname();
		session.setAttribute("sessionid",userid);
		session.setAttribute("sessionpasswd",passwd);
		session.setAttribute("sessiondisplayname",displayname);
		mv.addAttribute("user", user);
		
		System.out.println(user);
		return "redirect:main";
		
	}
	
	//로그인 후 메인
	@RequestMapping("/main")
	public String main(HttpServletRequest req,Model mv) {
		HttpSession session = req.getSession();
		String userid=(String)session.getAttribute("sessionid");
		String passwd=(String)session.getAttribute("sessionpasswd");
		
		if (session.getAttribute("sessionid")==null) {
			return "/user/intro";
		};
		
		
		UserlistDataBean user=dbUser.getUser2(userid, passwd);
		EtcinfoDataBean etc=dbEtc.getEtc(userid);
		
		int follow=dbUser.followCount(userid);
		int follower=dbUser.followerCount(userid);
		List followList=dbUser.followList(userid);
		List followerList=dbUser.followerList(userid);
		List timelineList=dbEtc.getTimeline(userid);
		
		mv.addAttribute("followList", followList);
		mv.addAttribute("user",user);
		mv.addAttribute("etc",etc);
		mv.addAttribute("follow",follow);
		mv.addAttribute("follower",follower);
		mv.addAttribute("followerList",followerList);
		mv.addAttribute("timelineList",timelineList);
		
		return "main";
		
	}
	
	//로그아웃
	@RequestMapping("/logoutPro")
	public String logoutPro(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		return "/user/intro";
	}
	
	//admin-회원목록
	@RequestMapping("/list")
	public String list(Model mv) {
		int pageSize = 5;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List userList = null;
		
		count = dbUser.getUserCount();
		
		if (count>0) {
			userList = dbUser.getUsers(startRow, endRow);}
			number = count - (currentPage-1)*pageSize;
			
			int bottomLine = 5;
			int pageCount = count/pageSize + (count%pageSize == 0 ? 0 : 1);
			
			int startPage = 1 + (currentPage -1) / bottomLine * bottomLine;
			int endPage = startPage + bottomLine -1;
			if (endPage > pageCount) endPage = pageCount;
			
			mv.addAttribute("userList", userList);
			mv.addAttribute("number", number);
			mv.addAttribute("count", count);
			mv.addAttribute("currentPage", currentPage);
			mv.addAttribute("startPage", startPage);
			mv.addAttribute("bottomLine", bottomLine);
			mv.addAttribute("pageCount", pageCount);
			mv.addAttribute("endPage", endPage);
			
			return "/user/list";
			
	}
	
	//admin-회원정보
	@RequestMapping("/content")
	public String content(Model mv,String number,String num) {
		int num2=Integer.parseInt(num);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		try {
			UserlistDataBean user=dbUser.getUser(num2,"content");
			mv.addAttribute("user",user);
			mv.addAttribute("pageNum",pageNum);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return  "/user/content";
	}
	
	//회원탈퇴
	@RequestMapping("/deleteForm")
	public String deleteForm(String num,Model mv) {
		int num2=Integer.parseInt(num);
		UserlistDataBean user=dbUser.getUser(num2, "content");
		mv.addAttribute("num",num2);
		mv.addAttribute("pageNum",pageNum);
		mv.addAttribute("user",user);
		
		return "/user/deleteForm";
		
	}
	
	@RequestMapping("/deletePro")
	public String deletePro(HttpServletRequest req,Model mv,String num,String userid,String passwd) throws Exception {
		int num2=Integer.parseInt(num);
		int check = -1;
		
		HttpSession session = req.getSession();
		
		if (passwd.equals(session.getAttribute("sessionpasswd"))) {
			if (session.getAttribute("sessionid").equals("admin")) {
				int x = dbUser.deleteUser2(userid, "Admin");
				
				if (x==1) {
					check=0;
				}
				
				mv.addAttribute("pageNum",pageNum);
				mv.addAttribute("check",check);
				return "/user/deletePro";
				
			}else {
				check=dbUser.deleteUser(userid, passwd);
				session.invalidate();
				mv.addAttribute("check",check);
				return "/user/deletePro";
				}
			}else {
				check=-1;
			}
				mv.addAttribute("pageNum",pageNum);
				mv.addAttribute("check",check);
				
				return "/user/deletePro";
		}
	
	//회원정보 수정 (비밀번호 확인)
	@RequestMapping("/updateForm1")
	public String updateForm1(){
		return "/user/updateForm1";
	}
	
	@RequestMapping("/updatePro1")
	public String updatePro1(HttpServletRequest req,String passwd) {
		HttpSession session = req.getSession();
		
		if(session.getAttribute("sessionpasswd").equals(passwd)) {
			return "redirect:updateForm";
		}
		
		return "/user/updatePro1";
	}
	
	//회원정보 수정
	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest req,Model mv) {
		HttpSession session = req.getSession();
		
		String userid = (String)session.getAttribute("sessionid");
		String passwd = (String)session.getAttribute("sessionpasswd");
		
		try {
			UserlistDataBean user = dbUser.getUser2(userid, passwd);
			mv.addAttribute("user",user);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/user/updateForm";
	}
	
	@RequestMapping("/updatePro")
	public String updatePro(HttpServletRequest req,String num,String passwd,UserlistDataBean user,Model mv) {
		if (num!=null&&!num.equals("")) {
			user.setNum(Integer.parseInt(num));
		}
		
		int chk=dbUser.updateUser(user);
		
		mv.addAttribute("user",user);
		
		HttpSession session = req.getSession();
		
		if (chk==1) {
			session.setAttribute("sessionpasswd", passwd);
			
			return "/user/updatePro";
		}
		
		return null;
	}
	
	//사용자리스트
	@RequestMapping("/allusers")
	public String allusers(HttpServletRequest req,Model mv) {
		int pageSize = 5;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List userList = null;
		count = dbUser.getUserCount();
		
		if (count > 0 ) {
			userList = dbUser.getUsers(startRow, endRow);
		}
		
		number = count - (currentPage - 1) * pageSize;
		
		int bottomLine = 5;
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine - 1;
		if (endPage > pageCount) endPage = pageCount;
		
		HttpSession session = req.getSession();
		mv.addAttribute("userList",userList);
		mv.addAttribute("number",number);
		mv.addAttribute("count", count);
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("startPage", startPage);
		mv.addAttribute("bottomLine", bottomLine);
		mv.addAttribute("pageCount", pageCount);
		mv.addAttribute("endPage", endPage);
		mv.addAttribute("sessionid", session.getAttribute("sessionid"));
		
		return "/user/allusers";
		
	}
	
	//친구 페이지
	@RequestMapping("/friendPage")
	public String frinedPage(HttpServletRequest req,Model mv,String number,String num) {
		
		int num2=Integer.parseInt(num);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		try {
			UserlistDataBean user = dbUser.getUser(num2, "content");
			
			HttpSession session = req.getSession();
			String sessionid = (String) session.getAttribute("sessionid");
			boolean chk=dbUser.followchk(sessionid, user.getUserid());
			int follow=dbUser.followCount(user.getUserid());
			int follower=dbUser.followerCount(user.getUserid());
			List followList=dbUser.followList(user.getUserid());
			List followerList=dbUser.followerList(user.getUserid());
		
			List songList=dbSong.getPage(user.getUserid());
			EtcinfoDataBean etc = dbEtc.getEtc(user.getUserid());
			
			mv.addAttribute("user", user);
			mv.addAttribute("pageNum",pageNum);
			mv.addAttribute("chk",chk);
			mv.addAttribute("etc",etc);
			mv.addAttribute("follow", follow);
			mv.addAttribute("follower", follower);
			mv.addAttribute("sessionid", sessionid);
			mv.addAttribute("followList", followList);
			mv.addAttribute("followerList", followerList);
			mv.addAttribute("songList", songList);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/friendPage";
	}
	
	//팔로우하기
	@RequestMapping("/follow")
	public String follow(HttpServletRequest req,String userid, String num,Model mv) throws Throwable {
		
		HttpSession session = req.getSession();
		String sessionid = (String) session.getAttribute("sessionid");
		
		boolean chkfollow=dbUser.follow(sessionid, userid);
		
		mv.addAttribute("chkfollow",chkfollow);
		
		return "redirect:friendPage?num="+num;
	}
	
	//나의 페이지
	@RequestMapping("/myPage")
	public String myPage(HttpServletRequest req,Model mv) {
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("sessionid");
		String passwd = (String) session.getAttribute("sessionpasswd");
		
		UserlistDataBean user=dbUser.getUser2(userid, passwd);
		
		EtcinfoDataBean etc=dbEtc.getEtc(userid);
		
		int follow=dbUser.followCount(userid);
		int follower=dbUser.followerCount(userid);
		List followList=dbUser.followList(userid);
		List followerList=dbUser.followerList(userid);
		List songList=dbSong.getPage(userid);
		
		if (session.getAttribute("sessionid")==null) {
			return "index";
		}
		
		mv.addAttribute("followList", followList);
		mv.addAttribute("user",user);
		mv.addAttribute("etc",etc);
		mv.addAttribute("follow",follow);
		mv.addAttribute("follower",follower);
		mv.addAttribute("followerList",followerList);
		mv.addAttribute("songList",songList);
		
		return "myPage";
 		
	}
	
	//부가정보 (프로필 사진/sns계정)
	@RequestMapping("/etcInfoForm")
	public String etcInfoForm(HttpServletRequest req,Model mv) {
		
		HttpSession session = req.getSession();
		
		String etcid=(String) session.getAttribute("sessionid");
		
		boolean chkid=dbEtc.chkid(etcid);
		
		if (chkid) {
			
			EtcinfoDataBean etc=dbEtc.getEtc(etcid);
			mv.addAttribute("etcid", etcid);
			mv.addAttribute("etc", etc);
			return "/user/etcUpdateForm";
			
		}else {
			req.setAttribute("etcid", etcid);
			 return  "/user/etcInsertForm"; 
		}
		
	}
	
	@RequestMapping("/etcInsertPro")
	public String etcInsertPro(MultipartHttpServletRequest req,
			EtcinfoDataBean etc)  throws Throwable {
		
		MultipartFile multi = req.getFile("uploadfile");
		
		String filename=multi.getOriginalFilename();
		
		if (filename!=null && !filename.equals("")) {
			String uploadPath = req.getRealPath("/")+"profileSave";
			FileCopyUtils.copy(multi.getInputStream(),new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			
			etc.setProfilename(filename);
			etc.setProfilesize((int)multi.getSize());
			
		} else {
			etc.setProfilename("");
			etc.setProfilesize(0);
		}
		
		
		dbEtc.insertEtc(etc);
		

		return "/user/etcInsertPro";
	}
	
	//부가정보 수정
	@RequestMapping("/etcUpdatePro")
	public String etcUpdatePro(MultipartHttpServletRequest req,
			String profilename,String profilesize,EtcinfoDataBean etc,Model mv)  throws Throwable {
		
		
		MultipartFile multi = req.getFile("uploadfile");
		
		String filename = multi.getOriginalFilename();
		
		if (filename!=null&&!filename.equals("")) {
			String uploadPath = req.getRealPath("/")+"profileSave";
	        FileCopyUtils.copy(multi.getInputStream(),new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
	        
	        etc.setProfilename(filename);
	        etc.setProfilesize((int)multi.getSize());
	        
		}else {
			etc.setProfilename(profilename);
			int size=Integer.parseInt(profilesize);
			etc.setProfilesize(size);
		}
		

		int chk=dbEtc.updateEtc(etc);
		
		mv.addAttribute("etc",etc);
		
		HttpSession session=req.getSession();
		
	
		
		if (chk==1) {

			return "/user/etcUpdatePro";
		}
			 return  null; 
	}
	
	//프로필 사진 삭제
	@RequestMapping("/deleteImg")
	public String deleteImg(String name,Model mv)  throws Throwable {
		
		EtcinfoDataBean etc=new EtcinfoDataBean();
		
		etc.setEtcid(name);

		
		System.out.println(etc);
		int chk=dbEtc.deleteImg(etc); 

		mv.addAttribute("etc", etc);
		mv.addAttribute("name",name);

			 return  "/user/NewFile";
	}
	
	//음원 업로드
	@RequestMapping("/songForm")
	public String songForm(String snum,Model mv)  throws Throwable { 
			
		int snum2=0;
		 if(snum!=null){
			 snum2=Integer.parseInt(snum);
		 };
		 
		mv.addAttribute("snum",snum2);
		
		return  "/song/songForm"; 
	}
	
	@RequestMapping("/songInsert")
	public String songInsert(MultipartHttpServletRequest req,
			 SongDataBean song,String snum,String sboardid,Model mv)  throws Throwable { 
		
		
		MultipartFile multi = req.getFile("cupload");
		
		String cfilename=multi.getOriginalFilename();
		
		if (cfilename!=null && !cfilename.equals("")) {
			String uploadPath = req.getRealPath("/")+"songSave";
			FileCopyUtils.copy(multi.getInputStream(),new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			
			song.setCfilename(cfilename);
			song.setCfilesize((int)multi.getSize());
			
		} else {
			song.setCfilename("");
			song.setCfilesize(0);
		}
		
		MultipartFile multi2 = req.getFile("supload");
		
		String sfilename=multi2.getOriginalFilename();
		
		if (sfilename!=null && !sfilename.equals("")) {
			String uploadPath = req.getRealPath("/")+"songSave";
			FileCopyUtils.copy(multi2.getInputStream(),new FileOutputStream(uploadPath+"/"+multi2.getOriginalFilename()));
			
			song.setSfilename(sfilename);
			song.setSfilesize((int)multi2.getSize());

			
		} 
		
	
		if (snum!=null&&!snum.equals("")) {
			song.setSnum(Integer.parseInt(snum));
		}
		

		String ctype=".jpg";
		
		int chk=0;
		
		if (cfilename!=null) {
		ctype= cfilename.substring(cfilename.lastIndexOf(".")+1);
		
		if (!(ctype.equalsIgnoreCase("jpg")||ctype.equalsIgnoreCase("jpeg")||ctype.equalsIgnoreCase("png")||ctype.equalsIgnoreCase("gif")||ctype.equalsIgnoreCase(""))) {
			chk=1;
			mv.addAttribute("chk", chk);
			return  "/song/typechk";
		}
		}
		
		String stype= sfilename.substring(sfilename.lastIndexOf(".")+1);
		
		if (!(stype.equalsIgnoreCase("mp3")||stype.equalsIgnoreCase("mp4")||stype.equalsIgnoreCase("wav"))) {
			chk=-1;
			mv.addAttribute("chk", chk);
			return  "/song/typechk.jsp";
		}
		
		dbSong.insertSong(song);

		mv.addAttribute("chk", chk);
		mv.addAttribute("sboardid", sboardid);
		
		return "/song/typechk";

	}
	
	//음원 리스트
	@RequestMapping("/songlist")
	public String songlist(HttpServletRequest req,String sboardid,Model mv)  throws Throwable { 
		
		int pageSize = 5;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
		if (pageNum==null || pageNum == "") {
			pageNum = "1";}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize +1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List songList = null;
		

		HttpSession session=req.getSession();
		
		if (sboardid==null||sboardid.equals("")) {
			String sessionid = (String)session.getAttribute("sessionid"); 
			sboardid=sessionid;
		}
		
		count = dbSong.getSongCount(sboardid);
		
		if (count >0){
			songList = dbSong.getSongs(startRow,endRow,sboardid);}
			number = count - (currentPage - 1)*pageSize;
		
		int bottomLine = 3;
		int pageCount =count/pageSize
				+(count % pageSize == 0 ? 0 : 1);
		int startPage = 1 + (currentPage -1) / bottomLine * bottomLine;
		int endPage = startPage + bottomLine -1;
		if (endPage > pageCount) endPage = pageCount;
		
		mv.addAttribute("sboardid", sboardid);
		mv.addAttribute("count", count);
		mv.addAttribute("songList",songList);
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("startPage", startPage);
		mv.addAttribute("bottomLine", bottomLine);
		mv.addAttribute("endPage", endPage);
		mv.addAttribute("number",number);
		mv.addAttribute("pageCount", pageCount);
		
		
		return  "/song/songlist";
	}
	
	//음원 확인
	@RequestMapping("/songcontent")
	public String songcontent(String number,String snum,String sboardid,Model mv)  throws Throwable { 
	  
		if (pageNum == null || pageNum == "") {
				pageNum = "1";	}
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		 try { 
		 	SongDataBean song = dbSong.getSong(Integer.parseInt(snum), sboardid);
		 	
		 	mv.addAttribute("song",song);
		 	mv.addAttribute("pageNum",pageNum);
		 	System.out.println(song.getSfilename());
		 	
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 return  "/song/songcontent"; 
		} 
	
	//음원 수정
	@RequestMapping("/songUpdateForm")
	public String songUpdateForm(HttpServletRequest req,String snum,Model mv)  throws Throwable {
		
		
		HttpSession session = req.getSession();

		String sboardid = (String)session.getAttribute("sessionid");
		

		 try{
			 SongDataBean song = dbSong.getSong(Integer.parseInt(snum), sboardid);

			 mv.addAttribute("song", song);
		
			}catch (Exception e) {
				e.printStackTrace();
			}
		 return  "/song/songUpdateForm"; 
	}
	
	@RequestMapping("/songUpdate")
	public String songUpdate(HttpServletRequest req,String sboardid,SongDataBean song,String snum,Model mv)  throws Throwable {
		
		if (snum!=null&&!snum.equals("")) {
			song.setSnum(Integer.parseInt(snum));}

		System.out.println(song);
		int chk=dbSong.updateSong(song); 

		mv.addAttribute("song", song);
		
		HttpSession session = req.getSession();
		
		mv.addAttribute("sboardid", sboardid);
		mv.addAttribute("chk", chk);
		return "/song/songUpdatePro";	

		}
	
	//음원 삭제
	@RequestMapping("/songdeleteForm")
	public String songdeleteForm(HttpServletRequest req,String snum,String sboardid,Model mv)  throws Throwable { 
			 
		HttpSession session=req.getSession();
		String adminid=(String) session.getAttribute("sessionid");

	
	 	SongDataBean song = dbSong.getSong(Integer.parseInt(snum),sboardid);
		
	 	mv.addAttribute("snum",Integer.parseInt(snum));
	 	mv.addAttribute("pageNum", pageNum);
	 	mv.addAttribute("song", song);
	 	mv.addAttribute("sboardid", sboardid);
	 	mv.addAttribute("adminid", adminid);
	
		return  "/song/songdeleteForm"; 
	}
	
	@RequestMapping("/songdeletePro")
	public String songdeletePro(HttpServletRequest req, String snum,String sboardid,String passwd,Model mv)  throws Throwable { 

	

		int check = -1;

		HttpSession session = req.getSession();
	 
		if (passwd.equals(session.getAttribute("sessionpasswd"))) {
		
				check=dbSong.deleteSong(sboardid,Integer.parseInt(snum));
				req.setAttribute("check", check);
				return  "/song/songdeletePro"; 


		}else {
			check=-1;
		}
		
		mv.addAttribute("pageNum", pageNum);
		mv.addAttribute("check",check);
		mv.addAttribute("sboardid", sboardid);
		
		return "/song/songdeletePro";

	}
	
	//방명록 목록
	@RequestMapping("/guestlist")
	public String guestlist(HttpServletRequest req,String gboardid,Model mv)  throws Throwable { 

		
		HttpSession session=req.getSession();
		if(gboardid==null) {	
			gboardid=(String) session.getAttribute("sessionid");
		}
		
		
		int pageSize = 5;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage -1) * pageSize +1;
			int endRow = currentPage * pageSize;
			int count=0;
			int number =0;
			List msgList = null;
			
			count = dbGuest.getMsgCount(gboardid);
			if (count >0) {
				msgList = dbGuest.getMsgs(startRow, endRow, gboardid);}
			
			number = count - (currentPage - 1)*pageSize;
			int bottomLine = 5;
			int pageCount = count/pageSize
			+(count % pageSize == 0 ? 0 : 1);
			int startPage = 1 + (currentPage -1) / bottomLine * bottomLine;
			int endPage = startPage + bottomLine -1;
			if (endPage > pageCount) endPage = pageCount;
			
			mv.addAttribute("gboardid", gboardid);
			mv.addAttribute("count", count);
			mv.addAttribute("msgList", msgList);
			mv.addAttribute("currentPage", currentPage);
			mv.addAttribute("startPage", startPage);
			mv.addAttribute("bottomLine", bottomLine);
			mv.addAttribute("endPage", endPage);
			mv.addAttribute("number", number);
			mv.addAttribute("pageCount", pageCount);
			
			return "/guest/guestlist";
	
	}
	
	//방명록 내용 확인
	@RequestMapping("/msgcontent")
	public String msgcontent(HttpServletRequest req,String gboardid,String number,String gnum,Model model)  throws Throwable { 
			
			HttpSession session=req.getSession();
			
			if(gboardid==null) {	
				gboardid=(String) session.getAttribute("sessionid");
			}
			
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		 
		 try { 
			GuestDataBean msg = dbGuest.getMsg(Integer.parseInt(gnum), gboardid,"content");
			int ref=msg.getRef(); 
			int re_step=msg.getRe_step();
			int re_level=msg.getRe_level();
			 
			model.addAttribute("msg", msg);
			model.addAttribute("pageNum", pageNum);
			
		 }catch(Exception e) {
			 e.printStackTrace();
		 };
			
			return "/guest/msgcontent";
		}
	
	
	//방명록 작성
	@RequestMapping("/writeform_g")
	public String writeform_g(HttpServletRequest req,String gboardid,String ref,String re_step,String re_level,String gnum,Model mv)  throws Throwable { 
	

		
		HttpSession session=req.getSession();
		
		if(gboardid==null) {	
			gboardid=(String) session.getAttribute("sessionid");
		}
		
	
		mv.addAttribute("gboardid",gboardid);
		mv.addAttribute("gnum",gnum);
		mv.addAttribute("ref",ref);	
		mv.addAttribute("re_step",re_step);	
		mv.addAttribute("re_level",re_level);
		mv.addAttribute("pageNum",pageNum);
	 
		System.out.println(gnum);
		System.out.println(gboardid);
		return "/guest/writeForm_g";
		
	}
	
	@RequestMapping("/writePro_g")
	public String writePro_g(HttpServletRequest req,String gboardid,String pageNum,Model model)  throws Throwable { 
	
				
		HttpSession session=req.getSession();
		if(gboardid==null) {	
			gboardid=(String) session.getAttribute("sessionid");
		}
	
		GuestDataBean msg = new GuestDataBean();
	
		if (req.getParameter("gnum")!=null&&!req.getParameter("gnum").equals("")) {
			msg.setGnum(Integer.parseInt(req.getParameter("gnum")));
			msg.setRef(Integer.parseInt(req.getParameter("ref")));
			msg.setRe_step(Integer.parseInt(req.getParameter("re_step")));
			msg.setRe_level(Integer.parseInt(req.getParameter("re_level")));};
			
			msg.setGboardid(req.getParameter("gboardid"));
			msg.setGtitle(req.getParameter("gtitle"));
			msg.setGcontent(req.getParameter("gcontent"));
			msg.setGemail(req.getParameter("gemail"));
			msg.setWriter(req.getParameter("writer"));
		System.out.println(msg);
		
		dbGuest.insertMsg(msg);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("gboardid",gboardid);
		
		return "redirect:guestlist";
	}

	//방명록 삭제
	@RequestMapping("/msgdeleteForm")
	public String msgdeleteForm(String gnum,String pageNum,String gboardid,Model mv)  throws Throwable { 
	
		
		int gnum2=Integer.parseInt(gnum);

		mv.addAttribute("pageNum", pageNum);
		mv.addAttribute("gnum", gnum2);	
		mv.addAttribute("gboardid", gboardid);
		
		return "/guest/msgdeleteForm";
	}
	
	@RequestMapping("/msgdeletePro")
	public String msgdeletePro(HttpServletRequest req,String gboardid,String passwd,String gnum,Model model)  throws Throwable { 

		HttpSession session=req.getSession();
		if(gboardid==null) {	
			gboardid=(String) session.getAttribute("sessionid");
		}
		
		String spasswd=(String) session.getAttribute("sessionpasswd");
		
		
		int chk=-1;
		
		if (passwd.equals(spasswd)) {
			chk = dbGuest.deleteMsg(Integer.parseInt(gnum), gboardid);
			model.addAttribute("chk", chk);
			model.addAttribute("gboardid", gboardid);
			model.addAttribute("pageNum", pageNum);
			return "/guest/msgdeletePro";
		}

		model.addAttribute("chk", chk);
		model.addAttribute("pageNum", pageNum);
		
		return "/guest/msgdeletePro";
		
	}
	
	//방명록 수정
	@RequestMapping("/msgUpdateForm")
	public String msgUpdateForm(HttpServletRequest req,String gboardid,String gnum,Model model)  throws Throwable { 
		
		HttpSession session=req.getSession();
		if(gboardid==null) {	
			gboardid=(String) session.getAttribute("sessionid");
		}
		
		try {
			GuestDataBean msg = dbGuest.getMsg(Integer.parseInt(gnum),gboardid,"update");
			
			model.addAttribute("msg", msg);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("gboardid", gboardid);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/guest/msgUpdateForm";
	
	}
	
	@RequestMapping("/msgUpdatePro")
	public String msgUpdatePro(HttpServletRequest req,String gboardid,Model model)  throws Throwable { 
		

		HttpSession session=req.getSession();
		if(gboardid==null) {	
			gboardid=(String) session.getAttribute("sessionid");
		}

		GuestDataBean msg = new GuestDataBean();
		if (req.getParameter("gnum")!=null&&!req.getParameter("gnum").equals("")) {
			msg.setGnum(Integer.parseInt(req.getParameter("gnum")));
			msg.setRef(Integer.parseInt(req.getParameter("ref")));
			msg.setRe_step(Integer.parseInt(req.getParameter("re_step")));
			msg.setRe_level(Integer.parseInt(req.getParameter("re_level")));};
			
			msg.setGboardid(req.getParameter("gboardid"));
			msg.setWriter(req.getParameter("writer"));
			msg.setGemail(req.getParameter("gemail"));
			msg.setGtitle(req.getParameter("gtitle"));
			msg.setGcontent(req.getParameter("gcontent"));

			System.out.println(msg);
			

			int chk=dbGuest.updateMsg(msg);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("chk", chk);
			model.addAttribute("gboardid", gboardid);
		
		return "/guest/msgUpdatePro";
	}
	
}
	