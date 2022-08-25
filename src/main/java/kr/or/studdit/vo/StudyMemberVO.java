package kr.or.studdit.vo;

// 스터디방 회원정보
public class StudyMemberVO {
	private String bor_code;
	private String std_id;
	private int stm_chk;
	private String stm_day;
	
	public String getBor_code() {
		return bor_code;
	}
	public void setBor_code(String bor_code) {
		this.bor_code = bor_code;
	}
	public String getStd_id() {
		return std_id;
	}
	public void setStd_id(String std_id) {
		this.std_id = std_id;
	}
	public int getStm_chk() {
		return stm_chk;
	}
	public void setStm_chk(int stm_chk) {
		this.stm_chk = stm_chk;
	}
	public String getStm_day() {
		return stm_day;
	}
	public void setStm_day(String stm_day) {
		this.stm_day = stm_day;
	}
	
}
