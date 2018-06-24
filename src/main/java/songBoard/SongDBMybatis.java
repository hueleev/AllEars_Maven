package songBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import Userlist.UserlistDataBean;
import mybatis.MybatisConnector;

public class SongDBMybatis extends MybatisConnector {
	private final String namespace = "ldg.mybatis";
	private static SongDBMybatis instance = new SongDBMybatis();
	
	private SongDBMybatis() {

	}

	public static SongDBMybatis getInstance() {
		return instance;
	}

	
	SqlSession sqlSession;
	
	//음원 목록
	public List getPage(String sboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("sboardid", sboardid);

		
		List li = sqlSession.selectList(namespace+".getPage",map);
		sqlSession.close();
		
		return li;		
		
	}
	
	//음원 업로드
	public void insertSong(SongDataBean song) {
		sqlSession = sqlSession();
		
		int number=sqlSession.selectOne(namespace+".getNextNumber",song);

		song.setSnum(number);
		sqlSession.insert(namespace+".insertSong",song);
		sqlSession.commit(); //DML이니까 ~ !! ! !
		sqlSession.close();
		
	}
	
	//음원 수 확인
	public int getSongCount(String sboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("sboardid", sboardid);

		int number=sqlSession.selectOne(namespace+".getSongCount",map);
		
		sqlSession.close();
		
		return number;
	}
	
	//음원 목록
	public List getSongs(int startRow, int endRow,String sboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("sboardid", sboardid);

		List li = sqlSession.selectList(namespace+".getSongs",map);
		sqlSession.close();
		return li;

	}
	
	//음원 내용 확인
	public SongDataBean getSong(int snum,String sboardid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("snum", snum);
		map.put("sboardid", sboardid);
		
		
		SongDataBean song = sqlSession.selectOne(namespace+".getSong",map);
		sqlSession.close();
		
		return song;
	}
	
	//음원 수정
	public int updateSong(SongDataBean song) {
		
		sqlSession = sqlSession();
		int chk = sqlSession.update(namespace+".updateSong",song);
		sqlSession.commit(); 
		sqlSession.close();
		
		return chk;	
	
	}
	
	//음원 삭제
	public int deleteSong(String sboardid,int snum) throws Exception {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("sboardid", sboardid);
		map.put("snum", snum);

		int chk=sqlSession.delete(namespace+".deleteSong",map);
		
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
	}
}