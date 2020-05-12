package semi.vo.yr;

import java.sql.Date;

public class BiddingVo {
	private String a_title;
	private int a_check; //조회수
	private Date a_enddate;
	private String sel_Id;
	
	
	public BiddingVo(String a_title, int a_check, Date a_enddate, String sel_Id) {
		super();
		this.a_title = a_title;
		this.a_check = a_check;
		this.a_enddate = a_enddate;
		this.sel_Id = sel_Id;
	}
	public String getA_title() {
		return a_title;
	}
	public void setA_title(String a_title) {
		this.a_title = a_title;
	}
	public int getA_check() {
		return a_check;
	}
	public void setA_check(int a_check) {
		this.a_check = a_check;
	}
	public Date getA_enddate() {
		return a_enddate;
	}
	public void setA_enddate(Date a_enddate) {
		this.a_enddate = a_enddate;
	}
	public String getSel_Id() {
		return sel_Id;
	}
	public void setSel_Id(String sel_Id) {
		this.sel_Id = sel_Id;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return getA_title() + "," + getA_check() + "," + getA_enddate() + "," + getSel_Id();
	}
	
}
