package com.fortune.Table_DTO;

public class Role_DTO {
	private String role;
	private int role_no;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getRole_no() {
		return role_no;
	}
	public void setRole_no(int role_no) {
		this.role_no = role_no;
	}
	@Override
	public String toString() {
		return "Role_DTO [role=" + role + ", role_no=" + role_no + "]";
	}
}
