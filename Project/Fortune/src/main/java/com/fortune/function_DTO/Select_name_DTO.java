package com.fortune.function_DTO;

public class Select_name_DTO {
	private String dept_name;
	private String team_name;
	private String user_name;
	private String user_id;
	
	public Select_name_DTO() {
		// TODO Auto-generated constructor stub
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "[" + dept_name + "]["
				+ team_name + "]" + user_name + "";
	}
	
	

}
