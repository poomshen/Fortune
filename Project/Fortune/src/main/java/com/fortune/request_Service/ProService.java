package com.fortune.request_Service;


import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;
import com.fortune.request_DAO.ProDao;





@Service
public class ProService {

	@Autowired
	private SqlSession sqlsession;
	
	
	public List<Request_DTO> getRequest(String pg , String f , String q ) throws ClassNotFoundException , SQLException {
		
		//게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "collabo_req_title";
		String query ="%%";
		//////////////////////////////////////
		if(pg != null && pg.equals("")){
			page = Integer.parseInt(pg);
		}
		if(f != null && f.equals("")){
			field = f;
		}
		if(q != null && q.equals("")){
			query = q;
		}
		
		System.out.println(page + " / " + field + " / " + query);
		
		//Mybatis 적용
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		List<Request_DTO> list= proDao.getRequest(page, field, query);
		
		return list;
	}
		
	//상세보기
	
	
	public Request_DTO ProDetail(String collabo_req_index) throws ClassNotFoundException, SQLException{
		 
		 ProDao proDao = sqlsession.getMapper(ProDao.class);
		 Request_DTO proDto = proDao.getProDto(collabo_req_index);
		 
		 
		 //Tiles
		  return proDto;
		 //View
		
	 }
	
	//글요청
	 public Request_DTO regRequest(Request_DTO n, HttpServletRequest request)
			   throws IOException, ClassNotFoundException, SQLException {
	 
		 System.out.println("실제 글 등록 처리"); 
		    System.out.println("n : " + n.getCollabo_req_ID()); 
		    System.out.println("n : " + n.getCollabo_req_index());
		    System.out.println("n : " + n.getCollabo_req_no()); 
		    System.out.println("n : " + n.getCollabo_req_state()); 
		   
		  // 실DB저장
	
		  ProDao proDao = sqlsession.getMapper(ProDao.class);
		
		  proDao.insert(n);
		 

		  return n;
	
		 
	 }
	 
	 //글 삭제
	 public String ProDel(String collabo_req_index) throws ClassNotFoundException,
	   SQLException {
	  System.out.println("collabo_req_index : " + collabo_req_index);
	  ProDao proDao = sqlsession.getMapper(ProDao.class);
	  proDao.delete(collabo_req_index); //여기에서 delete 사용하여 삭제 함
	 return collabo_req_index;
	 }
	 
	//글 수락
		 public int Accept(String collabo_req_index) throws ClassNotFoundException,
		   SQLException {
		  System.out.println("seq : " + collabo_req_index);
		  ProDao proDao = sqlsession.getMapper(ProDao.class);
		 int re =  proDao.accept(collabo_req_index); 
		 return re;
		 } 
		 
		//글 거절
		 public int Refuse(String collabo_req_index) throws ClassNotFoundException,
		   SQLException {
		  System.out.println("seq : " + collabo_req_index);
		  ProDao proDao = sqlsession.getMapper(ProDao.class);
		  int re = proDao.refuse(collabo_req_index); //여기에서 delete 사용하여 삭제 함
		 return re;
		 }
	 
	
		//글요청
		 public With_DTO regResponse(With_DTO n)
				   throws IOException, ClassNotFoundException, SQLException {
		 
			 System.out.println("실제 글 등록 처리"); 
			
			    System.out.println("n : " + n.getCollabo_req_no()); 
			    System.out.println("n : " + n.getUser_ID()); 
			    System.out.println("n : "+n.getCollabo_req_index());
			    System.out.println(n.toString());
			   /* System.out.println(n.getCollabo_end2());
			    System.out.println(n.getCollabo_start2());*/
			    //아주좋소
			  /* n.setCollabo_end(java.sql.Timestamp.valueOf(n.getCollabo_end2()));  */
			  // 실DB저장
		
			  ProDao proDao = sqlsession.getMapper(ProDao.class);
			  proDao.insertResponse(n);
			  return n;
		
			 
		 }	 
		 
		 
		 
		 
		 
	
	
	 
	}
