package project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private static ProDao instance;
	
	private ProDao() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
		} catch (SQLException e) {
		}
	}
	
	public static ProDao getInstance() {
		if(instance == null) {
			instance = new ProDao();
		}
		return instance;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 01. 카테고리 삽입 메소드 
	public int insertPro(MultipartRequest mr) {
		
		int cnt = -1;
		
		// ***** 3. SQL문 분석
		String sql = "insert into prodprod values(prod_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);

			String pcategory_fk = mr.getParameter("pcategory_fk");
			pcategory_fk += mr.getParameter("pcode"); // pcategory_fk = ccode(Category) + pcode(Product)
			
			Date d = new Date(); // import java.util.Date;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			ps.setString(1,mr.getParameter("pname")); // 통상 : ps.setString(1,mr.getPname("pname"));
			ps.setString(2,pcategory_fk);
			ps.setString(3,mr.getParameter("pcompany"));
			ps.setString(4,mr.getFilesystemName("pimage")); // input type="file"
			ps.setString(5,mr.getParameter("pqty"));
			ps.setString(6,mr.getParameter("price"));
			ps.setString(7,mr.getParameter("pspec"));
			ps.setString(8,mr.getParameter("pcontents"));
			ps.setString(9,mr.getParameter("point"));
			ps.setString(10,sdf.format(d)); // ps.setString(10,mr.getParameter("pinputdate")); // 입력 값 X. 오늘 날짜 삽입
			
			// ***** 4. SQL문 실행
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
		} finally { // ***** 5. 접속/연결끊기
			try {
				if(ps != null) {
					ps.close();
				}
			} catch(SQLException e) {
			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

	// 02. 전체 조회 메소드
	public ArrayList<ProBean> AllPro() {
		
		ArrayList<ProBean> list = new ArrayList<ProBean>();
		
		// ***** 3. SQL문 분석
		String sql = "select * from prodprod order by pnum asc";
		try {
			ps = conn.prepareStatement(sql);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			while(rs.next()) {
				int pnum = rs.getInt("pnum");
				String pname = rs.getString(2);
				String pcategory_fk = rs.getString("pcategory_fk"); // pcategory_fk = ccode(Category) + pcode(Product)
				String pcompany = rs.getString(4);
				String pimage = rs.getString("pimage");
				int pqtv = rs.getInt(6);
				int price = rs.getInt("price");
				String pspec = rs.getString(8);
				String pcontents = rs.getString("pcontents");
				int point = rs.getInt(10);
				String pinputdate = rs.getString("pinputdate");
				ProBean bean = new ProBean(pnum,pname,pcategory_fk,pcompany,pimage,pqtv,price,pspec,pcontents,point,pinputdate,0,0,0);
				list.add(bean);
			}
			
		} catch (SQLException e) {
		} finally { // ***** 5. 접속/연결끊기
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch(SQLException e) {
			}
		}		
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 03-1. 수정 전 확인 메소드 (+ ㄱ.카테고리별 상품 리스트 출력) (+ ㄴ.재고수량확인 후 장바구니) (+ ㄷ.장바구니담기)
	public ProBean Pnum(String pnum) {
		
		ProBean bean = null;

		// ***** 3. SQL문 분석
		String sql = "select * from prodprod where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
		
			ps.setString(1, pnum);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			if(rs.next()) {
				int pnum2=rs.getInt(1);
				String pname=rs.getString(2);
				String pcategory_fk=rs.getString(3);
				String pcompany=rs.getString(4);
				String pimage=rs.getString(5);
				int pqty=rs.getInt(6);
				int price=rs.getInt(7);
				String pspec=rs.getString(8);
				String pcontents=rs.getString(9); 
				int point=rs.getInt(10);
				String pinputdate = rs.getString(11);
				bean = new ProBean(pnum2,pname,pcategory_fk,pcompany,pimage,pqty,price,pspec,pcontents,point,pinputdate,0,0,0);
			}
		} catch (SQLException e) {
		} finally { // ***** 5. 접속/연결끊기
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch(SQLException e) {
			}
		}		
		return bean;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 03-2. 상품 수정 메소드
	public int updatePro(MultipartRequest mr) {

		int cnt = -1;
		
		String pimage = mr.getOriginalFileName("pimage"); // 새로운 이미지. 따로 선택하지 않았다면 null.
		String pimage2 = mr.getParameter("pimage2"); // 기존의 이미지. 이전에 선택하지 않았다면 null.
		if(pimage == null) { // 새로 선택한 이미지가 없고,
			if(pimage2 != null) { // 기존의 이미지만 남아 있다면,
				pimage = pimage2; // 기존의 이미지를 새것으로 재사용
			}
		}
		
		// ***** 3. SQL문 분석
		String sql = "update prodprod set pname=?, pcategory_fk=?, pcompany=?, pimage=?, pqty=?, price=?, pspec=?, pcontents=?, point=? where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,mr.getParameter("pname"));
			ps.setString(2,mr.getParameter("pcategory_fk")); // 없어도 상관 없음. 삭제 시 sql 문에서도 삭제 요망
			ps.setString(3,mr.getParameter("pcompany"));
			ps.setString(4,pimage);
			ps.setInt(5,Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(6,Integer.parseInt(mr.getParameter("price")));
			ps.setString(7,mr.getParameter("pspec"));
			ps.setString(8,mr.getParameter("pcontents"));
			ps.setInt(9,Integer.parseInt(mr.getParameter("point")));
			// pinputdate : 수정하지 않음
			ps.setInt(10,Integer.parseInt(mr.getParameter("pnum")));
			
			// ***** 4. SQL문 실행
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
		} finally {
			try { // ***** 5. 접속/연결끊기
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {
			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 04. 상품 삭제 메소드
	public int deletePro(String pnum) {
		
		int cnt = -1;
		
		// ***** 3. SQL문 분석
		String sql = "delete from prodprod where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,pnum);

			// ***** 4. SQL문 실행
			cnt = ps.executeUpdate();

		} catch (SQLException e) {
		} finally {
			try { // ***** 5. 접속/연결끊기
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {
			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 05. 'pspec' 으로 상품 조회 메소드
	public ArrayList<ProBean> Pspec(String pspecpspec) {
		
		ArrayList<ProBean> list = new ArrayList<ProBean>();
		
		// ***** 3. SQL문 분석
		String sql = "select * from prodprod where pspec=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,pspecpspec);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			while(rs.next()) {
				int pnum = rs.getInt("pnum");
				String pname = rs.getString(2);
				String pcategory_fk = rs.getString("pcategory_fk"); // pcategory_fk += mr.getParameter("pcode"); // 2가지를 합친다.
				String pcompany = rs.getString(4);
				String pimage = rs.getString("pimage"); // input 타입이 file 이기 때문에 얘만 다른 메소드를 쓴다.
				int pqtv = rs.getInt(6);
				int price = rs.getInt("price");
				String pspec = rs.getString(8);
				String pcontents = rs.getString("pcontents");
				int point = rs.getInt(10);
				String pinputdate = rs.getString("pinputdate");
				ProBean bean = new ProBean(pnum,pname,pcategory_fk,pcompany,pimage,pqtv,price,pspec,pcontents,point,pinputdate,0,0,0);
				list.add(bean);
			}

		} catch (SQLException e) {
		} finally {
			try { // ***** 5. 접속/연결끊기
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch(SQLException e) {
			}
		}		
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 06. 'code' 로 상품 조회 메소드
	public ArrayList<ProBean> Ccode(String code) {
		// 넘어온 code 는 사실, pcategory_fk = code(Category) + pcode(Product) 에 들어있다(포함으로 찾아야 한다).
		
		ArrayList<ProBean> list = new ArrayList<ProBean>();
		
		// ***** 3. SQL문 분석
		String sql = "select * from prodprod where pcategory_fk like ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,code+"%"); // code 로 시작하는 것으로 찾으라는 의미의 %
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			while(rs.next()) {
				int pnum = rs.getInt("pnum"); // pnum 칼럼의 내용을 가져온다
				String pname = rs.getString(2);
				String pcategory_fk = rs.getString("pcategory_fk"); // code + pcode
				String pcompany = rs.getString(4);
				String pimage = rs.getString("pimage");
				int pqtv = rs.getInt(6);
				int price = rs.getInt("price");
				String pspec = rs.getString(8);
				String pcontents = rs.getString("pcontents");
				int point = rs.getInt(10);
				String pinputdate = rs.getString("pinputdate");
				ProBean bean = new ProBean(pnum,pname,pcategory_fk,pcompany,pimage,pqtv,price,pspec,pcontents,point,pinputdate,0,0,0);
				list.add(bean);
			}

		} catch (SQLException e) {
		} finally {
			try { // ***** 5. 접속/연결끊기
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			}catch(SQLException e) {
			}
		}		
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
}
