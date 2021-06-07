package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CatDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private static CatDao instance;
	
	private CatDao() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e1) {
		} catch (SQLException e) {
		}
	}
	
	public static CatDao getInstance() {
		if(instance == null) {
			instance = new CatDao();
		}
		return instance;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 01. 카테고리 삽입 메소드 
	public int insertCat(CatBean bean) {
		
		int cnt = -1;
		
		// ***** 3. SQL문 분석
		String sql = "insert into ctgr(cnum,ccode,cname) values(cat_seq.nextval,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,bean.getCcode());
			ps.setString(2,bean.getCname());

			// ***** 4. SQL문 실행
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
		} finally { // finally 는 try/catch가 필요
			try {
				// ***** 5. 접속/연결끊기
				// rs 는 executeQuery 시 사용
				if(ps != null)
					ps.close();
//				if(conn != null)
//					conn.close();
			} catch(SQLException e) {
			}
		}
		System.out.println(cnt);
		return cnt; // 삽입에 성공한 컬럼 갯수를 리턴
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

	// 02. 카테고리 전체 조회 메소드
	public ArrayList<CatBean> AllCat() {
		
		ArrayList<CatBean> list = new ArrayList<CatBean>();
		
		// ***** 3. SQL문 분석
		String sql = "select * from ctgr order by cnum asc";
		try {
			ps = conn.prepareStatement(sql);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			while(rs.next()) {
				int cnum = rs.getInt("cnum");
				String ccode = rs.getString("ccode");
				String cname = rs.getString("cname");
				CatBean bean = new CatBean(cnum,ccode,cname);
				list.add(bean);
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				if(rs != null)
					rs.close(); // 열기의 역순으로 닫기
				if(ps != null)
					ps.close();
//				if(conn != null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 03. 카테고리 삭제 메소드
	public int deleteCat(int cnumcnum) {
		
		int cnt = -1;
		
		// ***** 3. SQL문 분석
		String sql = "delete from ctgr where cnum=?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,cnumcnum);

			// ***** 4. SQL문 실행
			cnt = ps.executeUpdate(); // cnt = 0 혹은 1

		} catch (SQLException e) {
		} finally {
			try {
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return cnt; // 삽입에 성공한 컬럼 갯수를 리턴
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

}
