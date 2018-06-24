package Userlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.MybatisConnector;

public class EtcinfoDBMybatis extends MybatisConnector {
	private final String namespace = "ldg.mybatis";
	private static EtcinfoDBMybatis instance = new EtcinfoDBMybatis();
	
	private EtcinfoDBMybatis() {

	}

	public static EtcinfoDBMybatis getInstance() {
		return instance;
	}

	
	SqlSession sqlSession;
	
	//부가정보 가져오기
	public EtcinfoDataBean getEtc(String etcid) {
		sqlSession = sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("etcid", etcid);
		
		EtcinfoDataBean etc=sqlSession.selectOne(namespace+".getEtc", map);
		sqlSession.close();
		
		return etc;
		
	}
	
	//타임라인
	public List getTimeline(String userid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("myid", userid);

		List li = sqlSession.selectList(namespace+".getTimeline",map);
		sqlSession.close();
		
		return li;
		
	}
	
	//부가정보 아이디 확인
	public boolean chkid(String etcid){
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("etcid", etcid);
		Map map2=sqlSession.selectOne(namespace+".chkid",map);
		boolean li=false;
		if (map2!=null) {
			li=true;
		}
		
		sqlSession.close();
		
		return li;	
	}
	
	//부가정보 등록
	public void insertEtc(EtcinfoDataBean etc) {
		
		sqlSession = sqlSession();
		sqlSession.insert(namespace+".insertEtc",etc);
		sqlSession.commit(); 
		sqlSession.close();
	}
	
	//부가정보 수정
	public int updateEtc(EtcinfoDataBean etc) {
		
		sqlSession = sqlSession();
		int chk = sqlSession.update(namespace+".updateEtc",etc);
		sqlSession.commit(); 
		sqlSession.close();
		
		return chk;
	}
	
	//프로필사진 삭제
	public int deleteImg(EtcinfoDataBean etc) {
		
		sqlSession = sqlSession();
		int chk = sqlSession.update(namespace+".deleteImg",etc);
		sqlSession.commit(); 
		sqlSession.close();
		
		return chk;
	}
}