package com.fortune.Table_DTO;

public class Join_DTO {
	private String user_id;
	private String user_password;
	private String user_name; 
	private String user_gender;
	private String user_date;
	private String user_phone;
	private String user_join;
	private int dept_no;
	private int team_no;
	private int position_no;
	private int role_no;
	private String role;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_date() {
		return user_date;
	}
	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_join() {
		return user_join;
	}
	public void setUser_join(String user_join) {
		this.user_join = user_join;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getTeam_no() {
		return team_no;
	}
	public void setTeam_no(int team_no) {
		this.team_no = team_no;
	}
	public int getRole_no() {
		return role_no;
	}
	public void setRole_no(int role_no) {
		this.role_no = role_no;
	}
	public int getPosition_no() {
		return position_no;
	}
	public void setPosition_no(int position_no) {
		this.position_no = position_no;
	}
	@Override
	public String toString() {
		return "Join_DTO [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_gender=" + user_gender + ", user_date=" + user_date + ", user_phone=" + user_phone
				+ ", user_join=" + user_join + ", dept_no=" + dept_no + ", team_no=" + team_no + ", role_no=" + role_no
				+ ", position_no=" + position_no +  ", role=" + role + "]";
	}
}
