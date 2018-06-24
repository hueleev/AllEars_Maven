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

public class UserlistDBMybatis extends MybatisConnector {
	private final String namespace = "ldg.mybatis";
	private static UserlistDBMybatis instance = new UserlistDBMybatis();
	
	private UserlistDBMybatis() {

	}

	public static UserlistDBMybatis getInstance() {
		return instance;
	}

	
	SqlSession sqlSession;


	//ȸ������
	public void insertUser(UserlistDataBean user) {
			sqlSession = sqlSession();
	
			
			int number=sqlSession.selectOne(namespace+".getNextNumber",user);
			
			user.setNum(number);
						
			
			sqlSession.insert(namespace+".insertUser",user);
			sqlSession.commit(); //DML�̴ϱ� ~ !! ! !
			sqlSession.close();
			
			

	
		}
	
	//���̵� �ߺ�Ȯ��
	public boolean confirmId(String userid) {
		sqlSession = sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		boolean li=true;
		
		Map<String,String> map2=sqlSession.selectOne(namespace+".confirmId",map);
		
		if (map2!=null) {
			li=true;
		}else {
			li=false;
		}
		sqlSession.close();
		
		return li;
	}
	
	//�α���
	public int login(String userid, String passwd) {
		sqlSession = sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int chk=0;
		
		Map<String,String> map2=sqlSession.selectOne(namespace+".login", map);
		
		if (map2!=null && map2.containsValue(passwd)) {
			chk=1;
			sqlSession.close();
			return chk;
		}

		if (map2!=null) {
			chk=0;
			sqlSession.close();
			return chk;
		}else {
			chk=-1;
			sqlSession.close();
			return chk;
		}
	
	}
		
	//ȸ�� ���� Ȯ��
	public UserlistDataBean getUser2(String userid,String passwd) {
		sqlSession = sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		UserlistDataBean user=sqlSession.selectOne(namespace+".getUser2", map);
		sqlSession.close();
		return user;
		
	}
	
	//�ȷο� �� Ȯ��
	public int followCount(String userid) {
		sqlSession = sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("myid", userid);
		
		
		int count=sqlSession.selectOne(namespace+".followCount", map);
		
		return count;
		
	}
	
	//�ȷο� �� Ȯ��
	public int followerCount(String userid) {
		sqlSession = sqlSession();
		Map<String,String> map = new HashMap<String,String>();
		map.put("friendid", userid);
		
		int count=sqlSession.selectOne(namespace+".followerCount", map);

		return count;

	}
	
	//�ȷο� ���
	public List followList(String userid) {
		
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("myid", userid);

		List li = sqlSession.selectList(namespace+".followList",map);
		sqlSession.close();
		
		
		return li;
	}

	//�ȷο� ���
	public List followerList(String userid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("friendid", userid);

		List li = sqlSession.selectList(namespace+".followerList",map);
		sqlSession.close();
		
		return li;

	}
	
	//ȸ�� ����Ʈ
	public List getUsers(int startRow,int endRow) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List li = sqlSession.selectList(namespace+".getUsers",map);
		sqlSession.close();
		return li;
	}
	
	//ȸ�� ��
	public int getUserCount() {
		sqlSession = sqlSession();

		
		int number=sqlSession.selectOne(namespace+".getUserCount");
		
		sqlSession.close();
		return number;
	}
	
	//ȸ�� ���� Ȯ��
	public UserlistDataBean getUser(int num,String chk) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("num", num);
		map.put("chk", chk);
		
		UserlistDataBean user = sqlSession.selectOne(namespace+".getUser",map);
		sqlSession.close();
		
		return user;
		
		
	}
	
	//ȸ�� Ż��
	public int deleteUser(String userid,String passwd) throws Exception {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("passwd", passwd);

		int chk=sqlSession.delete(namespace+".deleteUser",map);
		
	
		if (chk==1) {
			int chk2=sqlSession.delete(namespace+".deleteFollow",map);
			
		}
		
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
		
	}
	
	public int deleteUser2(String userid,String passwd) throws Exception {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("passwd", passwd);

	
		int chk=sqlSession.delete(namespace+".deleteUser2",map);
		
		if (chk==1) {
			int chk2=sqlSession.delete(namespace+".deleteFollow",map);
			
		}
		sqlSession.commit();
		sqlSession.close();
		
		return chk;
		
		
	}
	
	
	//ȸ�� ���� ����
	public int updateUser(UserlistDataBean user) {
		
		sqlSession = sqlSession();
		int chk = sqlSession.update(namespace+".updateUser",user);
		sqlSession.commit(); 
		sqlSession.close();
		
		return chk;
		
	}
	
	//�ȷο� Ȯ�� �޼ҵ�
	public boolean followchk(String sessionid, String userid) {
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("myid", sessionid);
		map.put("friendid", userid);

		boolean li=true;
			
		Map<String,String> map2=sqlSession.selectOne(namespace+".followchk",map);
		
		if (map2!=null) {
			li=true;
		}else {
			li=false;
		}
	
		return li;
	}
	
	public boolean follow(String sessionid, String userid) {
		
		boolean chk=followchk(sessionid,userid);
		sqlSession = sqlSession();
		Map map = new HashMap();
		map.put("myid", sessionid);
		map.put("friendid", userid);
		boolean li=true;
		int chk2;
		
		if(chk) {
			chk2=sqlSession.delete(namespace+".unfollow",map);
			li=false;
			
		}else {
			chk2=sqlSession.insert(namespace+".follow",map);
			li=true;
		}
		
		sqlSession.commit();
		sqlSession.close();
		
		return li;
		
	}

}