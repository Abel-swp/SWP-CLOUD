package project;

public class OrderBean {
	
//	원래 변수명
//	orderId number, -- 주문번호(orderseq)
//	memno number, -- 회원번호
//	pnum number, -- 상품번호
//	qty number, -- 수량
//	amount number -- 전체가격
	
	// 조금 다르게 만들 것임, 쇼핑 내역을 위한 장소
	private String mname; // 고객명
	private String mid; // 고객아이디
	private String pname; // 상품명
	private int qty; // 판매수량
	private int amount; // 판매금액
	
	// Setter & Getter
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
