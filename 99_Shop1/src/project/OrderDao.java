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

public class OrderDao {
	
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	// private static OrderDao instance; // 이번에는 Singleton 메소드 대신 useBean 액션태그의 scope="session" 으로 대체
	
	public OrderDao() {
		System.out.println("OrderDao() 기본생성자");
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
		} catch (SQLException e) {
		}
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 01.
	public int insertOrd(ArrayList<ProBean> list, int mnomno) {
		
		int cnt = 0;
		
		for(int i=0; i<list.size(); i++) {
			String sql = "insert into ord(orderId,memno,pnum,qty,amount) values(o_seq.nextval,?,?,?,?)";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, mnomno); // 회원번호
				ps.setInt(2, list.get(i).getPnum()); // 상품번호
				ps.setInt(3, list.get(i).getPqty()); // 수량
				ps.setInt(4, list.get(i).getTotalPrice()); // 전체가격
				
				cnt += ps.executeUpdate();
				
			} catch (SQLException e) {
			} finally {
				try {
					if(ps != null) {
						ps.close();
					}
				} catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;
	}

	// ──────────────────────────────────────────────────────────────────────────────
	
	// 02.
	public ArrayList<OrderBean> JoinOrd(String memid) {
		
		ArrayList<OrderBean> list = new ArrayList<OrderBean>();
		
		String sql = "select h.name mname, h.id mid, p.pname, o.qty, o.amount " + 
					 " from (healthy h join ord o on h.no = o.memno) join prodprod p " + 
					 " on o.pnum = p.pnum " + 
					 " where h.id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, memid);
			
			rs = ps.executeQuery();
			System.out.println(rs);
			
			while(rs.next()) {
				OrderBean ob = new OrderBean();
				ob.setMname(rs.getString("mname"));
				ob.setMid(rs.getString("mid"));
				ob.setPname(rs.getString("pname"));
				ob.setQty(rs.getInt("qty"));
				ob.setAmount(rs.getInt("amount"));
				list.add(ob);
			}
		} catch (SQLException e) {
		}
		return list;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
}
