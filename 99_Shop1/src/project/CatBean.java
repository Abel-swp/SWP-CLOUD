package project;

public class CatBean {
	
	private int cnum;
	private String ccode;
	private String cname;
	
	public CatBean() {
		
	}

	public CatBean(int cnum, String ccode, String cname) {
		super();
		this.cnum = cnum;
		this.ccode = ccode;
		this.cname = cname;
	}

	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCcode() {
		return ccode;
	}
	public void setCcode(String ccode) {
		this.ccode = ccode;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}

}
