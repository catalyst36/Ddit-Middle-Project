package kr.or.studdit.vo;

// 학생
public class StudentVO {
	private String std_id;
	private String std_pass;
	private String std_nname;
	private String std_tier;
	private String sat_num; 
	private int std_pow;
	
	public String getSat_phot() {
		return sat_phot;
	}
	public void setSat_phot(String sat_phot) {
		this.sat_phot = sat_phot;
	}
	private String sat_phot;
	
	public String getStd_tier() {
		return std_tier;
	}
	public void setStd_tier(String std_tier) {
		this.std_tier = std_tier;
	}
	public String getStd_id() {
		return std_id;
	}
	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}
	public String getStd_pass() {
		return std_pass;
	}
	public void setStd_pass(String std_pass) {
		this.std_pass = std_pass;
	}
	public String getStd_nname() {
		return std_nname;
	}
	public void setStd_nname(String std_nname) {
		this.std_nname = std_nname;
	}
	public String getSat_num() {
		return sat_num;
	}
	public void setSat_num(String sat_num) {
		this.sat_num = sat_num;
	}
	public int getStd_pow() {
		return std_pow;
	}
	public void setStd_pow(int std_pow) {
		this.std_pow = std_pow;
	}
	
	
}
