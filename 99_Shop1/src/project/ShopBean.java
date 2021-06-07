package project;

import java.sql.SQLException;
import java.util.ArrayList;

public class ShopBean {
	
	// 전역변수
	private ArrayList<ProBean> clist; // ArrayList 타입의 장바구니 초기화
	
	// 기본생성자(호출 시 계속 생성되는 객체는 'useBean 액션태그 scope="session"' 으로 제한)
	public ShopBean() {
		clist = new ArrayList<ProBean>(); // ArrayList 타입의 변수 clist 는 장바구니를 관리
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 01. (장바구니담기, 즉시구매하기) 메소드
	public void insertShop(String pnum, String oqty) throws SQLException { // pnum:n번상품, oqty:n개주문
		ProDao dao = ProDao.getInstance(); // Singleton 메소드
		ProBean bean = dao.Pnum(pnum); // n번 상품의 모든 컬럼 조회
		
		// 장바구니에 추가되는 품목들의 수량이 통일되지 못하게 하는 for문
		for(int i=0; i<clist.size(); i++) {
			int cpnum = clist.get(i).getPnum(); // 장바구니번호
			if(cpnum == Integer.parseInt(pnum)) { // 장바구니번호 중 주문하려는 번호가 (추가되어) 있다면
				int cpqty = clist.get(i).getPqty(); // 장바구니재고량
				clist.get(i).setPqty(cpqty+Integer.parseInt(oqty)); // 장바구니재고량 + 추가주문수량 = 현재장바구니재고량
				clist.get(i).setTotalPoint(clist.get(i).getPoint() * (cpqty+Integer.parseInt(oqty))); // 장바구니포인트 * (현재장바구니재고량)
				clist.get(i).setTotalPrice(clist.get(i).getPrice() * (cpqty+Integer.parseInt(oqty))); // 장바구니가격 * (현재장바구니재고량)
				return; // 겹치는 상품은 넘어가지 못하는 return.
			}
		}
		// for문의 return 을 통과할 수 있는 것은, 기존 장바구니에 담겨있지 않은 새상품만 가능.
		
		bean.setPqty(Integer.parseInt(oqty)); // 재고량(추가주문수량)
		int totalPrice = bean.getPrice() * Integer.parseInt(oqty); // 가격 * 추가주문수량
		int totalPoint = bean.getPoint() * Integer.parseInt(oqty); // 포인트 * 추가주문수량
		bean.setTotalPrice(totalPrice);
		bean.setTotalPoint(totalPoint);
		
		clist.add(bean); // 드디어 상품 1개가 추가.
		// System.out.println("clist 갯수 : " + clist.size()); // 주문한 상품 갯수 확인
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 02. 장바구니 조회 메소드
	public ArrayList<ProBean> AllShop() {
		return clist;
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 03. 수정 메소드
	public void updateShop(String pnum, String oqty) {
		for(ProBean bean : clist) {
			if(bean.getPnum() == Integer.parseInt(pnum)) {
				bean.setPqty(Integer.parseInt(oqty));
				int totalPrice = bean.getPrice() * bean.getPqty();
				int totalPoint = bean.getPoint() * bean.getPqty();
				bean.setTotalPrice(totalPrice);
				bean.setTotalPoint(totalPoint);
			}
		}
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 04. 삭제 메소드
	public void deleteShop(String pnum) {
		for(ProBean bean : clist) {
			if(bean.getPnum() == Integer.parseInt(pnum)) {
				clist.remove(bean);
				break; // for문을 빠져나가는 break.
			}
		}
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
	// 05. 주문하면 장바구니 내용을 모두 삭제하는 메소드(display_calculate.jsp 와 관련이 있는 메소드)
	public void Initialization() {
		clist.clear(); // 1종류 상품 삭제시(remove), 장바구니(clist) 전체 삭제시(removeAllElements 혹은 clear)
	}
	
	// ──────────────────────────────────────────────────────────────────────────────
	
}
