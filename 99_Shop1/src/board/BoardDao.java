package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import project.OrderBean;

public class BoardDao {
	
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@localhost:1521:orcl";
	private String dbid="jspid";
	private String dbpw="jsppw";
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private static BoardDao instance;
	
	private BoardDao() {
		try {
			// ***** 1. Oracle 드라이버 로드
			Class.forName(driver);
			// ***** 2. 계정에 접속
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (ClassNotFoundException e) {
		} catch (SQLException e) {
		}
	}
	
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 01. 전체 조회를 하기 전에 전체 레코드 갯수를 세는 메소드('게시판'에서 새롭게 추가됨)
	public int AllAriticlesCount() {
		
		int count = 0;
		
		String sql = "select count(*) as cnt from boaboa";
		try {
			// ***** 3. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			if(rs.next()) { // 1번만 받으면 되기 때문에 if조건문으로도 가능.
				count = rs.getInt("cnt"); // 'count(*)'가 아닌, 별칭으로 만들어진 칼럼인 'cnt'를 가져옴.
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		System.out.println("전체갯수 : " + count);
		return count;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 02. 전체 조회를 위한 메소드
	public ArrayList<BoardBean> AllArticles(int start, int end) {
		
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();

		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from boaboa ";
		sql += "order by ref desc, re_step asc))";
		sql += "where rank between ? and ?";
		
		try {
			// ***** 3. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				BoardBean bean = new BoardBean(num,writer,email,subject,passwd,reg_date,readcount,ref,re_step,re_level,content,ip);
				list.add(bean);
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}		
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 03. 데이터 삽입을 위한 메소드
	public int insertArticle(BoardBean bean) {
		
		int cnt = -1;
		
		String sql = "insert into boaboa(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip)" 
				+ " values(boa_seq.nextval,?,?,?,?,?,boa_seq.currval,?,?,?,?)";
		try {
			// ***** 3. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, bean.getWriter());
			ps.setString(2, bean.getEmail());
			ps.setString(3, bean.getSubject());
			ps.setString(4, bean.getPasswd());
			ps.setTimestamp(5, bean.getReg_date());
			ps.setInt(6, 0); // re_step
			ps.setInt(7, 0); // re_level
			ps.setString(8, bean.getContent());
			ps.setString(9, bean.getIp());

			// ***** 4. SQL문 실행
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

	// 04. 이미 테이블에 입력된 값을 content.jsp 의 초기값으로 가져오기 위한 select 기능을 가진 메소드
	// updateForm.jsp 에서만 이곳을 찾았지만, 이제는 content.jsp 에서도 이곳을 사용.
	public BoardBean getBoardByNum1(int numnum) {

		BoardBean bean = null;
		
		String sql2 = "update boaboa set readcount = readcount + 1 where num=?";
		String sql = "select * from boaboa where num=?";
		try {
			// ***** 3-1. SQL문 분석
			ps = conn.prepareStatement(sql2);
			
			ps.setInt(1,numnum);
			
			// ***** 3-2. SQL문 실행
			ps.executeUpdate();
			
			// ***** 4-1. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,numnum);
			
			// ***** 4-2. SQL문 실행
			rs = ps.executeQuery(); // rs = 전체
			if(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				bean = new BoardBean(num,writer,email,subject,passwd,reg_date,readcount,ref,re_step,re_level,content,ip);
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return bean;
	}
			
	// ──────────────────────────────────────────────────────────────────────────────

	// 05. 이미 테이블에 입력된 값을 updateForm.jsp 의 초기값으로 가져오기 위한 select 기능을 가진 메소드
	// 여태까지는 updateForm.jsp 에서만 이곳을 찾았지만, 이제는 content.jsp 에서도 이곳을 사용.
	public BoardBean getBoardByNum2(int numnum) {

		BoardBean bean = null;
		
		String sql = "select * from boaboa where num=?";
		try {
			// ***** 3. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,numnum);
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			if(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				bean = new BoardBean(num,writer,email,subject,passwd,reg_date,readcount,ref,re_step,re_level,content,ip);
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return bean;
	}
			
	// ──────────────────────────────────────────────────────────────────────────────

	// 06. 데이터 수정을 위한 메소드
	public int updateData(BoardBean bean) {
		
		int cnt = -1;
		
		String sql2 = "select passwd from boaboa where num=?"; // 기존 비밀번호와 비교하기
		String dbpw = null;
		
		String sql = "update boaboa set writer=?, email=?, subject=?, passwd=?, content=? where num=?";
		try {
			// ***** 3-1. SQL문 분석
			ps = conn.prepareStatement(sql2);
			
			ps.setInt(1,bean.getNum());
			
			// ***** 3-2. SQL문 실행
			rs = ps.executeQuery(); // rs = passwd
			
			if(rs.next()) {
				dbpw = rs.getString("passwd");
				if(dbpw.equals(bean.getPasswd())) {
					// ***** 4-1. SQL문 분석
					ps = conn.prepareStatement(sql);
					
					ps.setString(1,bean.getWriter());
					ps.setString(2,bean.getEmail());
					ps.setString(3,bean.getSubject());
					ps.setString(4,bean.getPasswd());
					ps.setString(5,bean.getContent());
					ps.setInt(6,bean.getNum());
					
					// ***** 4-2. SQL문 실행
					cnt = ps.executeUpdate();
				}
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

	// 07. 데이터 삭제를 위한 메소드
	public int deleteData(int num, String passwd) {
		
		int cnt = -1;
		
		String sql2 = "select passwd from boaboa where num=?"; // 기존 비밀번호와 비교하기
		String dbpw = null;
		
		String sql = "delete from boaboa where num=?";
		try {
			// ***** 3-1. SQL문 분석
			ps = conn.prepareStatement(sql2);
			
			ps.setInt(1, num);
			
			// ***** 3-2. SQL문 실행
			rs = ps.executeQuery(); // rs = passwd
			
			if(rs.next()) {
				dbpw = rs.getString("passwd");
				if(dbpw.equals(passwd)) {
					// ***** 4-1. SQL문 분석
					ps = conn.prepareStatement(sql);
					
					ps.setInt(1, num);
					
					// ***** 4-2. SQL문 실행
					cnt = ps.executeUpdate();
				}
			}

		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {

			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 08. 답글 삽입을 위한 메소드
	public int insertReply(BoardBean bean) {
		
		int cnt = -1;
		
		String sql2 = "update boaboa set re_step = re_step+1 where ref=? and re_step > ?";
		String sql = "insert into boaboa(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip)"
					+ " values(boa_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			// ***** 3-1. SQL문 분석
			ps = conn.prepareStatement(sql2);
			
			ps.setInt(1, bean.getRef());
			ps.setInt(2, bean.getRe_step());
			
			// ***** 3-2. SQL문 실행
			ps.executeUpdate();
			
			// ***** 4-1. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,bean.getWriter());
			ps.setString(2,bean.getEmail());
			ps.setString(3,bean.getSubject());
			ps.setString(4,bean.getPasswd());
			ps.setTimestamp(5,bean.getReg_date());
			ps.setInt(6, bean.getRef());
			
			int re_step = bean.getRe_step();
			re_step++;
			ps.setInt(7, re_step);
			
			int re_level = bean.getRe_level();
			re_level++;
			ps.setInt(8, re_level);
			
			ps.setNString(9, bean.getContent());
			ps.setNString(10, bean.getIp());
			
			// ***** 4-2. SQL문 실행
			cnt = ps.executeUpdate();
		
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		return cnt;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

	// 09.
	public int getCount(String keyWord, String searchWord) {

		int count = 0;
		
		String sql = "select count(*) as cnt from boaboa where " + keyWord + " like ?";
		try {
			// ***** 3. SQL문 분석
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,"%"+searchWord+"%");
			
			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		System.out.println("count : " + count);
		return count;
	}
			
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 10.
	public ArrayList<BoardBean> getBoardSearch(int start, int end, String kw, String sw) {
		
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		System.out.println(kw+"/"+sw);
		
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from boaboa ";
		sql += "order by ref desc, re_step asc))";
		sql += "where (rank between ? and ?) and ("+kw+" like ?)";
//		String sql = "select * from boaboa where " + keyWord + " like ? order by ref desc, re_step asc limit ?,?";
		try {
			// ***** 3. SQL문 분석
			ps = conn.prepareStatement(sql);
			
//			ps.setString(1,"%"+searchWord+"%");
//			ps.setInt(2,pageSize*(pageNum-1));
//			ps.setInt(3,pageSize);
			ps.setInt(1,start);
			ps.setInt(2,end);
			ps.setString(3,"%"+sw+"%");

			// ***** 4. SQL문 실행
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String content = rs.getString("content");
				String ip = rs.getString("ip");
				BoardBean bean = new BoardBean(num,writer,email,subject,passwd,reg_date,readcount,ref,re_step,re_level,content,ip);
				list.add(bean);
			}
			
		} catch (SQLException e) {
		} finally {
			try {
				// ***** 5. 접속/연결끊기
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
//				if(conn!=null)
//					conn.close();
			}catch(SQLException e) {
			}
		}
		// System.out.println(list.size());
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────

}
