package kr.or.studdit.vo;

public class InsertBoardVO {
	
	private int bor_code;
	private String bor_name;
	private String bor_tit;
	private String bor_con;
	private String bor_rpd;
	private String bor_rvd;
	private int bor_hit;
	private String std_id;
	private String std_nname;
	private String bor_area;
	

	
	
	public int getBor_code() {
		return bor_code;
	}
	public void setBor_code(int bor_code) {
		this.bor_code = bor_code;
	}
	public String getBor_rpd() {
		return bor_rpd;
	}
	public void setBor_rpd(String bor_rpd) {
		this.bor_rpd = bor_rpd;
	}
	public String getBor_rvd() {
		return bor_rvd;
	}
	public void setBor_rvd(String bor_rvd) {
		this.bor_rvd = bor_rvd;
	}
	public int getBor_hit() {
		return bor_hit;
	}
	public void setBor_hit(int bor_hit) {
		this.bor_hit = bor_hit;
	}
	public String getStd_nname() {
		return std_nname;
	}
	public void setStd_nname(String std_nname) {
		this.std_nname = std_nname;
	}
	public String getStd_id() {
		return std_id;
	}
	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}
	public String getBor_name() {
		return bor_name;
	}
	public void setBor_name(String bor_name) {
		this.bor_name = bor_name;
	}
	public String getBor_area() {
		return bor_area;
	}
	public void setBor_area(String bor_area) {
		this.bor_area = bor_area;
	}
	public String getBor_tit() {
		return bor_tit;
	}
	public void setBor_tit(String bor_tit) {
		this.bor_tit = bor_tit;
	}
	public String getBor_con() {
		return bor_con;
	}
	public void setBor_con(String bor_con) {
		this.bor_con = bor_con;
	}
}
