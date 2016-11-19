package com.fortune.Table_DTO;

public class Join_DTO {
	private String id;
	private String pwd;
	private String name; 
	private String gender;
	private String birthday;
	private String phone;
	private String enterdate;
	private int deptno;
	private int jobnum;
	private int teamnum;
	private int rolenum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEnterdate() {
		return enterdate;
	}
	public void setEnterdate(String enterdate) {
		this.enterdate = enterdate;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public int getJobnum() {
		return jobnum;
	}
	public void setJobnum(int jobnum) {
		this.jobnum = jobnum;
	}
	public int getTeamnum() {
		return teamnum;
	}
	public void setTeamnum(int teamnum) {
		this.teamnum = teamnum;
	}
	public int getRolenum() {
		return rolenum;
	}
	public void setRolenum(int rolenum) {
		this.rolenum = rolenum;
	}
	@Override
	public String toString() {
		return "Join_DTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", birthday="
				+ birthday + ", phone=" + phone + ", enterdate=" + enterdate + ", deptno=" + deptno + ", jobnum="
				+ jobnum + ", teamnum=" + teamnum + ", rolenum=" + rolenum + "]";
	}
	
	
	
}
