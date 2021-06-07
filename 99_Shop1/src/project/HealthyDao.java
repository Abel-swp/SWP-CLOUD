package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class HealthyDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private static HealthyDao instance;
	
	private HealthyDao() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e1) {
		} catch (SQLException e) {
		}
	}
	
	public static HealthyDao getInstance() {
		if(instance == null) {
			instance = new HealthyDao();
		}
		return instance;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 01. 회원 정보 삽입
	public int insertClientInfo(HealthyBean bean) throws SQLException {
		
		int cnt = -1;
		
		// ***** 3. SQL문 분석
		String sql = "insert into healthy(no,id,password,email,name,rrn1,rrn2,hp1,hp2,hp3,joindate)"
					+ " values(hy_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1,bean.getId());
		ps.setString(2,bean.getPassword());
		ps.setString(3,bean.getEmail());
		ps.setString(4,bean.getName());
		ps.setString(5,bean.getRrn1());
		ps.setString(6,bean.getRrn2());
		ps.setString(7,bean.getHp1());
		ps.setString(8,bean.getHp2());
		ps.setString(9,bean.getHp3());
		ps.setString(10,bean.getJoindate());

		// ***** 4. SQL문 실행
		cnt = ps.executeUpdate();
		return cnt;
		
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 02. 아이디 유효성 검사
	public boolean Validation(String id) throws SQLException {

		boolean flag = false;
		
		// ***** 3. SQL문 분석
		String sql = "select id from healthy where id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1,id);
		
		// ***** 4. SQL문 실행
		rs = ps.executeQuery();
		while(rs.next()) {
			flag = true;
		}
		return flag; // 'true'반환 : 아이디(有)
					 // 'false'반환 : 아이디(無)
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 03. (로그인하기)아이디와 비밀번호로 계정을 1개(if문)조회
	public HealthyBean LogIn(String id, String password) throws SQLException {
		
		HealthyBean bean = null;
		
		// ***** 3. SQL문 분석
		String sql = "select * from healthy where id=? and password=?";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1,id);
		ps.setString(2,password);
		
		// ***** 4. SQL문 실행
		rs = ps.executeQuery();
		if( rs.next() ) {
			bean = new HealthyBean();
			bean.setNo(rs.getInt("no"));
			bean.setId(rs.getString("id"));
			bean.setPassword(rs.getString("password"));
			bean.setEmail(rs.getString("email"));
			bean.setName(rs.getString("name"));
			bean.setRrn1(rs.getString("rrn1"));
			bean.setRrn2(rs.getString("rrn2"));
			bean.setHp1(rs.getString("hp1"));
			bean.setHp2(rs.getString("hp2"));
			bean.setHp3(rs.getString("hp3"));
			bean.setJoindate(rs.getString("joindate"));
		}
		return bean;
	}
		
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 04-1. (아이디찾기)이름과 주민등록번호로 계정을 1개(if문)조회
	public HealthyBean selectClientId(String a, String b, String c) throws SQLException {
		
		HealthyBean bean = null;
		
		// ***** 3. SQL문 분석
		String sql = "select * from healthy where name=? and rrn1=? and rrn2=?";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1,a);
		ps.setString(2,b);
		ps.setString(3,c);
		
		// ***** 4. SQL문 실행
		rs = ps.executeQuery();
		if(rs.next()) {
			// 전체생성자(찾아서 생성자로)
			int no = rs.getInt("no");
			String id = rs.getString("id");
			String password = rs.getString("password");
			String email = rs.getString("email");
			String name = rs.getString("name");
			String rrn1 = rs.getString("rrn1");
			String rrn2 = rs.getString("rrn2");
			String hp1 = rs.getString("hp1");
			String hp2 = rs.getString("hp2");
			String hp3 = rs.getString("hp3");
			String joindate = rs.getString("joindate");
			bean = new HealthyBean(no,id,password,email,name,rrn1,rrn2,hp1,hp2,hp3,joindate);
		}
		return bean;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

	// 04-2. (비밀번호찾기)아이디와 이름과 주민등록번호로 계정을 1개(if문)조회
	public HealthyBean selectClientPw(String id, String name, String rrn1, String rrn2) throws SQLException {

		HealthyBean bean = null;
		
		// ***** 3. SQL문 분석
		String sql = "select * from healthy where id=? and name=? and rrn1=? and rrn2=?";
		ps = conn.prepareStatement(sql);
		
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,rrn1);
		ps.setString(4,rrn2);
		
		// ***** 4. SQL문 실행
		rs = ps.executeQuery();
		if(rs.next()) {
			// 기본생성자(찾아서 Setter로)
			bean = new HealthyBean();
			bean.setNo(rs.getInt("no"));
			bean.setId(rs.getString("id"));
			bean.setPassword(rs.getString("password"));
			bean.setEmail(rs.getString("email"));
			bean.setName(rs.getString("name"));
			bean.setRrn1(rs.getString("rrn1"));
			bean.setRrn2(rs.getString("rrn2"));
			bean.setHp1(rs.getString("hp1"));
			bean.setHp2(rs.getString("hp2"));
			bean.setHp3(rs.getString("hp3"));
			bean.setJoindate(rs.getString("joindate"));
		}
		return bean;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

}
