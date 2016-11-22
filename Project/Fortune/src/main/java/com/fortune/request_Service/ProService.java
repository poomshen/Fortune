package com.fortune.request_Service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fortune.Table_DTO.Join_DTO;
import com.fortune.Table_DTO.Request_DTO;
import com.fortune.Table_DTO.With_DTO;

import com.fortune.request_DAO.ProDao;

@Service
public class ProService {

	@Autowired
	private SqlSession sqlsession;

	public List<Request_DTO> getRequest(String pg, String f, String q, HttpSession session)
			throws ClassNotFoundException, SQLException {
		System.out.println("집에 갑시다.");

		// 게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "collabo_req_ID";
		Join_DTO ids = (Join_DTO) session.getAttribute("info");
		// 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
		String query = "%" + ids.getUser_id() + "%";
		//////////////////////////////////////
		if (pg != null && pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		if (f != null && f.equals("")) {
			field = f;
		}
		if (q != null && q.equals("")) {
			query = q;
		}

		System.out.println(page + " / " + field + " / " + query);

		// Mybatis 적용
		ProDao proDao = sqlsession.getMapper(ProDao.class);

		List<Request_DTO> list = proDao.getRequest(page, field, query);

		return list;
	}

	// 협업요청 상세보기

	public Request_DTO ProDetail(String collabo_req_index) throws ClassNotFoundException, SQLException {

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		Request_DTO proDto = proDao.getProDto(collabo_req_index);

		// Tiles
		return proDto;
		// View

	}

	// 글요청
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

	// 글 삭제
	public String ProDel(String collabo_req_index) throws ClassNotFoundException, SQLException {
		System.out.println("collabo_req_index : " + collabo_req_index);
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		proDao.delete(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
		return collabo_req_index;
	}

	// 글 수락
	public Request_DTO Accept(String collabo_req_index) throws ClassNotFoundException, SQLException {
		System.out.println("seq : " + collabo_req_index);
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		proDao.accept(collabo_req_index);
		Request_DTO proDto = proDao.detailResponse(collabo_req_index); // 다른테이블
																		// 가져옴
																		// index값을
																		// 받아온
																		// 정보를
		System.out.println("index : " + proDto.getCollabo_req_index());
		System.out.println("no : " + proDto.getCollabo_req_no());

		return proDto;
	}

	// 글 거절
	public int Refuse(String collabo_req_index) throws ClassNotFoundException, SQLException {
		System.out.println("seq : " + collabo_req_index);
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		int re = proDao.refuse(collabo_req_index); // 여기에서 delete 사용하여 삭제 함
		return re;
	}

	// 글요청
	public Request_DTO regResponse(With_DTO n, String collabo_req_index)
			throws IOException, ClassNotFoundException, SQLException {

		System.out.println("실제 글 등록 처리");

		System.out.println("n : " + n.getCollabo_req_no());
		System.out.println("n : " + n.getUser_ID());
		System.out.println("n : " + n.getCollabo_req_index());
		System.out.println(n.toString());
		/*
		 * System.out.println(n.getCollabo_end2());
		 * System.out.println(n.getCollabo_start2());
		 */
		// 아주좋소
		/* n.setCollabo_end(java.sql.Timestamp.valueOf(n.getCollabo_end2())); */
		// 실DB저장

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		proDao.insertResponse(n);
		Request_DTO proDto = proDao.detailResponse(collabo_req_index);

		return proDto;

	}

	// 글수정 화면
	@RequestMapping(value = "proEdit.htm", method = RequestMethod.GET)
	public Request_DTO proEdit(String collabo_req_index) throws ClassNotFoundException, SQLException {

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		Request_DTO req_Dto = proDao.getProDto(collabo_req_index);

		return req_Dto;
	}

	// 실제 글수정
	@RequestMapping(value = "noticeEdit.htm", method = RequestMethod.POST)
	public Request_DTO proEdit(Request_DTO n) throws ClassNotFoundException, SQLException, IOException {

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		proDao.update(n);
		return n;

	}

	//////////////////////////////////////////////////////////////

	// 전체 협업 리스트
	public List<With_DTO> listResponse(String pg, String f, String q, HttpSession session)
			throws ClassNotFoundException, SQLException {
		System.out.println("집에 갑시다.");

		// 게시판 기본 설정(기본값 처리)/////////////
		int page = 1;
		String field = "collabo_req_ID";
		Join_DTO ids = (Join_DTO) session.getAttribute("info");
		// 아무리 생각해 봐도 세션이 필요하다고 생각해서 여기서 중단함.
		String query = "%" + ids.getUser_id() + "%";
		//////////////////////////////////////
		if (pg != null && pg.equals("")) {
			page = Integer.parseInt(pg);
		}
		if (f != null && f.equals("")) {
			field = f;
		}
		if (q != null && q.equals("")) {
			query = q;
		}

		System.out.println(page + " / " + field + " / " + query);

		// Mybatis 적용
		ProDao proDao = sqlsession.getMapper(ProDao.class);

		List<With_DTO> list = proDao.listResponse(page, field, query);

		return list;
	}

	// 담당자 화면
	public With_DTO managerDto(String collabo_req_index) 
			throws ClassNotFoundException, SQLException {

		ProDao proDao = sqlsession.getMapper(ProDao.class);
		
		With_DTO req_Dto = proDao.managerDto(collabo_req_index);

		return req_Dto;
	}

	// 담당자를 선택하는 역할을 한다.
	public With_DTO InsertManager(With_DTO m) throws ClassNotFoundException, SQLException {
		System.out.println("tostring : " + m.toString());
		ProDao proDao = sqlsession.getMapper(ProDao.class);
		 proDao.updatemanager(m);
		return m;
	}

}
