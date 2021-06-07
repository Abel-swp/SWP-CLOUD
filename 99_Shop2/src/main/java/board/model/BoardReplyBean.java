package board.model;

public class BoardReplyBean {
	private int rno;
	private int no;
	private String rcontent;
	private String rreg_date;
	private int ref;
	private int relevel;
	private int rePageSize;
	private String nickname;
	
	

	public int getRePageSize() {
		return rePageSize;
	}

	public void setRePageSize(int rePageSize) {
		this.rePageSize = rePageSize;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

	public BoardReplyBean() {
		
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRreg_date() {
		return rreg_date;
	}

	public void setRreg_date(String rreg_date) {
		this.rreg_date = rreg_date;
	}
	
	public void setRef(int ref) {
		this.ref = ref;
	}
	
	public int getRef() {
		return ref;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
