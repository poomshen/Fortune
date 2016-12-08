package com.fortune.request_DAO;

import java.sql.SQLException;
import java.util.List;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.function_DTO.Search_Page_DTO;
import com.fortune.function_DTO.Select_Collabo_DTO;
import com.fortune.request_DTO.Passion_DTO;



public interface ProDao {

		//게시물 개수
		public int requestCount(Search_Page_DTO Serarch) throws ClassNotFoundException, SQLException;
		//전체 게시물
		//public List<Request_DTO> getRequest(int page, String field, String query, String st_query,String memo,String search) throws ClassNotFoundException, SQLException;
		public List<Request_DTO> getRequest(Search_Page_DTO Serarch) throws ClassNotFoundException, SQLException;
		//게시물 삭제
		public String delete(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//게시물 수정
		public int update(Request_DTO n) throws ClassNotFoundException, SQLException;
		//게시물 상세
		public Request_DTO getProDto(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//게시물 입력
		public int insert(Request_DTO n) throws ClassNotFoundException, SQLException;
		//수락 하기
		public int accept(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//거절 하기
		public int refuse(String collabo_req_index,String collabo_req_text) throws ClassNotFoundException, SQLException;
		//게시물 입력 요청
		public int insertResponse(With_DTO n) throws ClassNotFoundException, SQLException;
		//게시물 상세 요청
		public Request_DTO detailResponse(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//전체 게시물 협업
		public List<With_DTO> listResponse(int page, String field, String query) throws ClassNotFoundException, SQLException;	
		//담당자 보여주는 클래스
		public With_DTO managerDto(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//담당자 선택 
		public int updatemanager(With_DTO m)throws ClassNotFoundException, SQLException;
		//수신자 부장 리스트 
		public List<Passion_DTO> listEffect() throws ClassNotFoundException, SQLException;
		
		
		//담당자 팀장 리스트 
		public List<Join_DTO> listManager(String dept_no) throws ClassNotFoundException, SQLException;
		//게시물 대기 , 수락 , 거절 리스트 
		public Request_DTO kindState(String collabo_req_state) throws ClassNotFoundException, SQLException;
		//수락 하기
		//public int manager(String collabo_req_index) throws ClassNotFoundException, SQLException;
		
		//작성자 이성준
		//2016-11-26
		//사이드바에 자신의 협업들 보여 주기
		public List<Select_Collabo_DTO> selectCollaboList(String user_id);
		public List<Select_Collabo_DTO> selectCollaboList2(int deptno);
		
		//작성자 이성준
		//2016-12-01
		// 협업 리스트 보여주기 팀원 권한으로
		public List<With_DTO> listResponse2(int page, String field, List<String>  query) throws ClassNotFoundException, SQLException;	
		
		public List<String> selectTeamMGR(int TeamMGR) throws ClassNotFoundException, SQLException;
		
		public String selectReqText(int collabo_req_index);
		
		/*
		 	작성자 :이성준
		 	2016-12-06
		 	완료된 일정 보기
	*/
		public List<Select_Collabo_DTO> finishCollaboList(String user_id);
		public List<Select_Collabo_DTO> finishCollaboList2(int deptno);
		/*
	 	작성자 :이성준
	 	2016-12-07
	 	프로젝트 개수 보기
		 */
		public int collaboCount(String field, List<String>  query) ;
		
		public With_DTO myProDetail(String collabo_no);
}
