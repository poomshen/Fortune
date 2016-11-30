package com.fortune.function_DTO;
/*
	* @Filename Name : ProgectName_DTO 
* @date:2016. 11. 30. 
* @author: 이성준
* @description : 히스토리를 남기기 위해 만든 초기 (헙업요청 이름 ) DTO 
*/
public class ProgectName_DTO {
	private String  project_name ;
	private int collabo_req_no;
	
	
	public ProgectName_DTO() {
	}
	
	public ProgectName_DTO(String project_name, int collabo_req_no) {
		super();
		this.project_name = project_name;
		this.collabo_req_no = collabo_req_no;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

	public int getCollabo_req_no() {
		return collabo_req_no;
	}

	public void setCollabo_req_no(int collabo_req_no) {
		this.collabo_req_no = collabo_req_no;
	}

	@Override
	public String toString() {
		return "ProgectName_DTO [project_name=" + project_name
				+ ", collabo_req_no=" + collabo_req_no + "]";
	}
	
	
	
}
