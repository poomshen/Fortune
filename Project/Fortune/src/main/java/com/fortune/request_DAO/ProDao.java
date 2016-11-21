package com.fortune.request_DAO;

import java.sql.SQLException;
import java.util.List;

import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;



public interface ProDao {

		//게시물 개수
		public int requestCount(String field, String query) throws ClassNotFoundException, SQLException;
		//전체 게시물
		public List<Request_DTO> getRequest(int page, String field, String query) throws ClassNotFoundException, SQLException;
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
		public int refuse(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//게시물 입력 요청
		public int insertResponse(With_DTO n) throws ClassNotFoundException, SQLException;
		//게시물 상세 요청
		public Request_DTO detailResponse(String collabo_req_index) throws ClassNotFoundException, SQLException;
		//전체 게시물 협업
		public List<With_DTO> listResponse(int page, String field, String query) throws ClassNotFoundException, SQLException;	
		//담당자 선택 
		public int insertmanager(String collabo_req_index)throws ClassNotFoundException, SQLException;

		
}
