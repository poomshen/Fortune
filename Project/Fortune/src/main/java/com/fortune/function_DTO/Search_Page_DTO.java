package com.fortune.function_DTO;

public class Search_Page_DTO {
	private int pg;  ///페이지
	private String f;  // 찾을 컬럼 아이디
	private String q; // 찾을 아이디
	private String st; //찾을 날짜?
	private String rs; //넘겨줄 형식
	private String me; //찾을 컬럼 (내용,제목)
	private String se; //찾을  메모??
	private String collabo_req_index;
	private String state; //상태
	private String fieldnot; //찾을 컬럼 아이디의 반대
	
	
	public Search_Page_DTO() {
		// TODO Auto-generated constructor stub
	}
	
	

	public Search_Page_DTO(int pg, String f, String q, String st, String me,
			String se) {
		super();
		this.pg = pg;
		this.f = f;
		this.q = q;
		this.st = st;
		this.me = me;
		this.se = se;
	}



	public Search_Page_DTO(int pg, String f, String q, String st, String rs,
			String me, String se, String collabo_req_index, String state) {
		super();
		this.pg = pg;
		this.f = f;
		this.q = q;
		this.st = st;
		this.rs = rs;
		this.me = me;
		this.se = se;
		this.collabo_req_index = collabo_req_index;
		this.state = state;
	}



	public int getPg() {
		return pg;
	}


	public void setPg(int pg) {
		this.pg = pg;
	}


	public String getF() {
		return f;
	}


	public void setF(String f) {
		this.f = f;
		if(f .toUpperCase().equals(("collabo_req_id").toUpperCase())){
			this.fieldnot = "user_id";
		}else {
			this.fieldnot ="collabo_req_id";
		}
	}


	public String getQ() {
		return q;
	}


	public void setQ(String q) {
		this.q = q;
	}


	public String getSt() {
		return st;
	}


	public void setSt(String st) {
		this.st = st;
	}


	public String getRs() {
		return rs;
	}


	public void setRs(String rs) {
		this.rs = rs;
	}


	public String getMe() {
		return me;
	}


	public void setMe(String me) {
		this.me = me;
	}


	public String getSe() {
		return se;
	}


	public void setSe(String se) {
		this.se = se;
	}


	public String getCollabo_req_index() {
		return collabo_req_index;
	}


	public void setCollabo_req_index(String collabo_req_index) {
		this.collabo_req_index = collabo_req_index;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}
	
	
	


	
	
}
