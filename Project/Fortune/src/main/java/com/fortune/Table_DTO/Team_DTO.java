package com.fortune.Table_DTO;

public class Team_DTO {
	private int team_no;
	private int dept_no;
	private String team_name;
		
	public Team_DTO() {
	
	}
	
	public Team_DTO(int team_no, int dept_no, String team_name) {
		
		this.team_no = team_no;
		this.dept_no = dept_no;
		this.team_name = team_name;
	}
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	
	@Override
	public String toString() {
		return "Team_DTO [team_no=" + team_no + ", dept_no=" + dept_no + ", team_name=" + team_name + "]";
	}
	
}
