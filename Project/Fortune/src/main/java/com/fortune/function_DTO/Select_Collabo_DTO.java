package com.fortune.function_DTO;

/**
* 
* @Filename Name : History_DTO 
* @date:2016. 11. 26. 
* @author: 이성준
* @description : 사이드 바에 협업을 보여 주기 위해 만든 DTO 
*/
public class Select_Collabo_DTO {
	private String collabo_req_title;
	private int team_NO;
	private int collabo_no;
	private int collabo_req_index;
	private int collabo_req_no;
	private int dept_No;
	
	public Select_Collabo_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public Select_Collabo_DTO(String collabo_req_title, int team_NO, int collabo_no, int collabo_req_index,
			int collabo_req_no, int dept_No) {
		super();
		this.collabo_req_title = collabo_req_title;
		this.team_NO = team_NO;
		this.collabo_no = collabo_no;
		this.collabo_req_index = collabo_req_index;
		this.collabo_req_no = collabo_req_no;
		this.dept_No = dept_No;
	}




	public String getCollabo_req_title() {
		return collabo_req_title;
	}
	public void setCollabo_req_title(String collabo_req_title) {
		this.collabo_req_title = collabo_req_title;
	}
	public int getTeam_NO() {
		return team_NO;
	}
	public void setTeam_NO(int team_NO) {
		this.team_NO = team_NO;
	}
	public int getCollabo_no() {
		return collabo_no;
	}
	public void setCollabo_no(int collabo_no) {
		this.collabo_no = collabo_no;
	}
	public int getCollabo_req_index() {
		return collabo_req_index;
	}
	public void setCollabo_req_index(int collabo_req_index) {
		this.collabo_req_index = collabo_req_index;
	}
	public int getCollabo_req_no() {
		return collabo_req_no;
	}
	public void setCollabo_req_no(int collabo_req_no) {
		this.collabo_req_no = collabo_req_no;
	}
	public int getDept_No() {
		return dept_No;
	}
	public void setDept_No(int dept_No) {
		this.dept_No = dept_No;
	}




	@Override
	public String toString() {
		return "Select_Collabo_DTO [collabo_req_title=" + collabo_req_title + ", team_NO=" + team_NO + ", collabo_no="
				+ collabo_no + ", collabo_req_index=" + collabo_req_index + ", collabo_req_no=" + collabo_req_no
				+ ", dept_No=" + dept_No + "]";
	}
	
	
	
}
